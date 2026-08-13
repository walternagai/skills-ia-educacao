# Changelog

Todas as mudanças relevantes neste repositório são registradas aqui.
Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/).

---

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
