# AGENTS.md — skills-ia-educacao

## Natureza do repositório

Acervo documental + skills (`skills/*/SKILL.md`) — a contagem cresce; confira com `ls skills | wc -l`. **Não há código, build, testes, lint, typecheck ou CI.** Nenhum comando de compilação/teste se aplica.

## Fonte primária

Leia `CLAUDE.md` antes de qualquer operação. Ele contém: arquitetura das skills, categorias, tabela AIAS, comandos de auditoria, convenções de edição e referências normativas.

## Diferenças OpenCode vs. Claude Code

- Skills deste repo **já estão disponíveis** no system prompt via tool `skill` — **não** execute `npx skills add` (isso é para Claude Code).
- `opencode.json` existe na raiz com schema mínimo (`$schema` apenas). Adicione configurações aqui se necessário.
- `agents/` (raiz) e `.opencode/agents/` contêm specs para 3 agentes: `artesao-de-skills`, `construtor-de-avaliacoes`, `planejador-pedagogico`. Use via Task tool com `subagent_type`.
- `CLAUDE.md` foi escrito para Claude Code; `AGENTS.md` é o complemento para OpenCode.

## CLIs e disponibilidade de skills

Cada CLI de IA descobre skills de forma diferente. Use o snippet abaixo para detectar quais CLIs estão instalados e verificar se as skills `ia-educacao-*` estão acessíveis em cada um.

| CLI | Onde as skills ficam | Instalação | Verificação |
|-----|----------------------|------------|-------------|
| **Claude Code** | `~/.claude/skills/<slug>/SKILL.md` | `npx skills add ./skills/<slug>` | `ls ~/.claude/skills/ \| grep -c ia-educacao` |
| **OpenCode** | System prompt via tool `skill` | Automático (já listadas em `available_skills`) | `opencode agent list` |

```bash
# Verifica CLIs instalados e disponibilidade das skills ia-educacao-*
echo "=== Detecção de CLIs ==="

# Claude Code
if command -v claude &>/dev/null; then
  echo "✓ Claude Code: $(claude --version 2>/dev/null | head -1 || echo 'instalado')"
  installed=$(ls ~/.claude/skills/ 2>/dev/null | grep -c "^ia-educacao\|^aias-consultant" || echo 0)
  total=$(ls -d skills/*/ 2>/dev/null | wc -l)
  echo "  Skills ia-educacao instaladas: $installed/$total"
  if [ "$installed" -lt "$total" ] 2>/dev/null; then
    echo "  → Instalar todas: for d in skills/*/; do npx skills add \"./\$d\"; done"
  fi
else
  echo "✗ Claude Code: não instalado"
fi

# OpenCode
if command -v opencode &>/dev/null; then
  echo "✓ OpenCode: instalado"
  echo "  Skills: disponíveis via tool skill (automático)"
  echo "  Agentes locais: $(ls .opencode/agents/ 2>/dev/null | wc -l) em .opencode/agents/"
else
  echo "✗ OpenCode: não instalado"
fi
```

> Se Gemini CLI ou Codex forem adicionados no futuro, estenda a detecção com `command -v gemini` / `command -v codex` e seus respectivos diretórios de instruções (`~/.gemini/GEMINI.md`, `~/.codex/CODEX.md`).

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
├── opencode.json      # Config OpenCode (schema mínimo)
├── .gitignore         # raw-pdfs/ ignorado
├── raw-pdfs/          # PDFs normativos (não versionados)
├── assets/            # SVGs do grafo (hub-chart, hub-star, hub-network)
├── agents/            # Specs de agentes (também em .opencode/agents/)
├── apresentacao-skills.md  # Marp presentation
└── skills/            # N skills (confira com `ls skills | wc -l`)
```

## Workflow típico

1. Leia `CLAUDE.md` para contexto completo.
2. Consulte `CONTRIBUTING.md` para template e regras ao criar/editar skills.
3. Após modificar skills, execute os comandos de auditoria acima para verificar grafo.
4. Atualize `CHANGELOG.md` com a mudança.
5. Incremente `version` no frontmatter de skills editadas.
