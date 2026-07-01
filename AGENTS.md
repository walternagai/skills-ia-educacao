# AGENTS.md — skills-ia-educacao

## Natureza do repositório

Acervo documental + 54 skills (`skills/*/SKILL.md`). **Não há código, build, testes, lint, typecheck ou CI.** Nenhum comando de compilação/teste se aplica.

## Fonte primária

Leia `CLAUDE.md` antes de qualquer operação. Ele contém: arquitetura das skills, categorias, tabela AIAS, comandos de auditoria, convenções de edição e referências normativas.

## Diferenças OpenCode vs. Claude Code

- Skills deste repo **já estão disponíveis** via tool `skill` no OpenCode — **não** execute `npx skills add`.
- Não há `opencode.json` neste repo. Se precisar de configuração local, crie uma.
- O `CLAUDE.md` foi escrito para Claude Code; o `AGENTS.md` (este arquivo) é o complemento para OpenCode.

## Convenções essenciais (não óbvias)

- **Idioma**: Português do Brasil em todo conteúdo (skills, docs, commits).
- **Slug**: prefixo `ia-educacao-` (ex: `ia-educacao-avaliacao`). Exceção: `aias-consultant` (sem prefixo).
- **Dependências entre skills**: referenciar **apenas** skills dentro de `skills/` deste repo — nunca skills externas (ex: `bloom-taxonomy-educator`).
- **AIAS**: 5 níveis fixos com nomes canônicos (tabela no `CLAUDE.md`). Não adicionar/renomear/remover sem revisar todas as skills.
- **Versionamento**: ao editar skill, incremente `version` no frontmatter (ex: `1.2` → `1.3`).
- **Referências**: formato ABNT.
- **`raw-pdfs/`** está no `.gitignore` — PDFs normativos não versionados.
- **`CHANGELOG.md`** deve ser atualizado em toda mudança relevante (formato Keep a Changelog).

## Comandos de auditoria (do `CLAUDE.md`)

```bash
# Distribuição de categorias (deve bater com a tabela do CLAUDE.md)
grep -r "^category:" skills/*/SKILL.md | sed 's|.*category: ||' | sort | uniq -c | sort -rn

# Skills mais referenciadas (hubs do grafo)
awk '/^## Dependências/{flag=1; next} /^## /{flag=0} flag' skills/*/SKILL.md | grep "^\- \`" | grep -oP "(?<=\`)[^\`]+(?=\`)" | sort | uniq -c | sort -rn | head -15

# Skills órfãs (sem referência inbound — devem ser zero)
REFERENCED=$(awk '/^## Dependências/{flag=1; next} /^## /{flag=0} flag' skills/*/SKILL.md | grep "^\- \`" | grep -oP "(?<=\`)[^\`]+(?=\`)" | sort -u)
for d in skills/*/; do skill=$(basename "$d"); echo "$REFERENCED" | grep -qx "$skill" || echo "ÓRFÃ: $skill"; done

# Dependências quebradas (slug não existe em skills/)
awk '/^## Dependências/{flag=1; next} /^## /{flag=0} flag' skills/*/SKILL.md | grep "^\- \`" | grep -oP "(?<=\`)[^\`]+(?=\`)" | sort -u | while read slug; do
  [ -d "skills/$slug" ] || echo "QUEBRADA: $slug"
done
```

## Estrutura de diretórios

```
.
├── CLAUDE.md          # Instruções principais (leia primeiro)
├── CONTRIBUTING.md    # Template e checklist para criar/editar skills
├── CHANGELOG.md       # Histórico de versões (atualize ao modificar)
├── README.md          # Visão geral e listagem de skills
├── AGENTS.md          # Este arquivo
├── .gitignore         # raw-pdfs/ ignorado
├── raw-pdfs/          # PDFs normativos (não versionados)
└── skills/            # 54 diretórios, cada um com SKILL.md
```

## Workflow típico

1. Leia `CLAUDE.md` para contexto completo.
2. Consulte `CONTRIBUTING.md` para template e regras ao criar/editar skills.
3. Após modificar skills, execute os comandos de auditoria acima para verificar grafo.
4. Atualize `CHANGELOG.md` com a mudança.
5. Incremente `version` no frontmatter de skills editadas.
