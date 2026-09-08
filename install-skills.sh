#!/usr/bin/env bash
# install-skills.sh — instala somente as skills do acervo em CLIs de IA
# Uso: ./install-skills.sh [--all] [--claude] [--opencode] [--codex] [--antigravity] [--gemini] [--dry-run]
# Sem flags: instala em todos os CLIs detectados (instalados na máquina).
# --all: instala em todos os destinos, mesmo sem o CLI instalado.
set -u

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"
DRY_RUN=0
TARGETS=""
EXPLICIT=0

# --- destinos por CLI (fonte: docs oficiais) ---
# Claude Code: ~/.claude/skills/<slug>/SKILL.md
# OpenCode:    ~/.config/opencode/skills/<slug>/SKILL.md
# Codex:       ~/.agents/skills/<slug>/SKILL.md (USER scope)
# Antigravity: ~/.gemini/antigravity/skills/<slug>/SKILL.md (global)
#              ~/.gemini/antigravity-cli/skills/<slug>/SKILL.md (CLI)
# Gemini CLI:  ~/.gemini/skills/<slug>/SKILL.md
declare -A DEST=(
  [claude]="$HOME/.claude/skills"
  [opencode]="$HOME/.config/opencode/skills"
  [codex]="$HOME/.agents/skills"
  [antigravity]="$HOME/.gemini/antigravity/skills"
  [antigravity-cli]="$HOME/.gemini/antigravity-cli/skills"
  [gemini]="$HOME/.gemini/skills"
)
declare -A BIN=(
  [claude]="claude"
  [opencode]="opencode"
  [codex]="codex"
  [antigravity]="antigravity"
  [antigravity-cli]="antigravity"
  [gemini]="gemini"
)

usage() {
  sed -n '2,4p' "$0" | sed 's/^# //'
  echo "  --all            instala em todos os destinos (mesmo sem CLI instalado)"
  echo "  --claude         Claude Code (~/.claude/skills)"
  echo "  --opencode       OpenCode (~/.config/opencode/skills)"
  echo "  --codex          Codex (~/.agents/skills)"
  echo "  --antigravity    Antigravity 2.0 (~/.gemini/antigravity/skills)"
  echo "  --antigravity-cli Antigravity CLI (~/.gemini/antigravity-cli/skills)"
  echo "  --gemini         Gemini CLI (~/.gemini/skills)"
  echo "  --dry-run        mostra o que seria feito sem copiar"
  exit 0
}

[ $# -eq 0 ] && usage

for arg in "$@"; do
  case "$arg" in
    --all) TARGETS="claude opencode codex antigravity antigravity-cli gemini"; EXPLICIT=1 ;;
    --claude|--opencode|--codex|--antigravity|--antigravity-cli|--gemini) TARGETS="$TARGETS ${arg#--}"; EXPLICIT=1 ;;
    --dry-run) DRY_RUN=1 ;;
    *) echo "Opção desconhecida: $arg"; usage ;;
  esac
done

[ -z "$TARGETS" ] && usage

# sem flags explícitas, filtra pelos CLIs instalados (auto-detect)
if [ "$EXPLICIT" -eq 0 ]; then
  FILTERED=""
  for t in $TARGETS; do
    command -v "${BIN[$t]}" >/dev/null 2>&1 && FILTERED="$FILTERED $t"
  done
  TARGETS="$FILTERED"
  [ -z "$TARGETS" ] && { echo "Nenhum CLI alvo instalado. Use --all para instalar mesmo assim."; exit 1; }
fi

echo "== Instalando skills em: $TARGETS =="
echo "  Origem: $SKILLS_DIR ($(ls -d "$SKILLS_DIR"/*/ | wc -l) skills)"

for t in $TARGETS; do
  dest="${DEST[$t]}"
  echo ""
  echo "== $t → $dest =="
  if ! command -v "${BIN[$t]}" >/dev/null 2>&1; then
    echo "  ⚠ CLI '$t' não instalado — instalando mesmo assim (use --all para silenciar)"
  fi
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "  (dry-run) copiaria $SKILLS_DIR/* → $dest"
    continue
  fi
  mkdir -p "$dest"
  # copia cada skill (diretório com SKILL.md) preservando estrutura
  for d in "$SKILLS_DIR"/*/; do
    slug=$(basename "$d")
    cp -r "$d" "$dest/$slug"
  done
  echo "  Instaladas: $(ls -d "$dest"/*/ 2>/dev/null | wc -l) skills em $dest"
done

echo ""
echo "== Verificação =="
for t in $TARGETS; do
  dest="${DEST[$t]}"
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "  $t: (dry-run, nada copiado)"
  else
    n=$(ls -d "$dest"/*/ 2>/dev/null | wc -l)
    echo "  $t: $n skills em $dest"
  fi
done

echo ""
echo "Pronto. Reinicie o CLI para que as skills sejam detectadas."
echo "Observação: os 6 subagentes são configurações específicas do OpenCode e não são instalados por este script."
