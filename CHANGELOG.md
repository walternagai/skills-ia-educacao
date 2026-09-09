# Changelog

Todas as mudanças relevantes neste repositório são registradas aqui.
Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/).

---

## [Não publicado]

### Corrigido
- **Scripts Windows (`.bat`) — correção de defeitos na trilha nativa**:
  - **`info-skills.bat` abortava no final (exit 255, sem linha `Resultado`)**: `)` não escapado em `echo` dentro de bloco `if` — corrigido com `^)` (causa: `. foi inesperado neste momento`)
  - **`doctor-skills.bat` abortava após a checagem do git (exit 255)**: `)` não escapado quebrava o bloco, justamente no ramo "CLI ausente" (node/npm/CLIs faltantes). Como `call :rotulo` dentro de bloco corrompe qualquer escape de `)` (vira `^^)` literal ou quebra o bloco), as mensagens via `call` foram reformuladas sem parênteses (`(texto)` → `- texto`); `^)` mantido apenas nos `echo` diretos, onde funciona. Comentário de guarda adicionado ao cabeçalho do script
  - **`install-skills.bat` — IDs winget**: OpenCode `sst.opencode` → `SST.opencode` (a busca exata `-e` do winget diferencia maiúsculas; o ID minúsculo causava "Nenhum pacote encontrou os critérios"); removido `Google.GeminiCLI` (pacote inexistente no winget — Gemini CLI é só npm) com fallback que sugere `npm install -g @google/gemini-cli` quando não há ID winget
  - **`doctor-skills.bat` — dica do OpenCode**: `winget: sst.opencode` → `winget: SST.opencode`
  - Validado no Windows: `info --all` (exit 0, `Resultado: OK`), `doctor --all/--opencode` (diagnóstico completo até o placar), `install --opencode` (62/62) e `install --gemini --dry-run` (dica npm, sem prompt)

## [0.10.6] — 2026-09-08

### Corrigido
- **Manual (`manual/`) — ajustes tipográficos no Cap. 10 (casos de uso)**:
  - Tabela 10.1 (Como Escolher o Caso de Uso Adequado): coluna "Necessidade Docente" alargada (3,2cm → 6,5cm) para acomodar os textos sem quebra forçada
  - Tabela 10.2 (Cenários Validados por Área STHEM): colunas de cenário e skills rebalanceadas (4,6/3,6cm → 4,5/3,5cm) e rótulos das áreas (Science, Technology, Humanities, Engineering, Mathematics) em itálico
  - Tabela 10.3 (Checklist de Validação Docente): coluna "Pergunta de Checagem" alargada (3,5cm → 4,4cm)
  - Manual recompilado (`main.pdf` atualizado)

## [0.10.5] — 2026-09-08

### Adicionado
- **`doctor-skills.sh` — diagnóstico de pré-requisitos (Linux, macOS e Windows via Git Bash/WSL2)**: verifica ambiente base (bash, curl, git, node >= 18, npm, acervo, subagentes no repositório) e, por CLI, se o binário está no PATH e se o diretório de skills existe. Flags `--all`/destinos explícitos, `--fix` (instala CLIs ausentes via npm quando possível) e `--help`. Placar final com código de saída (0 = OK, 1 = faltam pré-requisitos essenciais).
- **`info-skills.sh` — relatório do estado da instalação**: informa, por CLI, se o binário está no PATH e quantas skills do acervo estão instaladas (completo/parcial/nada), com `--verbose` para listar faltantes; sempre relata os 6 subagentes do OpenCode e exibe os comandos de conferência manual do Cap. 4 do manual. Auto-detect de CLIs instalados (ou `--all`/destinos explícitos). Código de saída: 0 = há instalação, 1 = nada instalado.
- **`doctor-skills.bat` e `info-skills.bat` — equivalentes nativos do Windows**: mesmos diagnósticos/relatórios em batch para CMD e PowerShell. `doctor-skills.bat` verifica bash (opcional, trilha Git Bash/WSL2), curl, git, node >= 18, npm, acervo, subagentes e CLIs, com `--fix` via npm; `info-skills.bat` reporta CLI/skills/subagentes por destino (completo/parcial/nada, `--verbose`), com comandos de conferência em PowerShell. Mesmos códigos de saída dos pares `.sh`.
- **Documentação cruzada dos scripts de diagnóstico**: README ganha seção "Diagnosticar o ambiente" (doctor/info em `.sh` e `.bat`) e item de inventário; AGENTS.md atualiza "Instalação e diagnóstico de skills em CLIs" (comandos, `--fix`, `.bat`) e a árvore de Estrutura; Manual Cap. 4 menciona `info-skills` na Conferência da Instalação e `doctor-skills --fix` antes da instalação. PDF recompilado (66 páginas).

## [0.10.4] — 2026-09-08

### Adicionado
- **`install-skills.bat` e `uninstall-skills.bat` — suporte nativo ao Windows 11**: espelhos em batch dos scripts shell, executáveis no CMD e no PowerShell, com as mesmas flags (`--all`, destinos explícitos, `--dry-run`). Quando o CLI alvo não é encontrado no PATH, o `install-skills.bat` oferece a instalação via `winget` (se disponível) ou sugere o pacote npm equivalente. Destinos em `%USERPROFILE%` (`.claude\skills`, `.config\opencode\skills`, `.agents\skills`, `.gemini\antigravity\skills`, `.gemini\antigravity-cli\skills`, `.gemini\skills`); remoção preserva skills de terceiros; cópia com `xcopy` remove o destino prévio para evitar aninhamento na re-instalação.
- **Manual AvalIA — Cap. 4 documenta a trilha Windows nativa**: nova subseção "Trilha alternativa: Windows nativo (CMD ou PowerShell)" com os comandos `.\install-skills.bat` (dry-run, instalação, `--all`), comportamento de auto-detect e oferta de instalação do CLI via winget/npm; referências ao script bash atualizadas em todo o capítulo (clonagem/atualização, subagentes). PDF recompilado (66 páginas).

## [0.10.3] — 2026-09-08

### Corrigido
- **`install-skills.sh` e `uninstall-skills.sh` — portabilidade e robustez**:
  - **Compatibilidade com bash 3.2 (macOS)**: `declare -A` (arrays associativos, bash 4+) substituído por funções `case` (`dest_of`/`bin_of`), permitindo execução no bash nativo do macOS, Git Bash e WSL2
  - **Aninhamento em re-instalação**: `install-skills.sh` agora remove o destino prévio de cada skill antes do `cp -r`, evitando `dest/slug/slug/SKILL.md` ao atualizar o acervo
  - **Falha de cópia detectada**: `cp` com verificação de erro — aborta a instalação com mensagem em caso de falha
  - **`rm -rf` protegido**: `${dest:?}` impede expansão acidental para `/` (SC2115)
  - **Contagens por glob**: substituídas as contagens com `ls` por globs (SC2012), contando apenas skills do acervo na verificação
  - Shellcheck limpo (exit 0) e testes de instalação/re-instalação/remoção validados em ambiente isolado

