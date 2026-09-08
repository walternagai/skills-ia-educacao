# AGENTS.md — skills-ia-educacao

## Natureza

Acervo documental (`skills/*/SKILL.md`). **Não há código, build, testes, lint, typecheck ou CI.** Nenhum comando de compilação/teste se aplica. Contagem: `ls skills | wc -l`.

## Fonte primária

Leia `CLAUDE.md` antes de qualquer operação. Ele contém: arquitetura das skills, categorias, tabela AIAS, comandos de auditoria, convenções de edição e referências normativas.

## OpenCode vs. Claude Code

- Skills deste repo **já estão disponíveis** no system prompt via tool `skill` — **não** execute `npx skills add` (comando do Claude Code).
- `opencode.json` na raiz com schema mínimo (`$schema` apenas).
- `agents/` e `.opencode/agents/` contêm specs de 6 agentes: `artesao-de-skills`, `construtor-de-avaliacoes`, `planejador-pedagogico`, `aplicador-de-rubricas`, `coach-de-feedback-formativo`, `gerador-de-questoes-bloom`. Use via Task tool com `subagent_type`.
- **Sincronia**: `.opencode/agents/` é a cópia que o OpenCode carrega; `agents/` é a fonte canônica. Ao editar um agente, atualize **as duas** cópias (audit.sh verifica identidade).
- `CLAUDE.md` é para Claude Code; `AGENTS.md` é o complemento para OpenCode.

## Instalação de skills em CLIs

Use `./install-skills.sh` / `./uninstall-skills.sh` — **exigem flags** (invocação sem argumentos só imprime usage; o auto-detect documentado no cabeçalho é código morto):

```bash
./install-skills.sh --all                 # instala em todos os destinos (mesmo sem CLI)
./install-skills.sh --claude --opencode   # destinos explícitos
./install-skills.sh --dry-run             # mostra o que seria feito sem copiar
./uninstall-skills.sh --all               # remove de todos os destinos
./uninstall-skills.sh --codex --dry-run   # mostra o que seria removido
```

| CLI | Onde as skills ficam | Verificação |
|-----|----------------------|-------------|
| **Claude Code** | `~/.claude/skills/<slug>/SKILL.md` | `ls ~/.claude/skills/ \| grep -c ia-educacao` |
| **OpenCode** | `~/.config/opencode/skills/<slug>/SKILL.md` | `ls ~/.config/opencode/skills/ \| grep -c ia-educacao` |
| **Codex** | `~/.agents/skills/<slug>/SKILL.md` | `ls ~/.agents/skills/ \| grep -c ia-educacao` |
| **Antigravity 2.0** | `~/.gemini/antigravity/skills/<slug>/SKILL.md` | `ls ~/.gemini/antigravity/skills/ \| grep -c ia-educacao` |
| **Antigravity CLI** | `~/.gemini/antigravity-cli/skills/<slug>/SKILL.md` | `ls ~/.gemini/antigravity-cli/skills/ \| grep -c ia-educacao` |
| **Gemini CLI** | `~/.gemini/skills/<slug>/SKILL.md` | `ls ~/.gemini/skills/ \| grep -c ia-educacao` |

## Convenções essenciais

- **Idioma**: Português do Brasil em todo conteúdo (skills, docs, commits).
- **Slug**: prefixo `ia-educacao-` (ex: `ia-educacao-avaliacao`). Exceção: `aias-consultant` (sem prefixo).
- **Modelo**: `model: any` no frontmatter — skills independentes de CLI/fornecedor.
- **Dependências**: referenciar **apenas** skills dentro de `skills/` deste repo — nunca skills externas (ex: `bloom-taxonomy-educator`).
- **AIAS**: 5 níveis fixos com nomes canônicos (tabela no `CLAUDE.md`). Não alterar sem revisar todas as skills.
- **Versionamento**: ao editar skill, incremente `version` no frontmatter (ex: `1.2` → `1.3`).
- **`TMP_VERSION_PLACEHOLDER`**: não reintroduzir (audit.sh falha se presente).
- **Referências**: formato ABNT.
- **`raw-pdfs/`**: no `.gitignore` — PDFs normativos não versionados.
- **`CHANGELOG.md`**: atualizar a cada mudança relevante (formato Keep a Changelog).

## Auditoria

Rode `./audit.sh` após qualquer mudança — cobre: frontmatter (campos, `version X.Y`, fechamento), 8 seções fixas na ordem canônica, `model: any`, placeholder, dependências externas, `name` == diretório, `name` único, slug e categoria válidos, órfãs, dependências quebradas, nomes canônicos AIAS, cobertura AIAS, forma MEC, itálico em referências, README completo e sincronia de agentes. Na falha, mostra o diagnóstico do check. Use `--quiet` para só exit code 0/1 e falhas.

```bash
./audit.sh          # completo
./audit.sh --quiet  # só exit code
```

Comando não coberto pelo script (hubs do grafo):

```bash
awk '/^## Dependências/{flag=1; next} /^## /{flag=0} flag' skills/*/SKILL.md | grep "^\- \`" | grep -oP "(?<=\`)[^\`]+(?=\`)" | sort | uniq -c | sort -rn | head -15
```

## Estrutura

```
.
├── audit.sh          # Auditoria de integridade (rode após mudanças)
├── install-skills.sh  # Instala skills nos CLIs (exige flags)
├── uninstall-skills.sh # Remove skills dos CLIs (exige flags)
├── CLAUDE.md          # Instruções principais (leia primeiro)
├── CONTRIBUTING.md    # Template e checklist para criar/editar skills
├── CHANGELOG.md       # Histórico de versões (atualize ao modificar)
├── README.md          # Visão geral e listagem de skills (audit.sh exige sincronia)
├── AGENTS.md          # Este arquivo
├── opencode.json      # Config OpenCode (schema mínimo)
├── .gitignore         # raw-pdfs/ ignorado
├── raw-pdfs/          # PDFs normativos (não versionados)
├── assets/            # SVGs do grafo (hub-chart, hub-star, hub-network)
├── agents/            # Specs de agentes (também em .opencode/agents/)
└── skills/            # N skills (confira com `ls skills | wc -l`)
```

## Workflow

1. Leia `CLAUDE.md` para contexto completo.
2. Consulte `CONTRIBUTING.md` ao criar/editar skills.
3. Após modificar, rode `./audit.sh` para verificar o grafo.
4. Atualize `CHANGELOG.md`.
5. Incremente `version` no frontmatter de skills editadas (minor = conteúdo; major = mudança estrutural).
