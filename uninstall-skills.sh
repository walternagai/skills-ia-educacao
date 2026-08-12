#!/usr/bin/env bash
# uninstall-skills.sh — remove as skills do acervo skills-ia-educacao dos CLIs de IA
# Uso: ./uninstall-skills.sh [--all] [--claude] [--opencode] [--codex] [--antigravity] [--gemini] [--dry-run]
# Sem flags: remove dos CLIs detectados (instalados na máquina).
# --all: remove de todos os destinos, mesmo sem o CLI instalado.
set -u

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"
DRY_RUN=0
TARGETS=""
EXPLICIT=0

# --- destinos por CLI (mesmos do install-skills.sh) ---
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
  echo "  --all            remove de todos os destinos (mesmo sem CLI instalado)"
  echo "  --claude         Claude Code (~/.claude/skills)"
  echo "  --opencode       OpenCode (~/.config/opencode/skills)"
  echo "  --codex          Codex (~/.agents/skills)"
  echo "  --antigravity    Antigravity 2.0 (~/.gemini/antigravity/skills)"
  echo "  --antigravity-cli Antigravity CLI (~/.gemini/antigravity-cli/skills)"
  echo "  --gemini         Gemini CLI (~/.gemini/skills)"
  echo "  --dry-run        mostra o que seria feito sem remover"
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
  [ -z "$TARGETS" ] && { echo "Nenhum CLI alvo instalado. Use --all para remover mesmo assim."; exit 1; }
fi

echo "== Removendo skills de: $TARGETS =="
echo "  Skills do acervo: $(ls -d "$SKILLS_DIR"/*/ | wc -l)"

for t in $TARGETS; do
  dest="${DEST[$t]}"
  echo ""
  echo "== $t → $dest =="
  [ -d "$dest" ] || { echo "  Diretório não existe — nada a remover"; continue; }
  if ! command -v "${BIN[$t]}" >/dev/null 2>&1; then
    echo "  ⚠ CLI '$t' não instalado — removendo mesmo assim (use --all para silenciar)"
  fi
  removed=0
  for d in "$SKILLS_DIR"/*/; do
    slug=$(basename "$d")
    if [ -d "$dest/$slug" ]; then
      if [ "$DRY_RUN" -eq 1 ]; then
        echo "  (dry-run) removeria $dest/$slug"
      else
        rm -rf "$dest/$slug"
      fi
      removed=$((removed + 1))
    fi
  done
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "  (dry-run) $removed skills seriam removidas de $dest"
  else
    echo "  Removidas: $removed skills de $dest"
  fi
done

echo ""
echo "== Verificação =="
for t in $TARGETS; do
  dest="${DEST[$t]}"
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "  $t: (dry-run, nada removido)"
  elif [ ! -d "$dest" ]; then
    echo "  $t: diretório não existe"
  else
    n=$(ls -d "$dest"/*/ 2>/dev/null | wc -l)
    restantes=$(for d in "$SKILLS_DIR"/*/; do slug=$(basename "$d"); [ -d "$dest/$slug" ] && echo "$slug"; done | wc -l)
    echo "  $t: $restantes skills do acervo restantes (total de $n diretórios)"
  fi
done

echo ""
echo "Pronto. Reinicie o CLI para que as skills deixem de ser detectadas."
