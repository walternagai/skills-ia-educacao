# AGENTS.md — skills-ia-educacao

## Natureza

Acervo documental (`skills/*/SKILL.md`). **Não há código, build, testes, lint, typecheck ou CI.** Nenhum comando de compilação/teste se aplica. Contagem: `ls skills | wc -l`.

## Fonte primária

Leia `CLAUDE.md` antes de qualquer operação. Ele contém: arquitetura das skills, categorias, tabela AIAS, comandos de auditoria, convenções de edição e referências normativas.

## OpenCode vs. Claude Code

- Skills deste repo **já estão disponíveis** no system prompt via tool `skill` — **não** execute `npx skills add` (Claude Code).
- `opencode.json` na raiz com schema mínimo (`$schema` apenas).
- `agents/` e `.opencode/agents/` contêm specs para 3 agentes: `artesao-de-skills`, `construtor-de-avaliacoes`, `planejador-pedagogico`. Use via Task tool com `subagent_type`.
- `CLAUDE.md` é para Claude Code; `AGENTS.md` é o complemento para OpenCode.

## CLIs e disponibilidade de skills

Cada CLI descobre skills de forma diferente. Use o snippet abaixo para detectar CLIs instalados e verificar se as skills `ia-educacao-*` estão acessíveis.

| CLI | Onde as skills ficam | Instalação | Verificação |
|-----|----------------------|------------|-------------|
| **Claude Code** | `~/.claude/skills/<slug>/SKILL.md` | `npx skills add ./skills/<slug>` | `ls ~/.claude/skills/ \| grep -c ia-educacao` |
| **OpenCode** | System prompt via tool `skill` | Automático (em `available_skills`) | `opencode agent list` |

```bash
# Detecta CLIs instalados e disponibilidade das skills ia-educacao-*
echo "=== Detecção de CLIs ==="
if command -v claude &>/dev/null; then
  echo "✓ Claude Code: $(claude --version 2>/dev/null | head -1 || echo 'instalado')"
  installed=$(ls ~/.claude/skills/ 2>/dev/null | grep -c "^ia-educacao\|^aias-consultant" || echo 0)
  total=$(ls -d skills/*/ 2>/dev/null | wc -l)
  echo "  Skills ia-educacao instaladas: $installed/$total"
  [ "$installed" -lt "$total" ] 2>/dev/null && echo "  → Instalar: for d in skills/*/; do npx skills add \"./\$d\"; done"
else
  echo "✗ Claude Code: não instalado"
fi
if command -v opencode &>/dev/null; then
  echo "✓ OpenCode: instalado (skills via tool skill, agentes em .opencode/agents/)"
else
  echo "✗ OpenCode: não instalado"
fi
```

> Se Gemini CLI ou Codex forem adicionados, estenda com `command -v gemini` / `command -v codex` e seus diretórios (`~/.gemini/GEMINI.md`, `~/.codex/CODEX.md`).

## Convenções essenciais

- **Idioma**: Português do Brasil em todo conteúdo (skills, docs, commits).
- **Slug**: prefixo `ia-educacao-` (ex: `ia-educacao-avaliacao`). Exceção: `aias-consultant` (sem prefixo).
- **Modelo**: `model: any` no frontmatter — skills independentes de CLI/fornecedor.
- **Dependências**: referenciar **apenas** skills dentro de `skills/` deste repo — nunca skills externas (ex: `bloom-taxonomy-educator`).
- **AIAS**: 5 níveis fixos com nomes canônicos (tabela no `CLAUDE.md`). Não alterar sem revisar todas as skills.
- **Versionamento**: ao editar skill, incremente `version` no frontmatter (ex: `1.2` → `1.3`).
- **Referências**: formato ABNT.
- **`raw-pdfs/`**: no `.gitignore` — PDFs normativos não versionados.
- **`CHANGELOG.md`**: atualizar a cada mudança relevante (formato Keep a Changelog).

## Comandos de auditoria

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

## Estrutura

```
.
├── CLAUDE.md          # Instruções principais (leia primeiro)
├── CONTRIBUTING.md    # Template e checklist para criar/editar skills
├── CHANGELOG.md       # Histórico de versões (atualize ao modificar)
├── README.md          # Visão geral e listagem de skills
├── AGENTS.md          # Este arquivo
├── opencode.json      # Config OpenCode (schema mínimo)
├── .gitignore         # raw-pdfs/ ignorado
├── raw-pdfs/          # PDFs normativos (não versionados)
├── assets/            # SVGs do grafo (hub-chart, hub-star, hub-network)
├── agents/            # Specs de agentes (também em .opencode/agents/)
├── apresentacao-skills.md  # Marp presentation
└── skills/            # N skills (confira com `ls skills | wc -l`)
```

## Workflow

1. Leia `CLAUDE.md` para contexto completo.
2. Consulte `CONTRIBUTING.md` ao criar/editar skills.
3. Após modificar, execute os comandos de auditoria para verificar grafo.
4. Atualize `CHANGELOG.md`.
5. Incremente `version` no frontmatter de skills editadas.
