#!/usr/bin/env bash
# doctor-skills.sh — verifica se o computador reúne os pré-requisitos do acervo
# Uso: ./doctor-skills.sh [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--fix]
# Sem flags: diagnostica o ambiente básico + todos os CLIs.
# --all: não filtrar; diagnostica todos os destinos, mesmo sem o CLI instalado.
# Códigos de saída: 0 = OK; 1 = faltam pré-requisitos essenciais.
# Compatível com bash 3.2 (macOS), Linux e Git Bash/WSL2 (Windows).
set -u

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"
AGENTS_SRC="$REPO_DIR/.opencode/agents"
AGENTS_DIR="$HOME/.config/opencode/agents"

OK=0
FAIL=0
WARN=0
FIX=0
TARGETS=""

pass() { printf '  ✓ %s\n' "$1"; OK=$((OK + 1)); }
warn() { printf '  ⚠ %s\n' "$1"; WARN=$((WARN + 1)); }
fail() { printf '  ✗ %s\n' "$1"; FAIL=$((FAIL + 1)); }
# ok/warn/fail somam ao placar; info apenas exibe.
info() { printf '  · %s\n' "$1"; }

have() { command -v "$1" >/dev/null 2>&1; }

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
pkg_of() {
  case "$1" in
    claude) echo "npm: @anthropic-ai/claude-code | winget (Win): Anthropic.Claude | brew (macOS): (npm)" ;;
    opencode) echo "npm: opencode-ai | scoop/choco (Win) | cURL: https://opencode.ai/install" ;;
    codex) echo "npm: @openai/codex" ;;
    antigravity|antigravity-cli) echo "download: https://antigravity.google" ;;
    gemini) echo "npm: @google/gemini-cli" ;;
  esac
}
fix_hint_of() {
  case "$1" in
    claude) echo "npm install -g @anthropic-ai/claude-code" ;;
    opencode) echo "npm install -g opencode-ai   # ou: curl -fsSL https://opencode.ai/install | bash" ;;
    codex) echo "npm install -g @openai/codex" ;;
    antigravity|antigravity-cli) echo "instale a partir de https://antigravity.google" ;;
    gemini) echo "npm install -g @google/gemini-cli" ;;
  esac
}

usage() {
  sed -n '2,5p' "$0" | sed 's/^# //'
  echo "  --all              diagnostica todos os destinos (mesmo sem CLI instalado)"
  echo "  --claude           Claude Code (~/.claude/skills)"
  echo "  --opencode         OpenCode (~/.config/opencode/skills)"
  echo "  --codex            Codex (~/.agents/skills)"
  echo "  --antigravity      Antigravity 2.0 (~/.gemini/antigravity/skills)"
  echo "  --antigravity-cli  Antigravity CLI (~/.gemini/antigravity-cli/skills)"
  echo "  --gemini           Gemini CLI (~/.gemini/skills)"
  echo "  --fix              tenta corrigir o que faltar (instala CLIs ausentes via npm)"
  echo "  --help             mostra esta ajuda"
  exit 0
}

[ $# -gt 0 ] || set -- --all
for arg in "$@"; do
  case "$arg" in
    --all) TARGETS="$TARGETS claude opencode codex antigravity antigravity-cli gemini" ;;
    --claude|--opencode|--codex|--antigravity|--antigravity-cli|--gemini) TARGETS="$TARGETS ${arg#--}" ;;
    --fix) FIX=1 ;;
    --help|-h) usage ;;
    *) echo "Opção desconhecida: $arg"; usage ;;
  esac
done

echo "doctor-skills.sh — diagnóstico do ambiente (sistema: $(uname -s))"

# ---------------------------------------------------------------- base
echo ""
echo "== Ambiente base =="
case "${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}" in
  3.*|4.*) pass "bash ${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]} (testado com 3.2/4.x)" ;;
  5.*) pass "bash ${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}" ;;
  *) warn "bash ${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]} (testado com 3.2/4.x; demais costumam funcionar)" ;;
esac

if have curl; then pass "curl ($(curl --version 2>/dev/null | head -1 | cut -d' ' -f2))"; else fail "curl ausente — necessário para instalar o OpenCode"; fi
if have git; then pass "git ($(git --version 2>/dev/null | cut -d' ' -f3))"; else warn "git ausente — recomendado para clonar/atualizar o repositório (ZIP dispensa o git)"; fi