## [0.10.2] — 2026-09-08

### Modificado
- **`README.md` — documentação do acervo atualizada**:
  - Inventário do repositório expandido: **Manual AvalIA** (`manual/`, com PDF compilado em `manual/main.pdf`), **subagentes** (`agents/` e `.opencode/agents/`) e **scripts de instalação** (`install-skills.sh` / `uninstall-skills.sh`)
  - Instalação migrada de `npx skills add` (Claude Code) para `./install-skills.sh` com flags (`--all`, destinos explícitos, `--dry-run`) e remoção via `uninstall-skills.sh`
  - Nova seção "Manual AvalIA" com instruções de compilação (`manual/compilar.sh` ou `make -C manual`)

## [0.10.1] — 2026-09-08

### Corrigido
- **Compatibilidade entre CLIs**:
  - Manual e README agora distinguem explicitamente as 62 skills multiplataforma dos 6 subagentes específicos do OpenCode
  - `install-skills.sh` passou a declarar explicitamente que instala somente skills e não agentes
  - Documentada a necessidade de adaptar os subagentes ao formato de agentes de Claude Code, Codex, Gemini CLI ou outros clientes

## [0.10.0] — 2026-09-08

### Corrigido
- **Manual — revisão para docentes iniciantes no uso de IA**:
  - Corrigida a contradição entre a orientação de privacidade do Cap. 7 e o Caso 3 do Cap. 10; o exemplo agora usa necessidade pedagógica informada pelo estudante, sem diagnóstico ou dado clínico
  - Atualizado o fluxo de provedores do OpenCode para `/connect` e `/models`
  - Documentada a instalação global dos seis subagentes e removido `model: any` dos arquivos de agentes, permitindo herança do modelo principal
  - Incluído alerta de senha e rede autorizada para `opencode web --hostname 0.0.0.0`
  - Qualificada a garantia de aprovação manual de alterações conforme as permissões configuradas
  - Revisadas as orientações de LGPD: minimização, pseudonimização, retenção, descarte e limites do processamento local
  - AIAS 1, 4 e 5 revisados para separar uso permitido de uso obrigatório, preservar tecnologias assistivas e evitar atribuição de coautoria à IA
  - Cap. 6 revisado para tratar modelos gratuitos como catálogo volátil, com linguagem não promocional e orientação de verificação em `/models`
  - Incluídos rota rápida, vocabulário mínimo, troubleshooting e checklist de proteção de dados
  - Cenários de uso passaram a explicitar adaptação, validação e caráter não determinístico dos artefatos gerados
  - Reduzidas afirmações absolutas e termos promocionais nos capítulos introdutórios e técnicos

## [0.9.19] — 2026-09-08

### Adicionado
- **Manual (`manual/`) — identificação institucional do Projeto AvalIA**:
  - Capa renomeada para o título principal do projeto: *AvalIA: Kit de Avaliação Formativa com Inteligência Artificial para Professores do Ensino Superior*
  - Inclusão do autor Walter Aoiama Nagai, ICT/UNIFEI — Campus de Itabira
  - Metadados PDF atualizados com autoria e título do projeto
  - Inclusão de instruções para clonar ou baixar o repositório do GitHub antes da instalação das skills

## [0.9.18] — 2026-09-08

### Corrigido
- **Manual (`manual/`) — auditoria geométrica de layout (Caps. 4, 5, 7, 8, 10 e geral)**:
  - Tabela 4.1 (Suporte por SO): eliminados overfull hbox de até 178pt (~63mm) — caminhos migrados de `\texttt` para `\path` (hifenização automática) e colunas redimensionadas
  - Causa raiz do overfull vbox de 11pt corrigida: `setheadfoot` elevado de 18pt para 30pt (cabeçalhos com títulos de seção em 2 linhas esticavam a página; warning do memoir eliminado)
  - Cap. 9: uniformização tipográfica das 6 tabelas de catálogo para `\footnotesize` e remoção dos `\addlinespace` das tabelas de 13 linhas (Ferramentas Partes 1–2)
  - Cap. 10: box de convenções de invocação encurtado (9 → 4 linhas) e Tabela 10.1 em float `[tbp]`
  - Verificação por bounding-box (`pdftotext -bbox`) com layout espelhado twoside: **zero palavras fora das margens** no corpo de todo o documento; zero overfull hbox/vbox; zero warnings de cabeçalho
  - Manual recompilado (`main.pdf`, 62 páginas)

## [0.9.17] — 2026-09-08

### Adicionado
- **Manual (`manual/`) — cenários validados por área STHEM (Cap. 10)**:
  - Nova seção "Cenários por Área STHEM" com um cenário por área (Science, Technology, Humanities, Engineering, Mathematics), tabela de cenários validados (necessidade docente, skills selecionadas, nível AIAS típico) e prompts comprovados no OpenCode real (headless `opencode run`, v1.18.29)
  - Testes empíricos documentados: em todos os cenários o OpenCode selecionou corretamente as skills a partir da descrição da tarefa, sem citar slugs (ex.: História → `ia-educacao-avaliacao`; Biologia → `escrita` + `avaliacao-projeto`; Eng. Civil → `rubrica`; Cálculo 1 → `banco-questoes` + `mcq`; Ci. da Computação → `pbl` + `avaliacao-projeto`)
  - Dica Prática declarando a validação empírica dos 4 casos de uso + 5 cenários STHEM (skills carregadas via `skill()` confirmadas pelos agentes) e documentação do caveat técnico `model: any` na delegação via Task (exige ID de modelo real; o agente principal assume o papel quando a delegação falha, preservando o resultado)

### Corrigido
- **Manual (`manual/`) — auditoria dos modelos do Cap. 6 (fontes primárias)**:
  - Ling: "consórcio aberto" corrigido para "laboratório inclusionAI (iniciativa de projetos abertos da Ant Group)", conforme GitHub oficial verificado
  - Big Pickle: procedência adicionada — stealth model mantido pelo próprio OpenCode Zen (plataforma curada da Anomaly)
  - Nemotron 3 Ultra: perfil corrigido com dados verificados (MoE 550B/55B ativos, arquitetura híbrida Transformer-Mamba)
  - Aviso de privacidade do período gratuito (coleta de dados por provedor) com remissão ao Cap. 7 (LGPD)
  - Removido bloco de `itemize` duplicado do Nemotron 3.5 Lightning
  - Manual recompilado (`main.pdf` atualizado)

## [0.9.16] — 2026-09-08

### Adicionado
- **Manual (`manual/`) — cenários de uso por área STHEM (Cap. 10)**: cinco cenários testados no OpenCode real com a skill identificada espontaneamente pelo agente a partir do objetivo pedagógico

## [0.9.15] — 2026-09-08

