#!/usr/bin/env bash
# audit.sh — auditoria de integridade do acervo skills-ia-educacao
# Uso: ./audit.sh [--quiet]   (--quiet: só exit code 0/1 e falhas)
set -u
QUIET=0
[ "${1:-}" = "--quiet" ] && QUIET=1

fail=0
say() { if [ "$QUIET" -eq 0 ]; then echo "$@"; fi; return 0; }

# check <descrição> <função> — roda a função; na falha, mostra a saída dela
check() {
  local desc="$1"; shift
  local output
  output=$("$@" 2>&1)
  if [ $? -eq 0 ]; then
    say "  ✓ $desc"
  else
    echo "  ✗ $desc"
    [ -n "$output" ] && printf '%s\n' "$output" | sed 's/^/      /'
    fail=1
  fi
}

# slugs referenciados na seção Dependências de todas as skills
deps_slugs() {
  awk '/^## Dependências/{flag=1; next} /^## /{flag=0} flag' skills/*/SKILL.md \
    | grep "^\- \`" \
    | grep -oE '`[^`]+`' \
    | tr -d '`' \
    | sort -u
}

check_frontmatter() {
  local f fm field
  for f in skills/*/SKILL.md; do
    fm=$(awk 'NR==1 && $0=="---"{n=1; next} n==1 && $0=="---"{exit} n==1{print}' "$f")
    for field in "name:" "category:" "model:" "version:" "description:"; do
      echo "$fm" | grep -q "^$field" || { echo "FALTA $field em $f"; return 1; }
    done
    echo "$fm" | grep -qE "^version: [0-9]+\.[0-9]+$" || { echo "version inválida em $f"; return 1; }
    [ "$(grep -c "^---$" "$f")" -ge 2 ] || { echo "frontmatter não fechado em $f"; return 1; }
  done
}

check_sections() {
  local f got expected
  expected="Princípios
Quando usar
Workflow
Formato de Saída
Exemplos
Limitações
Dependências
Referências"
  for f in skills/*/SKILL.md; do
    got=$(grep "^## " "$f" | sed 's/^## //')
    [ "$got" = "$expected" ] || { echo "seções fora de ordem/nome em $f:"; printf '%s\n' "$got" | sed 's/^/    /'; return 1; }
  done
}

check_model_any() {
  local bad
  bad=$(grep -rL "^model: any$" skills/*/SKILL.md)
  [ -z "$bad" ] || { echo "$bad"; return 1; }
}

check_placeholder() {
  grep -rq "TMP_VERSION_PLACEHOLDER" skills/ && { echo "TMP_VERSION_PLACEHOLDER presente"; return 1; }
  return 0
}

# Toda referência em ## Dependências deve ser slug deste repositório
# (ia-educacao-* | aias-consultant) e toda linha útil deve seguir "- `slug` ...".
check_external_deps() {
  local bad_slugs bad_lines pattern
  pattern='^(ia-educacao-[a-z0-9-]+|aias-consultant)$'
  bad_slugs=$(awk '/^## Dependências/{flag=1; next} /^## /{flag=0} flag' skills/*/SKILL.md \
    | grep -oE '`[^`]+`' | tr -d '`' \
    | grep -vE "$pattern" || true)
  bad_lines=$(for f in skills/*/SKILL.md; do
    awk -v F="$f" '/^## Dependências/{flag=1; next} /^## /{flag=0} flag && NF && $0 !~ /^- `/ {print F ": " $0}' "$f"
  done)
  if [ -n "$bad_slugs" ] || [ -n "$bad_lines" ]; then
    [ -n "$bad_lines" ] && printf '%s\n' "$bad_lines"
    [ -n "$bad_slugs" ] && { echo "slugs fora do padrão (use ia-educacao-* ou aias-consultant):"; printf '%s\n' "$bad_slugs"; }
    return 1
  fi
  return 0
}

check_name_dir() {
  local f name dir
  for f in skills/*/SKILL.md; do
    name=$(grep -m1 "^name:" "$f" | sed 's/^name: //')
    dir=$(basename "$(dirname "$f")")
    [ "$name" = "$dir" ] || { echo "$dir -> name: $name"; return 1; }
  done
}

check_name_unique() {
  local dup
  dup=$(grep -h "^name:" skills/*/SKILL.md | sort | uniq -d)
  [ -z "$dup" ] || { echo "name duplicado: $dup"; return 1; }
}

