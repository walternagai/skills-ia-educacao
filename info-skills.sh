#!/usr/bin/env bash
# info-skills.sh — informa o estado da instalação do acervo em cada CLI de IA
# Uso: ./info-skills.sh [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--verbose] [--json]
# Sem flags: informa os CLIs instalados no computador (auto-detect).
# --all: informa todos os destinos, mesmo sem o CLI instalado.
# Códigos de saída: 0 = acervo instalado (parcial conta como OK); 1 = nada instalado.
# Compatível com bash 3.2 (macOS), Linux e Git Bash/WSL2 (Windows).
set -u

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"
AGENTS_SRC="$REPO_DIR/.opencode/agents"
AGENTS_DIR="$HOME/.config/opencode/agents"

TARGETS=""
VERBOSE=0

# --- destinos por CLI (fonte: docs oficiais; mesmos do install-skills.sh) ---
# (funções case em vez de arrays associativos: compatíveis com bash 3.2 do macOS)
dest_of() {
  case "$1" in
    claude) echo "$HOME/.claude/skills" ;;
    opencode) echo "$HOME/.config/opencode/skills" ;;
    codex) echo "$HOME/.agents/skills" ;;
    antigravity) echo "$HOME/.gemini/antigravity/skills" ;;
    antigravity-cli) echo "$HOME/.gemini/antigravity-cli/skills" ;;
    gemini) echo "$HOME/.gemini/skills" ;;
  esac
}
bin_of() {
  case "$1" in
    claude) echo "claude" ;;
    opencode) echo "opencode" ;;
    codex) echo "codex" ;;
    antigravity|antigravity-cli) echo "antigravity" ;;
    gemini) echo "gemini" ;;
  esac
}
# caminho de conferência por CLI (comando do manual, Cap. 4)
check_cmd_of() {
  case "$1" in
    claude) echo 'ls ~/.claude/skills | grep -c ia-educacao' ;;
    opencode) echo 'ls ~/.config/opencode/skills | grep -c ia-educacao' ;;
    codex) echo 'ls ~/.agents/skills | grep -c ia-educacao' ;;
    antigravity) echo 'ls ~/.gemini/antigravity/skills | grep -c ia-educacao' ;;
    antigravity-cli) echo 'ls ~/.gemini/antigravity-cli/skills | grep -c ia-educacao' ;;
    gemini) echo 'ls ~/.gemini/skills | grep -c ia-educacao' ;;
  esac
}

usage() {
  sed -n '2,5p' "$0" | sed 's/^# //'
  echo "  --all              informa todos os destinos (mesmo sem CLI instalado)"
  echo "  --claude           Claude Code (~/.claude/skills)"
  echo "  --opencode         OpenCode (~/.config/opencode/skills)"
  echo "  --codex            Codex (~/.agents/skills)"
  echo "  --antigravity      Antigravity 2.0 (~/.gemini/antigravity/skills)"
  echo "  --antigravity-cli  Antigravity CLI (~/.gemini/antigravity-cli/skills)"
  echo "  --gemini           Gemini CLI (~/.gemini/skills)"
  echo "  --verbose          lista as skills faltantes em cada destino"
  echo "  --help             mostra esta ajuda"
  exit 0
}

count_repo_skills() {
  for d in "$SKILLS_DIR"/*/; do [ -d "$d" ] && echo x; done | wc -l | tr -d ' '
}

installed_count() {
  # $1 = dest; conta skills do acervo presentes
  n=0
  for d in "$SKILLS_DIR"/*/; do
    [ -d "$d" ] || continue
    slug=$(basename "$d")
    [ -d "$1/$slug" ] && n=$((n + 1))
  done
  echo "$n"
}

[ $# -gt 0 ] || { TARGETS=""; }
TARGETS=""
ALL=0
for arg in "$@"; do
  case "$arg" in
    --all) ALL=1 ;;
    --claude|--opencode|--codex|--antigravity|--antigravity-cli|--gemini) TARGETS="$TARGETS ${arg#--}" ;;
    --verbose) VERBOSE=1 ;;
    --help|-h) usage ;;
    *) echo "Opção desconhecida: $arg"; usage ;;
  esac