### Adicionado
- **Manual (`manual/`) — autoria e procedência dos conceitos utilizados**:
  - Nova subseção no Cap. 3 ("Quem Criou as Skills, os Subagentes e o OpenCode?"): OpenCode como projeto MIT da empresa Anomaly (abril/2025); Skills como padrão aberto Agent Skills proposto pela Anthropic (dez/2025), adotado por Claude Code, Gemini CLI, GitHub Copilot, Cursor e Goose; Subagentes como conceito difundido pelo Claude Code e implementado via `.opencode/agents/` — os seis subagentes e as 62 skills são criação própria do acervo
  - MCP (Model Context Protocol) creditado à Anthropic (David Soria Parra e Justin Spahr-Summers, nov/2024), doado à Agentic AI Foundation (Linux Foundation) em dez/2025; demais conceitos não-autorais documentados (tool calling, TUI, Ollama)
  - Cap. 4: nota de autoria na visão geral (Anomaly, MIT, padrões abertos)
  - Cap. 6: nota de procedência dos modelos gratuitos (Nemotron/NVIDIA, Ling/inclusionAI, MiMo/Xiaomi, Muse Spark/Meta — o OpenCode apenas orquestra o acesso)
  - Cinco novas entradas ABNT verificadas em `referencias.bib` (ANTHROPIC 2024; 2025; PARRA; OPENCODE 2026; OLLAMA 2025)
  - Manual recompilado (`main.pdf` atualizado)

## [0.9.14] — 2026-09-08

### Corrigido
- **Manual (`manual/`) — colchetes angulares `< >` indesejados nos identificadores**:
  - Causa raiz: o `abntex2cite.sty` impõe `\UrlLeft{<}` e `\UrlRight{>}`, fazendo com que todo comando `\path{...}` renderizasse `<@subagente>` e `<skill-slug>` ao invés de `@subagente` e `skill-slug` (afetava o Cap. 10 e demais referências ao longo do manual)
  - Correção no preâmbulo (`main.tex`): restaurados os delimitadores vazios após o carregamento do estilo ABNT
  - PDF recompilado e verificado: zero ocorrências de `< >` remanescentes

## [0.9.13] — 2026-09-08

### Modificado
- **Manual (`manual/`) — parágrafos explicativos no catálogo de skills (seção 9.3)**:
  - Adicionado parágrafo de abertura na seção "Catálogo das 62 Skills", explicando a lógica progressiva das cinco categorias (ensino → docência → salvaguardas → equidade → instrumentos) e como usar os slugs canônicos na invocação `/slug`
  - Cada categoria (Níveis de Ensino, Formação Docente, Ética e Governança, Inclusão e Equidade, Ferramentas Práticas) recebeu parágrafo introdutório com pergunta orientadora própria (para quem, como ensina, sob quais condições, quem pode ser deixado para trás, o que produzir agora), aproximando a navegação pelo catálogo à necessidade concreta do docente
  - Manual recompilado (`main.pdf` atualizado)

## [0.9.12] — 2026-09-08

### Modificado
- **Manual (`manual/`) — revisão metodológica e pedagógica extensa**:
  - **Objetivos de aprendizagem em todos os capítulos**: novo ambiente tipográfico `objetivos` ("Ao final deste capítulo, você será capaz de...") adicionado no preâmbulo e aplicado aos 10 capítulos, alinhando o manual à pedagogia que ensina (resultados desejados antes do conteúdo)
  - **Cap. 1 reestruturado**: seção "Propósito do Manual" movida do final para a abertura do capítulo (antes o leitor só descobria o mapa de leitura após ler toda a teoria sobre IA/AIAS); duplicata removida
  - **Cap. 3**: escopo explícito para a seção técnica "Grafo de Dependências" — dica pedagógica avisa que o conteúdo é para quem cria/modifica skills e oferece rota direta ao Cap. 4
  - **Cap. 10**: nova tabela "Como Escolher o Caso de Uso Adequado" com índice de navegação por necessidade docente (planejar, avaliar, feedback inclusivo, aula ativa), facilitando a localização rápida do caso relevante
  - Manual recompilado (`main.pdf` atualizado)

## [0.9.11] — 2026-09-08

### Adicionado
- **Manual (`manual/`) — guia de controle de versão com Git para iniciantes (opcional)**:
  - Nova seção no Cap. 4: "Controle de Versão com Git para Iniciantes" — conceito explicado para não-programadores (analogia das "fotografias"/commits), instalação por SO (Windows/Git Bash, Linux via apt/dnf, macOS), configuração inicial, `git init`, ciclo básico (`git add`/`git commit`), recuperação de versões (`git log`, `git restore`, `git checkout`) e dica de segurança com o painel de histórico do OpenCode
  - Cap. 5 (Desktop): box "Segurança e Controle de Versão" reformulado — Git apresentado como medida **facultativa** (antes parecia obrigatório), com remissão ao novo guia do Cap. 4 e reforço de que a aprovação visual de alterações já protege o trabalho docente
  - Manual recompilado (`main.pdf` atualizado)

## [0.9.10] — 2026-09-08

### Modificado
- **Manual (`manual/`) — remissões cruzadas entre capítulos**:
  - Adicionadas referências diretas (`Capítulo~\ref{...}`) nos pontos de uso antecipado de conceitos: Cap. 2 cita `ia-educacao-dua` e `coach-de-feedback-formativo` remetendo aos Cap. 3 e 9; Cap. 5 remete o detalhamento dos subagentes ao Cap. 9; Cap. 6 remete os subagentes recomendados ao Cap. 9; Cap. 7 remete os seis subagentes ao Cap. 9
  - Cap. 9 ganhou remissão reversa ao Cap. 3 (definição de skill, padrão `SKILL.md` e invocação por barra)
  - Cap. 10 ampliou o box de convenções com remissão aos Cap. 3 e 9
  - Ordem dos capítulos preservada; manual recompilado (`main.pdf` atualizado)

## [0.9.9] — 2026-09-08

### Modificado
- **Manual (`manual/`) — convenções de invocação e suporte multiplataforma**:
  - **Sintaxe de invocação de skills (`/`)** — Cap. 3 define a convenção `\emph{slash command}` (`/nome-da-skill`, ex.: `/ia-educacao-rubrica`, `/aias-consultant`), com distinção entre digitação direta na interface e menção do slug dentro do prompt; Cap. 4 (TUI) e Cap. 5 (Desktop) atualizados com exemplos com barra
  - **Sintaxe de invocação de subagentes (`@`)** — Cap. 9 define a convenção `\emph{agent mention}` (`@nome-do-subagente`, ex.: `@planejador-pedagogico`, `@construtor-de-avaliacoes`); menções em Cap. 5, 6, 7 e 10 padronizadas para a forma com arroba; tabela de síntese e esquemas YAML preservam os identificadores canônicos sem `@`
  - **Suporte multiplataforma (Windows predominante, Linux e macOS)** — Cap. 4 reestruturado: nova tabela de suporte por SO (terminais, métodos de instalação e diretório das skills), detalhamento das trilhas Windows (WSL2 vs. nativa via Scoop/Chocolatey), métodos de instalação nomeados por SO, caminhos de skills por sistema (`~/.config/opencode/skills` vs. `C:\Users\<usuario>\.config\opencode\skills`), limitação do `install-skills.sh` a ambientes Unix (Linux/macOS/WSL2/Git Bash) e comandos de conferência equivalentes em Bash e PowerShell
  - Manual recompilado (`main.pdf` atualizado)