if have node; then
  node_major=$(node --version 2>/dev/null | sed 's/^v//' | cut -d. -f1)
  if [ -n "$node_major" ] && [ "$node_major" -ge 18 ] 2>/dev/null; then
    pass "node ($(node --version)) — requerido: >= 18"
  else
    fail "node $(node --version) é anterior ao mínimo (18) — atualize em https://nodejs.org"
  fi
else
  fail "node ausente (>= 18) — necessário para os CLIs distribuídos via npm"
fi
if have npm; then pass "npm ($(npm --version 2>/dev/null))"; else warn "npm ausente — distribui a maioria dos CLIs (instale com o Node.js)"; fi

if [ -d "$SKILLS_DIR" ]; then
  pass "acervo: $SKILLS_DIR ($(for d in "$SKILLS_DIR"/*/; do [ -d "$d" ] && echo x; done | wc -l | tr -d ' ') skills)"
else
  fail "acervo não encontrado em $SKILLS_DIR — execute este script na raiz do repositório"
fi

if [ -d "$AGENTS_SRC" ]; then
  n_agents=$(for f in "$AGENTS_SRC"/*.md; do [ -f "$f" ] && echo x; done | wc -l | tr -d ' ')
  pass "subagentes no repositório: $n_agents (em .opencode/agents/)"
else
  warn "pasta .opencode/agents/ não encontrada — os subagentes do OpenCode não serão sincronizáveis"
fi

# ---------------------------------------------------------------- CLIs
if [ -z "$TARGETS" ]; then
  echo ""
  echo "== CLIs de IA =="
  info "nenhum CLI selecionado — use flags de destino ou --all"
else
  echo ""
  echo "== CLIs de IA =="
  for t in $TARGETS; do
    dest="$(dest_of "$t")"
    bin="$(bin_of "$t")"
    echo ""
    echo "-- $t ($bin) → $dest --"
    if have "$bin"; then
      pass "CLI '$bin' no PATH"
    else
      fail "CLI '$bin' não encontrado no PATH (pacote: $(pkg_of "$t"))"
      if [ "$FIX" -eq 1 ]; then
        fh="$(fix_hint_of "$t")"
        case "$fh" in
          npm\ install\ -*)
            echo "    --fix: executando $fh"
            if npm install -g "${fh#npm install -g }" >/dev/null 2>&1; then
              pass "CLI '$bin' instalado via npm"
            else
              warn "instalação via npm falhou — execute manualmente: $fh"
            fi
            ;;
          *) info "--fix indisponível para '$t' (instalação manual: $fh)" ;;
        esac
      fi
    fi
    if [ -d "$dest" ]; then
      pass "diretório de skills existe ($dest)"
    else
      info "diretório de skills ainda não existe ($dest) — será criado pelo install-skills.sh"
    fi
  done
fi

# ---------------------------------------------------------------- agentes (OpenCode)
echo ""
echo "== Subagentes do OpenCode =="
if [ -d "$AGENTS_DIR" ]; then
  n_ok=0
  for f in "$AGENTS_SRC"/*.md; do
    [ -f "$f" ] || continue
    a=$(basename "$f")
    if [ -f "$AGENTS_DIR/$a" ]; then n_ok=$((n_ok + 1)); else warn "subagente ausente na instalação: $a"; fi
  done
  if [ "$n_ok" -eq "$(for f in "$AGENTS_SRC"/*.md; do [ -f "$f" ] && echo x; done | wc -l | tr -d ' ')" ] 2>/dev/null; then
    pass "todos os subagentes instalados em $AGENTS_DIR ($n_ok/$(for f in "$AGENTS_SRC"/*.md; do [ -f "$f" ] && echo x; done | wc -l | tr -d ' '))"
  fi
else
  warn "diretório de agentes não existe ($AGENTS_DIR) — copie com: mkdir -p ~/.config/opencode/agents && cp .opencode/agents/*.md ~/.config/opencode/agents/"
fi

# ---------------------------------------------------------------- placar
echo ""
echo "== Placar =="
echo "  OK: $OK   Avisos: $WARN   Falhas: $FAIL"
if [ "$FAIL" -gt 0 ]; then
  echo ""
  echo "Resultado: ✗ há pré-requisitos a resolver antes de instalar."
  exit 1
elif [ "$WARN" -gt 0 ]; then
  echo ""
  echo "Resultado: ⚠ ambiente utilizável, com ressalvas (veja os avisos)."
  exit 0
else
  echo ""
  echo "Resultado: ✓ ambiente pronto para instalar as skills."
  exit 0
fi