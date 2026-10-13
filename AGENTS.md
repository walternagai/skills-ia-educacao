# AGENTS.md — skills-ia-educacao

## Natureza

Acervo **documental**, não uma aplicação: skills em Markdown (`skills/*/SKILL.md`), manual em LaTeX (`manual/`) e specs de subagentes (`agents/`). Não há código Python nem build de software; o que é executável aqui é **verificação**, não produto:

- `./audit.sh` — integridade do acervo (frontmatter, grafo de dependências, README, sincronia dos agentes, nomes canônicos AIAS). **É o lint do projeto.**
- `make -C manual` (ou `manual/compilar.sh`) — compila o manual LaTeX em 4 passadas (`pdflatex` → `bibtex` → `pdflatex` ×2); exige TeX Live com `pdflatex` e `bibtex`.

Não há CI (sem `.github/`) nem pre-commit. Contagem de skills: `ls skills | wc -l` (atual: 62) — docs podem estar desatualizados, o diretório manda.

> `.pytest_cache/` e `.ruff_cache/` na raiz são resíduos de execuções do kata sem `.kata/config.yaml` (caiu nos defaults Python). Não são dependências do projeto.

## Fonte primária

Leia `CLAUDE.md` antes de qualquer operação — arquitetura das skills, categorias, tabela AIAS, convenções de edição. `CONTRIBUTING.md` traz o template e o checklist de skill.

## Manual AvalIA (`manual/`)

`main.tex` + capítulos `capN-*.tex` + `referencias.bib`; o PDF compilado `manual/main.pdf` **é versionado**.

- O build **regrava `main.pdf` a cada execução** (pdfTeX grava `/CreationDate`), deixando o arquivo rastreado "modificado" mesmo sem mudança de conteúdo. Para verificar sem sujar o PDF, compile numa cópia temporária — é o que o gate `test` do kata faz.
- Artefatos `manual/*.{aux,bbl,blg,log,out,toc,fls,fdb_latexmk,synctex.gz}` são ignorados (`.gitignore`).
- O log do pdflatex emite acentuação em Latin-1 (avisos `Underfull`, ex.: `ç` = `0xE7`), que **não é UTF-8 válido** — ferramentas que leem stdout em UTF-8 estrito podem quebrar.

## Verificação (kata)

`.kata/config.yaml` define os três gates reais do ciclo kata. Sem esse arquivo o kata usa os defaults Python (`ruff`/`pytest`) e marca o VERIFY como *faked*:

- `lint` → `./audit.sh --quiet`
- `test` → `make -C manual` (em cópia temporária)
- `coverage` → toda skill de `skills/` catalogada em `manual/*.tex` (`gate: 100`; hoje 62/62)

`.kata/*.yaml` são tarefas/histórico do ciclo kata — não são código do projeto.

## OpenCode vs. Claude Code

- As skills deste repo **já estão** no system prompt via tool `skill` — **não** rode `npx skills add` (isso é Claude Code; use `install-skills.sh`).
- `agents/` e `.opencode/agents/` contêm os 6 subagentes (`artesao-de-skills`, `construtor-de-avaliacoes`, `planejador-pedagogico`, `aplicador-de-rubricas`, `coach-de-feedback-formativo`, `gerador-de-questoes-bloom`), acionáveis via Task com `subagent_type`.
- **Sincronia obrigatória**: `agents/` é a fonte canônica; `.opencode/agents/` é a cópia que o OpenCode carrega. Ao editar um agente, atualize **as duas** (audit.sh verifica identidade).
- `.opencode/node_modules/` são dependências do runtime OpenCode — não edite nem audite.
- `CLAUDE.md` é para Claude Code; `AGENTS.md` é o complemento para OpenCode.

## Instalação e diagnóstico de skills em CLIs

Use `./install-skills.sh` / `./uninstall-skills.sh` — **exigem flags** (sem argumentos só imprime usage; o auto-detect documentado no cabeçalho é código morto):

```bash
./install-skills.sh --all                 # instala em todos os destinos (mesmo sem CLI)
./install-skills.sh --claude --opencode   # destinos explícitos
./install-skills.sh --dry-run             # mostra o que seria feito sem copiar
./uninstall-skills.sh --all               # remove de todos os destinos
./uninstall-skills.sh --codex --dry-run   # mostra o que seria removido
```

Scripts de diagnóstico (mesmos destinos/flags):

```bash
./doctor-skills.sh --all        # pré-requisitos (bash, curl, git, node >= 18, npm, CLIs); --fix instala CLIs ausentes via npm
./info-skills.sh                # estado da instalação nos CLIs detectados (completo/parcial/nada + subagentes)
./info-skills.sh --all --verbose # todos os destinos + skills faltantes
```