## [0.9.8] — 2026-09-08

### Corrigido
- **Prompts de subagentes no manual (validação CoVe)** — auditoria cruzada entre `manual/cap9-agentes-skills.tex`, `manual/cap10-casos-de-uso.tex` e as fontes canônicas (`agents/*.md`, `skills/*/SKILL.md`):
  - **`planejador-pedagogico` no Cap. 9** — lista de skills recomendadas corrigida para refletir o passo 7 do workflow real do agente (`aias-consultant`, `ia-educacao-avaliacao`, `ia-educacao-rubrica`, `ia-educacao-planejamento-didatico`, `ia-educacao-integridade-academica`, `ia-educacao-etica`); removidas citações sem suporte (`planejamento-reverso`, `bloom`, `dua`)
  - **Sintaxe de invocação no Cap. 10** — padronizada a menção canônica de subagentes do OpenCode (`@planejador-pedagogico`, `@construtor-de-avaliacoes`, `@coach-de-feedback-formativo`) e adicionada nota explicativa sobre a forma canônica de acionamento
  - **Caso 1 do Cap. 10** — descrição de skills acionadas alinhada às recomendações reais do agente
  - Manual recompilado (`main.pdf` atualizado)

## [0.9.7] — 2026-09-08

### Adicionado
- **Manual de Skills e Agentes para OpenCode (`manual/`)** — documentação abrangente em LaTeX com classe `memoir`, divisão modular em 10 capítulos e referências bibliográficas no padrão ABNT via ABNTeX2:
  - Cap. 1: Introdução (avaliação formativa e a Escala AIAS)
  - Cap. 2: Fundamentos pedagógicos (feedback Hattie/Timperley, Taxonomia de Bloom, rubricas, Backward Design e DUA)
  - Cap. 3: O que são skills e como funcionam com OpenCode (arquitetura `SKILL.md` e injeção dinâmica)
  - Cap. 4: Instalação e configuração do OpenCode.ai (passo a passo CLI, providers e sincronização de skills)
  - Cap. 5: Fluxo de trabalho na interface gráfica e Desktop (OpenCode Web UI e aprovação de ações)
  - Cap. 6: Escolha de modelos gratuitos no OpenCode (Big Pickle, Ling 3.0 Flash Fin, Mimo V2.5, Muse Spark 1.2/1.3, Nemotron 3 Ultra e 3.5 Lightning)
  - Cap. 7: Ética, limitações, LGPD e transparência (supervisão humana e mitigação via Chain-of-Verification)
  - Cap. 8: Como explicar IA aos estudantes (contrato pedagógico, metáforas e tradução da AIAS)
  - Cap. 9: Agentes especializados e catálogo de skills (os 6 subagentes e as 62 skills do repositório)
  - Cap. 10: Casos de uso iniciais e checklist de validação docente
- Script de compilação automatizada `manual/compilar.sh` e `manual/Makefile`, com PDF compilado `manual/main.pdf`

### Removido
- Arquivos legados e apresentações antigas substituídos pelos subagentes oficiais em `agents/` e `.opencode/agents/` (`SKILL_bloom-question-generator.md`, `SKILL_formative-feedback-coach.md`, `SKILL_rubric-applier.md`, `apresentacao-skills.html`, `apresentacao-skills.md`)

## [0.9.6] — 2026-09-07

### Verificado
- **Caveats do v0.9.3 fechados** — checagem contra fontes primárias concluída:
  - **ISSNs de RBIE/SBIE confirmados** no ISSN Portal (fonte oficial): `2317-6121` = Revista Brasileira de Informática na Educação (Online), variante RBIE; `2316-6533` = Anais do Simpósio Brasileiro de Informática na Educação (Online), variante Anais do SBIE — corretos em `ecossistema-inovacao`, sem edição necessária
  - **Limiar de frequência confirmado** (permanencia): Art. 24, inciso VI da LDB — frequência mínima de 75% do total de horas letivas — correto
  - **Resolução CNE/CES 7/2018 confirmada** (aprendizagem-servico): estabelece 10% da carga horária de graduação em extensão (curricularização) — correta

### Modificado
- **`ia-educacao-aprendizagem-servico`** — descrição de frontmatter encurtada (618 → ~550 chars), removendo gatilhos redundantes; `version` 1.4 → 1.5
- **Descrições de frontmatter encurtadas em 11 skills** (padrão recorrente >600 chars, varredura TWIN CHECK): ecossistema-inovacao (623→~550, v1.13), mcq (618→~550, v1.9), rubrica (616→~550, v1.8), dua (616→~550, v1.9), portfolio (615→~550, v1.8), design-problema (608→~550, v1.7), avaliacao-oral (604→~550, v1.9), simulacao (603→~550, v1.6), rascunho (603→~550, v1.9), pesquisa (602→~550, v1.6), peer-instruction (601→~550, v1.7) — gatilhos redundantes removidos, essenciais de ativação mantidos

## [0.9.5] — 2026-08-12

### Modificado
- **`apresentacao-skills.md` revisada com o estado atual do acervo**:
  - **"Como usar" atualizado** — `npx skills add` (específico do Claude Code) substituído pelo `install-skills.sh`/`uninstall-skills.sh` multi-CLI, com as flags principais (`--all`, destinos explícitos, `--dry-run`)
  - **Seções canônicas da skill** — adicionada "Quando usar" à lista de seções do slide Visão Geral (8 seções, conforme `CLAUDE.md`)
  - **Tabela da Escala AIAS** — adicionada coluna "Produto final", alinhando à tabela canônica de `CLAUDE.md`
  - Contagens verificadas e mantidas: 62 skills, categorias 5+18+8+5+26, hubs do grafo e nomes AIAS inalterados

## [0.9.4] — 2026-08-12

### Corrigido
- **Sprint 5 de revisão editorial (kata)** — consistência entre skills irmãs em 6 skills:
  - **Fator de ajuste padronizado em 0,5–1,25** (avaliacao-projeto alinhado a avaliacao-grupo, skill especialista em peer assessment; teto justificado "para evitar inflação")
  - **Nível Bloom corrigido para 1–6 (Lembrar a Criar)** em banco-questoes — a taxonomia revisada tem 6 níveis; a tabela de metadados e o cenário 2 omitiam "Criar"
  - **Duplicação TCC/AIAS removida** em superior — "Quando usar" agora referencia o Workflow (passo 7) em vez de repetir o conteúdo
  - **WHERETO esclarecido** em planejamento-reverso — nota explicando que o acrônimo tem dois E's distintos ("Equipar" e "Avaliar")
  - **Limiar de palavras esclarecido** em rascunho — nota explicando por que a síntese de leitura usa ≤10 palavras e os passos de raciocínio ≤5
  - **Exemplo Khan Academy movido do Workflow para Exemplos** em sti (passo 6 era específico demais para uma skill genérica)