check_slug() {
  local bad
  bad=$(grep -h "^name:" skills/*/SKILL.md | sed 's/^name: //' | grep -vE "^(ia-educacao-[a-z0-9-]+|aias-consultant)$")
  [ -z "$bad" ] || { echo "slug fora do padrão: $bad"; return 1; }
}

check_category() {
  local bad
  bad=$(grep -h "^category:" skills/*/SKILL.md | sed 's/^category: //' | grep -vE "^(niveis-ensino|formacao-docente|etica-governanca|inclusao-equidade|ferramentas-praticas)$")
  [ -z "$bad" ] || { echo "categoria inválida: $bad"; return 1; }
}

check_orphans() {
  local referenced skill
  referenced=$(deps_slugs)
  for d in skills/*/; do
    skill=$(basename "$d")
    echo "$referenced" | grep -qx "$skill" || { echo "ÓRFÃ: $skill"; return 1; }
  done
}

check_broken_deps() {
  local slug
  while read -r slug; do
    [ -d "skills/$slug" ] || { echo "QUEBRADA: $slug"; return 1; }
  done < <(deps_slugs)
}

check_aias_canonical() {
  local hits
  hits=$(grep -rnE "Nível [1-5] \((Exploração|Colaboração|Planejamento)\)" skills/)
  [ -z "$hits" ] || { echo "$hits"; return 1; }
}

check_aias_coverage() {
  local f
  for f in skills/*/SKILL.md; do
    case "$(basename "$(dirname "$f")")" in
      ia-educacao-ia-desplugada|ia-educacao-infantil|ia-educacao-sandbox) continue ;;
    esac
    grep -q "AIAS" "$f" || { echo "sem AIAS: $f"; return 1; }
  done
}

check_mec() {
  local hits
  hits=$(grep -rn "BRASIL\. MEC\. " skills/)
  [ -z "$hits" ] || { echo "$hits"; return 1; }
}

check_italic_refs() {
  local hits
  hits=$(awk '/^## Referências/{flag=1; next} /^## /{flag=0} flag' skills/*/SKILL.md | grep -E '\*[^*]+\*')
  [ -z "$hits" ] || { echo "$hits"; return 1; }
}

check_readme() {
  local listed actual d
  listed=$(grep -oE '`/[a-z-]+`' README.md | tr -d '`/' | sort -u)
  actual=$(ls skills | sort)
  d=$(diff <(printf '%s\n' "$listed") <(printf '%s\n' "$actual") 2>&1)
  [ -z "$d" ] || { echo "README desatualizado:"; echo "$d"; return 1; }
}

check_agents_sync() {
  diff -rq agents/ .opencode/agents/ || return 1
}

say "== Contagem =="
total=$(ls -d skills/*/ 2>/dev/null | wc -l)
say "  Skills: $total"

say "== Distribuição de categorias =="
say "$(grep -r "^category:" skills/*/SKILL.md | sed 's|.*category: ||' | sort | uniq -c | sort -rn)"

say "== Checks estruturais =="
check "frontmatter completo (campos + version X.Y + fechamento)" check_frontmatter
check "8 seções fixas na ordem canônica" check_sections
check "model: any em todas as skills" check_model_any
check "sem TMP_VERSION_PLACEHOLDER" check_placeholder
check "Dependências apenas do repositório (slugs e formato)" check_external_deps
check "name == diretório" check_name_dir
check "name único" check_name_unique
check "slug válido (ia-educacao-* | aias-consultant)" check_slug
check "categoria válida" check_category

say "== Grafo de dependências =="
check "zero skills órfãs" check_orphans
check "zero dependências quebradas" check_broken_deps

say "== Consistência AIAS =="
check "nomes canônicos dos 5 níveis" check_aias_canonical
check "todas as skills citam AIAS (exceto exceções)" check_aias_coverage

say "== Referências =="
check "autor institucional MEC na forma longa" check_mec
check "sem itálico markdown em referências" check_italic_refs

say "== Documentação =="
check "README lista todas as skills" check_readme

say "== Agentes =="
check "agents/ e .opencode/agents/ idênticos" check_agents_sync

say ""
if [ "$fail" -eq 0 ]; then
  say "AUDITORIA OK"
else
  echo "AUDITORIA COM FALHAS"
  exit 1
fi