**Windows nativo (CMD/PowerShell)**: os quatro scripts têm equivalente em batch — `install-skills.bat`, `uninstall-skills.bat`, `doctor-skills.bat` (com `--fix`) e `info-skills.bat` — chamados como `.\install-skills.bat --all` etc. (mesmas flags e códigos de saída; o `.bat` instala o CLI via winget/npm).

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
- **Slug**: prefixo `ia-educacao-`; exceção única: `aias-consultant` (sem prefixo).
- **Modelo**: `model: any` no frontmatter — skills independentes de CLI/fornecedor.
- **Dependências**: referenciar **apenas** skills dentro de `skills/` deste repo — nunca skills externas (ex: `bloom-taxonomy-educator`); formato `- \`slug\``, e o slug deve bater exatamente com o campo `name` da skill referenciada.
- **AIAS**: 5 níveis fixos com nomes canônicos (tabela no `CLAUDE.md`). Não alterar sem revisar todas as skills.
- **Versionamento**: ao editar skill, incremente `version` no frontmatter (minor `1.2`→`1.3` = conteúdo; major `1.x`→`2.0` = estrutural).
- **`TMP_VERSION_PLACEHOLDER`**: não reintroduzir (audit.sh falha se presente).
- **Referências**: formato ABNT.
- **`raw-pdfs/`**: no `.gitignore` — PDFs normativos não versionados.
- **`instrumento-tam-docentes.md` + `-resumo.md`** (raiz): instrumento TAM standalone, **não é skill** — não adicioná-lo a `skills/`, ao README ou ao catálogo.
- **`CHANGELOG.md`**: atualizar a cada mudança relevante (Keep a Changelog).

## Auditoria

Rode `./audit.sh` após qualquer mudança em skills, agentes ou README — cobre: frontmatter (campos, `version X.Y`, fechamento), 8 seções fixas na ordem canônica, `model: any`, placeholder, dependências apenas do repositório (`ia-educacao-*`/`aias-consultant`), `name` == diretório, `name` único, slug/categoria válidos, órfãs, dependências quebradas, nomes canônicos AIAS, cobertura AIAS, forma MEC, itálico em referências, README completo e sincronia de agentes. Na falha, mostra o diagnóstico do check.

```bash
./audit.sh          # completo
./audit.sh --quiet  # só exit code 0/1 e falhas
```

Comando não coberto pelo script (hubs do grafo):

```bash
awk '/^## Dependências/{flag=1; next} /^## /{flag=0} flag' skills/*/SKILL.md | grep "^\- \`" | grep -oP "(?<=\`)[^\`]+(?=\`)" | sort | uniq -c | sort -rn | head -15
```

## Estrutura

```
.
├── audit.sh           # lint/integridade do acervo (rode após mudanças)
├── install-skills.sh  # instala skills nos CLIs (exige flags)
├── uninstall-skills.sh # remove skills dos CLIs (exige flags)
├── doctor-skills.sh   # pré-requisitos do ambiente (--fix para corrigir)
├── info-skills.sh     # estado da instalação por CLI (auto-detect sem flags)
├── *.bat              # equivalentes Windows dos 4 scripts acima
├── CLAUDE.md          # instruções principais (leia primeiro)
├── CONTRIBUTING.md    # template + checklist de skill
├── CHANGELOG.md       # histórico de versões (atualize)
├── README.md          # visão geral + catálogo (audit.sh exige sincronia)
├── AGENTS.md          # este arquivo
├── opencode.json      # config OpenCode (schema mínimo)
├── instrumento-tam-docentes(.resumo).md  # instrumento TAM standalone (não é skill)
├── manual/            # Manual AvalIA em LaTeX (build: make -C manual; main.pdf versionado)
├── .kata/             # config.yaml (gates) + tarefas do ciclo kata
├── .opencode/         # agents/ (cópia carregada pelo OpenCode) + node_modules/
├── assets/            # SVGs do grafo (hub-chart, hub-star, hub-network)
├── agents/            # specs canônicas dos 6 subagentes
└── skills/            # 62 skills (confira com `ls skills | wc -l`)
```

## Workflow

1. Leia `CLAUDE.md` para contexto completo.
2. Consulte `CONTRIBUTING.md` ao criar/editar skills.
3. Após modificar skills/agentes/README, rode `./audit.sh`.
4. Mexeu no `manual/`? Compile com `make -C manual` e confira o PDF.
5. Atualize `CHANGELOG.md` e incremente `version` no frontmatter das skills editadas (minor/major conforme a mudança).