- `version` incrementada nas 6 skills afetadas

### Verificado sem alteração
- Cenários de avaliacao-competencia usam níveis de proficiência (1–5) e AIAS como escalas distintas — sem conflito
- Descrição AIAS em avaliacao, integridade-academica e transparencia é contextual, não duplicada literalmente
- Bloom×AIAS em bloom (linha 17) já explica a independência das escalas

## [0.9.3] — 2026-08-12

### Corrigido
- **Sprint 4 de revisão editorial (kata)** — referências ABNT e precisão normativa em 18 skills:
  - **ANDRADE (2019) completada** com volume, página e DOI verificados na fonte (Frontiers in Education, v. 4, p. 87, doi 10.3389/feduc.2019.00087) em autoavaliacao, portfolio, rubrica
  - **Referências com campos ausentes completadas**: OEdvig (local + URL verificada em educacaovigiada.org.br) em contratacao e ecossistema-inovacao; CUGLER (editora InternetLab); TAYLOR (local Paris: UNESCO); SEDUC-PI ×2 (local + URL); MARITACA (local); HERREID e ESPEY (DOIs/URLs)
  - **Duplicação UNESCO unificada** em ensino-medio: "AI competency framework for students (2024a)" e "Marco referencial (2024)" — mesmo documento, uma única entrada com nota de tradução
  - **Formatação ABNT**: notas entre colchetes removidas (LYMAN, BIGGS); linha em branco no meio de listas removida (governanca-dados, seguranca-digital, vieses); STAA com iniciais dos organizadores completas
- `version` incrementada nas 18 skills afetadas

### Caveats
- ISSNs de RBIE/SBIE (ecossistema-inovacao) e limiares normativos (LDB 75%, CNE/CES 7/2018) **não verificados contra fontes externas** — checagem pendente de acesso às fontes primárias

## [0.9.2] — 2026-08-12

### Modificado
- **Sprint 3 de revisão editorial (kata)** — vocabulário padronizado em 11 skills:
  - **Acrônimo STHEM padronizado**: "STEM" → "STHEM" nas 3 ocorrências divergentes (superior, rascunho, avaliacao-diagnostica), alinhando ao padrão usado em ~30 skills
  - **Estrangeirismos traduzidos**: "motivational interviewing" → "entrevista motivacional" (simulacao), "alto stakes" → "alto impacto" (sala-invertida), "dataset" → "conjunto de dados" (visualizacao-dados ×2, vieses)
  - **"free rider" definido na primeira ocorrência** de cada skill (avaliacao-grupo, tbl, pbl) — termo técnico mantido com glossário inline
  - **Redação confusa corrigida**: "distrator com > gabarito" → "distrator com mais escolhas que o gabarito" (banco-questoes)
- `version` incrementada nas 11 skills afetadas

## [0.9.1] — 2026-08-12

### Modificado
- **Sprint 2 de revisão editorial (kata)** — estrutura interna de 36 skills:
  - **Descrições de frontmatter encurtadas (18 skills)**: as 18 descrições mais longas (>600 chars) consolidadas para ~500–600 chars, removendo gatilhos redundantes e mantendo os essenciais de ativação (planejamento-reverso, avaliacao-competencia, metacognicao, dua, bloom, facilitacao, design-problema, interdisciplinaridade, avaliacao-projeto, mcq, autoavaliacao, avaliacao-diagnostica, avaliacao-grupo, banco-questoes, ecossistema-inovacao, escrita, visualizacao-dados)
  - **Parágrafos-muralha quebrados em sub-bullets (13 skills)**: contratacao (passo 3), integridade-academica (passo 4 — padrão de citação de IA extraído para bloco), sandbox (passo 3), gestao (passo 3), equidade-digital (passos 5–6), acessibilidade-inclusao (passo 2), basica (passo 2), etica (passo 8), ia-desplugada (passo 3), permanencia (passo 1), transparencia-explicabilidade (passo 5), impacto-algoritmico (passo 6), aprendizagem-ativa e avaliacao (Quando usar)
  - **Exemplos ampliados para ≥3 cenários (7 skills)**: formacao-inicial-docente, profissional-tecnologica, superior, supervisao-humana, ecossistema-inovacao, planejamento-didatico; duplicação de cenário PBL removida (aprendizagem-ativa)
- `version` incrementada nas 36 skills afetadas

## [0.9.0] — 2026-08-12

### Corrigido
- **Sprint 1 de revisão editorial (kata)** — correções de alta prioridade em 21 skills:
  - **Typos corrigidos (8)**: `redesenharía` → `redesenharia` (avaliacao-oral), `concludir` → `concluir` (pensamento-critico), `promtar` → `promptar` e `socrátivas` → `socráticas` (metacognicao), `objetos` → `objeções` (debate), `rúbrica` → `rubrica` (estudo-de-caso), `valadas` → `avaliadas` (sala-invertida), `scanneia` → `escaneia` (peer-instruction)
  - **Numeração de Workflow corrigida (9 skills)**: passos duplicados ou híbridos renumerados sequencialmente — aprendizagem-ativa, equidade-digital, letramento-dados, pensamento-critico, sti, profissional-tecnologica, formacao-inicial-docente, personalizacao, avaliacao
  - **Duplicações removidas (4)**: referência PERKINS 2024 duplicada (ensino-medio); "Relatório de calibração" ×2 unificado (autoavaliacao); "Relatório de validação" ×2 unificado (mcq); "Checklist de due diligence" ×2 unificado (contratacao)
  - **Placeholder ABNT substituído**: "Resolução CNE/CES nº ..." → Resolução CNE/CES nº 67/2019 (avaliacao-competencia)
  - **Indentação corrigida**: bullet do passo 5 do Workflow (aias-consultant)
- `version` incrementada nas 21 skills afetadas

## [0.8.3] — 2026-08-12

### Adicionado
- **`uninstall-skills.sh`** — script de remoção das skills dos CLIs de IA: mesmas flags do `install-skills.sh` (`--all`, destinos explícitos, `--dry-run`) e auto-detect de CLIs instalados. Remove apenas skills do acervo (preserva outras skills do usuário). Validado no Codex (62 removidas, `hf-cli` preservado)
- **`AGENTS.md`**: seção "CLIs e disponibilidade de skills" passa a citar `uninstall-skills.sh`

## [0.8.2] — 2026-08-12

### Adicionado
- **`install-skills.sh`** — script de instalação das skills em CLIs de IA: auto-detect de CLIs instalados (sem flags), destinos explícitos (`--claude`, `--opencode`, `--codex`, `--antigravity`, `--antigravity-cli`, `--gemini`), `--all` (instala mesmo sem CLI, com aviso) e `--dry-run`. Destinos: Claude Code `~/.claude/skills`, OpenCode `~/.config/opencode/skills`, Codex `~/.agents/skills`, Antigravity 2.0 `~/.gemini/antigravity/skills`, Antigravity CLI `~/.gemini/antigravity-cli/skills`, Gemini CLI `~/.gemini/skills`
- **`AGENTS.md`**: seção "CLIs e disponibilidade de skills" simplificada — snippet de detecção substituído por referência ao `install-skills.sh`; tabela de destinos e verificação por CLI