done

if [ "$ALL" -eq 1 ]; then
  TARGETS="claude opencode codex antigravity antigravity-cli gemini"
fi

if [ -z "$TARGETS" ]; then
  # auto-detect: só os CLIs presentes no PATH
  for t in claude opencode codex antigravity antigravity-cli gemini; do
    bin="$(bin_of "$t")"
    command -v "$bin" >/dev/null 2>&1 && TARGETS="$TARGETS $t"
  done
  if [ -z "$TARGETS" ]; then
    echo "info-skills.sh — nenhum CLI de IA instalado (claude, opencode, codex, antigravity, gemini)."
    echo "Use --all para inspecionar todos os destinos ou --help para a ajuda."
    exit 1
  fi
fi

REPO_N=$(count_repo_skills)
echo "info-skills.sh — estado da instalação (acervo: $REPO_N skills)"

INSTALLED_SOMETHING=0

for t in $TARGETS; do
  dest="$(dest_of "$t")"
  bin="$(bin_of "$t")"
  echo ""
  echo "== $t → $dest =="
  if command -v "$bin" >/dev/null 2>&1; then
    echo "  CLI '$bin': instalado"
  else
    echo "  CLI '$bin': não encontrado no PATH"
  fi
  if [ ! -d "$dest" ]; then
    echo "  skills: diretório não existe — nada instalado (execute ./install-skills.sh $t)"
    continue
  fi
  n=$(installed_count "$dest")
  if [ "$n" -eq 0 ]; then
    echo "  skills: 0 do acervo em $dest (execute ./install-skills.sh $t)"
    continue
  fi
  INSTALLED_SOMETHING=1
  if [ "$n" -eq "$REPO_N" ]; then
    echo "  skills: $n/$REPO_N — acervo completo em $dest"
  else
    echo "  skills: $n/$REPO_N — acervo parcial em $dest (atualize com ./install-skills.sh $t)"
  fi
  if [ "$VERBOSE" -eq 1 ]; then
    for d in "$SKILLS_DIR"/*/; do
      [ -d "$d" ] || continue
      slug=$(basename "$d")
      if [ ! -d "$dest/$slug" ]; then
        echo "    faltante: $slug"
      fi
    done
  fi
done

# subagentes do OpenCode (sempre relatados; são específicos do OpenCode)
echo ""
echo "== Subagentes do OpenCode ($AGENTS_DIR) =="
if [ -d "$AGENTS_DIR" ]; then
  n_ok=0
  total=0
  for f in "$AGENTS_SRC"/*.md; do
    [ -f "$f" ] || continue
    total=$((total + 1))
    a=$(basename "$f")
    if [ -f "$AGENTS_DIR/$a" ]; then
      n_ok=$((n_ok + 1))
    elif [ "$VERBOSE" -eq 1 ]; then
      echo "  faltante: $a"
    fi
  done
  if [ "$n_ok" -eq "$total" ]; then
    echo "  instalados: $n_ok/$total — completos"
  else
    echo "  instalados: $n_ok/$total (copie com: cp .opencode/agents/*.md $AGENTS_DIR/)"
  fi
  [ "$n_ok" -gt 0 ] && INSTALLED_SOMETHING=1
else
  echo "  diretório não existe — nenhum subagente instalado"
  echo "  (copie com: mkdir -p ~/.config/opencode/agents && cp .opencode/agents/*.md ~/.config/opencode/agents/)"
fi

echo ""
echo "Conferência manual por destino (comandos do Cap. 4 do Manual AvalIA):"
for t in $TARGETS; do
  echo "  $t: $(check_cmd_of "$t")"
done

if [ "$INSTALLED_SOMETHING" -eq 1 ]; then
  echo ""
  echo "Resultado: ✓ há instalação do acervo nesta máquina (detalhes acima)."
  exit 0
else
  echo ""
  echo "Resultado: ✗ nada do acervo instalado (execute ./install-skills.sh)."
  exit 1
fi