#!/usr/bin/env bash
# audit.sh — auditoria de integridade do acervo skills-ia-educacao
# Uso: ./audit.sh [--quiet]
set -u
QUIET=0
[ "${1:-}" = "--quiet" ] && QUIET=1

fail=0
check() { # check <descrição> <comando...>
  local desc="$1"; shift
  if "$@" >/dev/null 2>&1; then
    [ "$QUIET" -eq 0 ] && echo "  ✓ $desc"
  else
    echo "  ✗ $desc"
    fail=1
  fi
}

echo "== Contagem =="
total=$(ls -d skills/*/ 2>/dev/null | wc -l)
echo "  Skills: $total"

echo "== Distribuição de categorias =="
grep -r "^category:" skills/*/SKILL.md | sed 's|.*category: ||' | sort | uniq -c | sort -rn

echo "== Checks estruturais =="
check "frontmatter completo (name/category/model/version/description)" bash -c '
  for f in skills/*/SKILL.md; do
    for field in "name:" "category:" "model:" "version:" "description:"; do
      grep -q "^$field" "$f" || exit 1
    done
  done'
check "8 seções fixas em todas as skills" bash -c '
  for f in skills/*/SKILL.md; do
    [ "$(grep -c "^## " "$f")" = "8" ] || exit 1
  done'
check "model: any em todas as skills" bash -c '
  grep -rL "^model: any$" skills/*/SKILL.md | grep -q . && exit 1 || true'
check "sem TMP_VERSION_PLACEHOLDER" bash -c '
  grep -rq "TMP_VERSION_PLACEHOLDER" skills/ && exit 1 || true'
check "sem dependências externas (bloom-taxonomy-educator etc.)" bash -c '
  grep -rqE "bloom-taxonomy-educator|backward-design-stem|dua-educator|active-learning-stem|rubric-design-expert|academic-eval-markdown|stem-mcq-validator" skills/ && exit 1 || true'

echo "== Grafo de dependências =="
REFERENCED=$(awk '/^## Dependências/{flag=1; next} /^## /{flag=0} flag' skills/*/SKILL.md | grep "^\- \`" | grep -oP "(?<=\`)[^\`]+(?=\`)" | sort -u)
check "zero skills órfãs (sem referência inbound)" bash -c '
  REFERENCED=$(awk "/^## Dependências/{flag=1; next} /^## /{flag=0} flag" skills/*/SKILL.md | grep "^\- \`" | grep -oP "(?<=\`)[^\`]+(?=\`)" | sort -u)
  for d in skills/*/; do
    skill=$(basename "$d")
    echo "$REFERENCED" | grep -qx "$skill" || exit 1
  done'
check "zero dependências quebradas (slug inexistente)" bash -c '
  awk "/^## Dependências/{flag=1; next} /^## /{flag=0} flag" skills/*/SKILL.md | grep "^\- \`" | grep -oP "(?<=\`)[^\`]+(?=\`)" | sort -u | while read slug; do
    [ -d "skills/$slug" ] || exit 1
  done'

echo "== Consistência AIAS =="
check "nomes canônicos dos 5 níveis (sem formas curtas)" bash -c '
  grep -rnE "Nível [1-5] \((Exploração|Colaboração|Planejamento|Sem IA)\)" skills/ | grep -v "de IA\|com IA" | grep -q . && exit 1 || true'
check "todas as skills citam AIAS (exceto exceções documentadas)" bash -c '
  for f in skills/*/SKILL.md; do
    case "$(basename "$(dirname "$f")")" in
      ia-educacao-ia-desplugada|ia-educacao-infantil|ia-educacao-sandbox) continue ;;
    esac
    grep -q "AIAS" "$f" || exit 1
  done'

echo "== Referências =="
check "autor institucional MEC na forma longa" bash -c '
  grep -rq "^\- BRASIL\. MEC\. " skills/ && exit 1 || true'
check "sem itálico markdown em referências" bash -c '
  awk "/^## Referências/{flag=1; next} /^## /{flag=0} flag" skills/*/SKILL.md | grep "^\*" | grep -v "^\*\*" | grep -q . && exit 1 || true'

echo "== Agentes =="
check "agents/ e .opencode/agents/ idênticos" bash -c 'diff -rq agents/ .opencode/agents/'

echo
if [ "$fail" -eq 0 ]; then
  echo "AUDITORIA OK"
else
  echo "AUDITORIA COM FALHAS"
  exit 1
fi