## [0.8.1] — 2026-08-12

### Corrigido
- **`audit.sh` reescrito com funções nomeadas** — checks com diagnóstico na falha (mostra o que quebrou, não só `✗`), `--quiet` de fato silencioso (só exit code e falhas), e correções de bugs: falso positivo em `Nível 1 (Sem IA)` (nome canônico), dead code em `REFERENCED`, `grep -oP` (GNU-only) trocado por `grep -oE` portável
- **Novos checks**: `name` == diretório, `name` único, slug válido, categoria válida, frontmatter fechado, `version X.Y`, seções na ordem canônica, README lista todas as skills, dependências externas restritas à seção `Dependências`
- **Check de itálico em referências** refinado: só flagra pares `*...*` (não confunde com `FAT*` no nome de conferência)

## [0.8.0] — 2026-08-08

### Removido
- **`TMP_VERSION_PLACEHOLDER`** — linha literal que existia no frontmatter de todas as 62 skills (commitada por engano); removida em massa, com `version` incrementada em todas as skills (ex: `1.7` → `1.8`; `aias-consultant` `3.4` → `3.5`)

### Corrigido
- **Sincronia dos agentes**: `.opencode/agents/` (cópia carregada pelo OpenCode) sincronizado com `agents/` (fonte canônica) — faltavam `model: any` e contagens desatualizadas ("54 skills") em 2 dos 3 arquivos
- **Autor institucional MEC padronizado**: 6 referências com `BRASIL. MEC.` expandidas para `BRASIL. Ministério da Educação.` (equidade-digital, seguranca-digital, gestao, basica, formacao-inicial-docente, infantil), alinhando ao padrão das demais 65 ocorrências
- **Itálico markdown removido das referências de `aias-consultant`** (4 referências com `*...*` cru) — único arquivo do acervo com asteriscos na seção Referências
- **Nomes canônicos da Escala AIAS**: "Nível 5 (Exploração)" → "Nível 5 (Exploração de IA)" em `profissional-tecnologica`; "Nível 3 (Colaboração)" → "Nível 3 (Colaboração com IA)" em `aias-consultant`
- **`ia-educacao-permanencia`**: adicionado passo de alinhamento à Escala AIAS no Workflow (a AIAS aplica-se a atividades avaliativas, não ao sistema de alerta em si)

### Adicionado
- **`audit.sh`** — script de auditoria consolidando os comandos do `AGENTS.md` (categorias, órfãs, dependências quebradas) + novos checks (frontmatter, seções, `model: any`, placeholder, dependências externas, nomes canônicos AIAS, cobertura AIAS, forma MEC, itálico em referências, sincronia de agentes)
- **Política de versionamento** documentada em `CONTRIBUTING.md` (minor = edição de conteúdo; major = mudança estrutural)

## [0.7.7] — 2026-07-10

### Modificado
- **Neutralização de dependência de CLI/modelo**: todas as 62 skills e 3 agentes (`agents/*.md`) tiveram `model: claude` / `model: anthropic/claude-sonnet-4-6` substituído por `model: any`, tornando o acervo independente de CLI ou fornecedor de modelo específico
- **Menções a "Claude" no conteúdo neutralizadas** em 9 skills (aprendizagem-servico, debate, escrita, feedback, impacto-algoritmico, interdisciplinaridade, pbl, pesquisa, simulacao) — substituídas por "IA generativa", "modelo de linguagem" ou equivalentes genéricos
- **Menções a "ChatGPT" em cenários/exemplos neutralizadas** em 3 skills (fundamentos, integridade-academica, letramento-dados) — substituídas por "IA generativa" ou "ferramenta de IA generativa"
- **Menções a "Copilot" neutralizadas** em 6 skills (aias-consultant, avaliacao-oral, dua, feedback, pbl, planejamento-reverso) — substituídas por "assistente de codificação com IA" ou "assistente de IA", com nome do produto como exemplo entre parênteses
- **Referências ABNT com "ChatGPT" no título** mantidas inalteradas (são títulos de trabalhos acadêmicos)
- **README.md**: descrição das skills neutralizada ("prontas para instalar no Claude Code" → "prontas para instalar em CLIs de IA")
- **apresentacao-skills.md**: descrição neutralizada ("skills Claude Code" → "skills para CLIs de IA")
- **CLAUDE.md**: "Skills Claude" → "Skills"
- **CONTRIBUTING.md**: template atualizado (`model: claude` → `model: any`)
- `version` incrementada em todas as 62 skills

---

## [0.7.6] — 2026-06-30

### Corrigido
- **DOI ausente nas referências dos dois artigos da Escala AIAS** (Perkins et al., 2024 e Perkins, Roe & Furze, 2025): verificados contra os PDFs fonte em `raw-pdfs/` (`AIAS-JUTLP_AI_Assessment_Scale_final.pdf` e `AIAS-JUTLP+Final+Perkins_JUTLP_2025.pdf`), que confirmam autoria, título, volume/número e ano já corretos nas 36 skills que os citam. Adicionado `Disponível em: https://doi.org/10.53761/q3azde36` e `.../10.53761/rrm4y757`, com `Acesso em: 30 jun. 2026.`, alinhando o tratamento dessas fontes eletrônicas ao já aplicado a outros artigos de acesso aberto no acervo
- `version` incrementada nas 36 skills afetadas
- Confirmado que 3 outros PDFs de AIAS em `raw-pdfs/` (EAP-AIAS, aplicação em EFL, piloto de implementação) não são citados em nenhuma skill — não é uma inconsistência, apenas material de referência ainda não utilizado

---

## [0.7.5] — 2026-06-30

### Corrigido
- **6 fontes citadas de forma inconsistente entre skills diferentes** — mesma obra referenciada com completude ou redação divergente:
  - GONSALES; SEBRIAM; AVELAR (2025): subtítulo e nome do publicador padronizados em `ia-educacao-ecossistema-inovacao` e `ia-educacao-formacao-inicial-docente`
  - U.S. DEPARTMENT OF EDUCATION (2023): subtítulo ausente em `ia-educacao-personalizacao`
  - CAST. Universal Design for Learning Guidelines (2018): versão, local, editora e URL ausentes em `ia-educacao-acessibilidade-inclusao`
  - BUOLAMWINI; GEBRU (2018): "In: FAT* Conference" padronizado para "In: Proceedings of FAT* Conference" em `ia-educacao-etica`
  - BLACK; WILIAM (1998): nome completo do periódico restaurado em `ia-educacao-feedback`
  - Lei nº 13.709/LGPD: nome oficial completo da lei restaurado em `ia-educacao-contratacao`
- `version` incrementada nas 7 skills afetadas

---

## [0.7.4] — 2026-06-30

### Corrigido
- **Mês de publicação ausente na referência do Referencial MEC (2026)**: confirmado o título e a autoria institucional oficiais consultando `raw-pdfs/REFERENCIAL PARA DESENVOLVIMENTO E USO RESPONSÁVEIS DE INTELIGÊNCIA ARTIFICIAL NA EDUCAÇÃO-pt.pdf` (capa e página de créditos: "© Ministério da Educação", Brasília (DF), fevereiro 2026). As 62 referências ao documento foram atualizadas de `Brasília: MEC, 2026.` para `Brasília: MEC, fev. 2026.`; version incrementada em todos os arquivos afetados

---

## [0.7.3] — 2026-06-30

### Corrigido
- **Referência do Referencial MEC (2026) inconsistente em 62 skills**: metade do acervo citava `BRASIL. MEC. ... IA na Educação` e a outra metade `BRASIL. Ministério da Educação. ... Inteligência Artificial na Educação` — mesmo documento, autor institucional e título divergentes. Padronizado para a forma por extenso (`BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, 2026.`) em 30 skills que usavam a forma abreviada
- **9 referências online sem "Acesso em"** (exigência da ABNT NBR 6023 para fontes eletrônicas): adicionado "Acesso em: 30 jun. 2026." em `ia-educacao-acessibilidade-inclusao`, `ia-educacao-dua`, `ia-educacao-fundamentos`, `ia-educacao-ia-desplugada`, `ia-educacao-letramento-dados` (2x), `ia-educacao-rascunho`, `ia-educacao-verificacao`, `ia-educacao-visualizacao-dados`; a referência da WILKE (2019) em `ia-educacao-visualizacao-dados` também teve a notação `[Disponível em: ...]` normalizada para o padrão ABNT (`Disponível em: https://...`)
- **34 skills** com `version` incrementada no frontmatter em decorrência das correções acima, conforme convenção do repositório

---

## [0.7.2] — 2026-06-30

### Corrigido
- **Dependência duplicada**: `ia-educacao-formacao-inicial-docente` listava `ia-educacao-planejamento-didatico` duas vezes na seção `Dependências`, com justificativas redundantes; mesclada em uma única entrada
- **README.md desatualizado**: 8 skills adicionadas no lote 0.6.0 (`ia-educacao-autoavaliacao`, `avaliacao-competencia`, `avaliacao-diagnostica`, `avaliacao-oral`, `avaliacao-projeto`, `banco-questoes`, `mcq`, `portfolio`) nunca haviam sido incluídas na tabela "Ferramentas e práticas"
- **Contagem fixa de "54 skills"** em `README.md` e `AGENTS.md` (a contagem real é 62): substituída por orientação a `ls skills | wc -l`, na mesma linha do que já havia sido corrigido em `CLAUDE.md` na versão anterior

---

## [0.7.1] — 2026-06-30

### Corrigido
- **Comandos de auditoria de grafo (CLAUDE.md, AGENTS.md)**: o comando de "Dependências quebradas" usava `grep -A 20` após o cabeçalho `## Dependências`, o que extraía conteúdo entre crases de seções subsequentes (ex: `## Referências`) e gerava centenas de falsos positivos. Substituído por extração delimitada com `awk` entre `## Dependências` e o próximo `## `, aplicada também ao comando de hubs e ao de órfãs
- **3 skills órfãs** (`ia-educacao-avaliacao-competencia`, `ia-educacao-avaliacao-diagnostica`, `ia-educacao-avaliacao-projeto`) sem nenhuma referência inbound: adicionadas referências recíprocas em `ia-educacao-pbl`, `ia-educacao-tbl`, `ia-educacao-sala-invertida`, `ia-educacao-planejamento-reverso`, `ia-educacao-rubrica` e `ia-educacao-design-problema`, com base nas dependências que essas três skills já declaravam

### Modificado
- **CLAUDE.md**: contagem fixa de "54 skills" substituída por orientação a `ls skills | wc -l` (a contagem real é 62); tabela de categorias atualizada com as skills de `ferramentas-praticas` que faltavam; adicionada menção a `agents/*.md` e às convenções de `CHANGELOG.md`/`CONTRIBUTING.md`

---

## [0.7.0] — 2026-06-29

### Modificado
- **Desinstitucionalização completa do acervo**: removidas todas as referências à UNIFEI (Resolução CEPEAd nº 17, INs PRG, Norma Disciplinar, Guia AIAS-UNIFEI, PPC BIA, cenários com UNIFEI) de todas as 54 skills e documentos de suporte
- **`aias-consultant`**: redesenho completo — renomeada de "Consultora AIAS-UNIFEI" para "Consultora da Escala AIAS"; descrição, princípios, workflow e referências desinstitucionalizados; versão 2.0 → 3.0
- **15 skills com UNIFEI no corpo do texto**: cenários, princípios e workflow editados para linguagem institucional-agnóstica (ex: "UNIFEI" → "universidade", "IN PRG nº 02/2025" → "diretrizes institucionais de TCC", "BIA" → "Computação")
- **33 skills com UNIFEI apenas nas referências**: entradas bibliográficas UNIFEI removidas; versões incrementadas
- **CLAUDE.md**: descrição do repositório desinstitucionalizada; seção "Referências normativas centrais" removida; descrição da AIAS como escala genérica (não adaptada UNIFEI)
- **README.md**: título, descrição, escala AIAS e referências normativas desinstitucionalizados
- **CONTRIBUTING.md**: "acervo institucional da UNIFEI" → "acervo de skills"

---

## [0.6.0] — 2026-06-29

### Adicionado
- **8 novas skills de avaliação para STHEM**:
  - `ia-educacao-mcq`: design, validação e análise de questões de múltipla escolha com distratores por área, alinhamento Bloom e análise psicométrica
  - `ia-educacao-avaliacao-oral`: rubricas, protocolos e simulação de banca com IA para apresentações, arguições, defesas e exames orais
  - `ia-educacao-portfolio`: design de portfólios avaliativos (disciplina, desenvolvimento, reflexivo, projeto, estágio, e-portfólio)
  - `ia-educacao-avaliacao-diagnostica`: mapeamento de pré-requisitos, identificação de misconceptions e testes de nivelamento
  - `ia-educacao-avaliacao-competencia`: rubricas de proficiência, tarefas de desempenho autênticas e alinhamento a DCNs/SINAES
  - `ia-educacao-avaliacao-projeto`: avaliação de projetos interdisciplinares, PBL/PjBL, IC e extensão com marcos e peer assessment
  - `ia-educacao-autoavaliacao`: instrumentos de autoavaliação, calibração com avaliação docente e desenvolvimento do juízo avaliativo
  - `ia-educacao-banco-questoes`: blueprint de prova, taxonomia de itens, curadoria de banco e análise psicométrica pós-prova
- Todas as 8 skills incluem seção `Perfis STHEM` com adaptações por área (Science, Technology, Humanities, Engineering, Mathematics)

### Modificado
- **Camada de verificação e validação adicionada às 8 skills v0.6.0**: cada skill ganhou uma seção `Verificar e validar` como etapa final do workflow, com tabela de dimensões de verificação, checklist pré-aplicação e novos itens no `Formato de Saída` (checklist e relatório de validação)
- **Dependência `ia-educacao-verificacao` adicionada** a 7 skills que não a possuíam (avaliacao-oral, portfolio, avaliacao-diagnostica, avaliacao-competencia, avaliacao-projeto, autoavaliacao, banco-questoes)
- **Versões incrementadas** de 1.0 para 1.1 nas 8 skills
- `AGENTS.md`: criado para OpenCode com diferenças vs. Claude Code, comandos de auditoria e workflow típico
- `.opencode/agents/`: 3 subagentes (planejador-pedagogico, construtor-de-avaliacoes, artesao-de-skills) com perfis STHEM
- `opencode.json`: configuração local registrando os 3 agentes

## [0.5.0] — 2026-06-29

### Modificado
- **Categorias padronizadas em 23 skills**: eliminadas as categorias não canônicas `etica-transversal`, `gestao-governanca` e `pratica-pedagogica`; todas as skills agora seguem exatamente as 5 categorias definidas no `CLAUDE.md`
- **Qualidade de 23 skills v1.0**:
  - `ia-educacao-avaliacao-grupo`: integração da Escala AIAS ao workflow de peer assessment (nova seção 7 com tabela AIAS×dimensões); dependência `aias-consultant` adicionada
  - `ia-educacao-bloom`: data de acesso adicionada à referência CHURCHES (2008)
  - `ia-educacao-interdisciplinaridade`: referência BOIX MANSILLA & GARDNER (2003) corrigida para formato ABNT de artigo em periódico
  - 20 skills: cenário de Ensino Médio ou EPT adicionado à seção `Exemplos`, com nível AIAS declarado e contexto brasileiro explícito (ENEM, BNCC, instituições federais/estaduais)
- **Grafo de dependências**: 7 skills sem nenhuma referência inbound conectadas ao ecossistema (`simulacao` ← `tbl`; `visualizacao-dados` ← `letramento-dados`; `estudo-de-caso` ← `facilitacao`; `aprendizagem-ativa` ← `planejamento-didatico`; `interdisciplinaridade` ← `pbl`; `aprendizagem-servico` ← `superior`; `permanencia` ← `gestao`)
- `CLAUDE.md`: propriedade cumulativa da escala AIAS documentada; nota sobre `aias-consultant` (categoria `ferramentas-praticas`, nomenclatura distinta); seção "Verificação de integridade" com comandos de auditoria do grafo

---

## [0.3.1] — 2026-06-29

### Adicionado
- `ia-educacao-rascunho`: raciocínio conciso (Chain of Draft) — geração de rascunhos intermediários mínimos para atividades, prompts de IA e feedback formativo; técnica para evitar over-elaboration
- `ia-educacao-verificacao`: Chain of Verification (CoVe) para docentes validarem materiais, questões de prova, planos de aula e feedbacks gerados com IA antes do uso em sala; protocolo Factored CoVe com tabela de confiabilidade
- `ia-educacao-bloom`: Taxonomia Revisada de Bloom (Anderson & Krathwohl, 2001) + Digital Bloom (Churches, 2008): matriz bidimensional (processo cognitivo × tipo de conhecimento), verbos digitais por nível e alinhamento com AIAS
- `ia-educacao-dua`: Desenho Universal para a Aprendizagem — três princípios (representação, ação/expressão, engajamento) por nível de ensino e por perfil de aprendiz, integrado aos níveis AIAS

### Modificado
- `ia-educacao-rascunho`: renomeada de `ia-educacao-chain-of-draft` para seguir a convenção de nomenclatura em Português do Brasil

---

## [0.4.0] — 2026-06-29

### Adicionado
- `ia-educacao-planejamento-reverso`: Backward Design / Understanding by Design (UbD) — três estágios (resultados → evidências → experiências), integração AIAS no Estágio 2, alinhamento com WHERETO
- `ia-educacao-rubrica`: design de rubricas analíticas, holísticas e single-point alinhadas a Bloom, AIAS e DUA; tabela de descritores por nível AIAS para o critério de uso de IA
- `ia-educacao-feedback`: feedback formativo com IA em escala (Feed Up/Back/Forward); feedback por pares (SPARK/WebPA) e autoavaliação
- `ia-educacao-metacognicao`: aprendizagem autorregulada, diários, wrappers, portfólios reflexivos e uso intencional de IA; tabela AIAS × pergunta metacognitiva
- **11 skills de metodologias ativas para Ensino Superior** (`formacao-docente`): `pbl`, `sala-invertida`, `simulacao`, `estudo-de-caso`, `peer-instruction`, `tbl`, `aprendizagem-servico`, `debate`, `facilitacao`, `design-problema`, `avaliacao-grupo`
- **4 skills para lacunas STHEM** (`ferramentas-praticas`): `pesquisa`, `escrita`, `visualizacao-dados`, `interdisciplinaridade`

### Modificado
- `CLAUDE.md`: seção `Dependências` passa a proibir referências a skills fora deste repositório (ex: `bloom-taxonomy-educator`, `backward-design-stem`)

---

## [0.3.0] — 2026-06-27

### Adicionado
- `README.md` com visão geral, tabela da Escala AIAS-UNIFEI e listagem completa das 31 skills
- `CONTRIBUTING.md` com template de skill e checklist de PR
- `CHANGELOG.md` (este arquivo)
- `.gitignore` excluindo `raw-pdfs/`

### Modificado
- **26 skills atualizadas** com contexto da Escala AIAS-UNIFEI (Perkins et al. 2024/2025):
  conteúdo adicionado nas seções "Quando usar" e/ou "Workflow" com conexão ao nível
  AIAS pertinente; referências Perkins 2024, Perkins 2025 e Guia AIAS-UNIFEI inseridas
  em cada skill atualizada
- `CLAUDE.md`: referências a `guia-aias-unifei.md` e `rubrica-tcc-bia.md` removidas;
  contagem de skills corrigida para 31; nota sobre distribuição do conteúdo

### Removido
- `guia-aias-unifei.md` — conteúdo distribuído para as skills relevantes
- `rubrica-tcc-bia.md` e `rubrica-tcc-bia.xlsx` — conteúdo distribuído para as skills relevantes

---

## [0.2.0] — 2026-06-27

### Adicionado
- Skill `aias-consultant`: consultora especialista na Escala AIAS-UNIFEI para orientar
  docentes no diagnóstico de nível, redesenho de atividades, geração de enunciados e rubricas

### Modificado
- `CLAUDE.md`: corrigido caminho `SKILLS/` → `skills/`; adicionada seção "Uso das skills
  no Claude Code" com comandos `npx skills add`; adicionada tabela AIAS com 5 níveis

---

## [0.1.0] — 2026-06-27

### Adicionado
- Commit inicial do acervo: 30 skills temáticas (`ia-educacao-*`), `guia-aias-unifei.md`,
  `rubrica-tcc-bia.md`, `rubrica-tcc-bia.xlsx`, `CLAUDE.md`
- Repositório privado criado em `github.com/walternagai/skills-ia-educacao`
