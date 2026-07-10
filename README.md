# Skills IA & Educação

Acervo de skills que orientam a integração responsável de Inteligência Artificial na Educação, alinhado ao **Referencial MEC para IA na Educação (2026)**.

## O que há neste repositório

- **Skills temáticas** (`skills/*/SKILL.md`) — prontas para instalar em CLIs de IA (contagem atual: `ls skills | wc -l`)
- **PDFs normativos** (`raw-pdfs/`) — Referencial MEC, artigos AIAS originais
- **CLAUDE.md** — instruções de contexto para instâncias do Claude Code neste repositório

## A Escala AIAS

A escala **AIAS (AI Assessment Scale)**, baseada no trabalho de Perkins, Furze, Roe e MacVaugh (2024, 2025), classifica o nível de uso de IA em avaliações acadêmicas:

| Nível | Nome | IA permitida | Produto final |
|-------|------|-------------|---------------|
| 1 | Sem IA | Nenhuma | Totalmente do estudante |
| 2 | Planejamento Assistido por IA | Ideação e estruturação | Do estudante; IA apenas no processo |
| 3 | Colaboração com IA | Elaboração e refinamento | Do estudante com auxílio de IA |
| 4 | IA Integral | Uso estratégico e abrangente | Dirigido pelo estudante com IA |
| 5 | Exploração de IA | Co-criação e inovação | Co-autoria estudante + IA |

A escala é **não hierárquica** (nenhum nível é superior a outro) e **cumulativa** (níveis superiores permitem usos dos inferiores, salvo indicação contrária). O nível deve ser declarado explicitamente no plano de ensino e no enunciado de cada atividade avaliativa.

## Como usar as skills

### Instalar uma skill

```bash
# A partir do diretório raiz deste repositório
npx skills add ./skills/aias-consultant
npx skills add ./skills/ia-educacao-avaliacao
# ou todas de uma vez
for d in skills/*/; do npx skills add "./$d"; done
```

### Invocar em CLIs de IA

Após instalada, chame a skill pelo nome:

```
/aias-consultant
/ia-educacao-avaliacao
/ia-educacao-etica
```

## Skills disponíveis

### Escala AIAS

| Skill | Descrição |
|-------|-----------|
| `/aias-consultant` | Consultora especialista na Escala AIAS: diagnóstico de nível, redesenho de atividades, enunciados com declaração AIAS, rubricas alinhadas |

### Níveis de ensino

| Skill | Descrição |
|-------|-----------|
| `/ia-educacao-infantil` | Diretrizes para uso (restrito) de IA na Educação Infantil |
| `/ia-educacao-basica` | Integração gradual de IA no Ensino Fundamental |
| `/ia-educacao-ensino-medio` | IA no Ensino Médio: letramento, projetos e AIAS |
| `/ia-educacao-profissional-tecnologica` | IA na EPT: competências para o mundo do trabalho |
| `/ia-educacao-superior` | IA no Ensino Superior: pesquisa, TCC e inovação |

### Formação docente

| Skill | Descrição |
|-------|-----------|
| `/ia-educacao-fundamentos` | Conceitos de IA para educadores (ML, LLMs, alucinações, vieses) |
| `/ia-educacao-formacao-inicial-docente` | Preparação de futuros professores para integrar IA |
| `/ia-educacao-planejamento-didatico` | Plano de ensino com política AIAS e objetivos alinhados |
| `/ia-educacao-aprendizagem-ativa` | Metodologias ativas com IA (PBL, sala invertida, gamificação) |
| `/ia-educacao-pensamento-critico` | Desenvolver pensamento crítico diante de outputs de IA |
| `/ia-educacao-bloom` | Taxonomia Revisada de Bloom + Digital Bloom (Churches): objetivos, atividades online e alinhamento com AIAS |
| `/ia-educacao-planejamento-reverso` | Backward Design (UbD): resultados → evidências → experiências, com AIAS integrado ao Estágio 2 |
| `/ia-educacao-metacognicao` | Metacognição e aprendizagem autorregulada: diários, wrappers, portfólios reflexivos e uso intencional de IA |
| `/ia-educacao-pbl` | Aprendizagem Baseada em Problemas/Projetos (PBL/PjBL): problema-gatilho, ciclo de tutoria e avaliação individual em grupo |
| `/ia-educacao-sala-invertida` | Sala de Aula Invertida: partição pré/presencial, materiais com IA, Peer Instruction e gestão do não-cumprimento do pré |
| `/ia-educacao-simulacao` | Simulações e role-playing com IA: personas profissionais (clínico, jurídico, engenharia), debriefing estruturado e AIAS 3–5 |
| `/ia-educacao-estudo-de-caso` | Estudo de caso como metodologia: método Harvard, casos mal-estruturados, personas de stakeholders com IA e avaliação do argumento |
| `/ia-educacao-peer-instruction` | Peer Instruction (Mazur): design de ConcepTests, ciclo vote-discuss-revote e análise de distribuição de respostas |
| `/ia-educacao-tbl` | Team-Based Learning: iRAT/gRAT com IF-AT, Application Activities 4S, peer assessment com CATME |
| `/ia-educacao-aprendizagem-servico` | Aprendizagem-Serviço e curricularização da extensão universitária (Res. CNE/CES 7/2018) com IA |
| `/ia-educacao-debate` | Debate estruturado (Oxford, Fishbowl, Socrático): IA como advogado do diabo, falácias argumentativas e avaliação de argumentação |
| `/ia-educacao-facilitacao` | Facilitação de discussões: perguntas socráticas, gestão de silêncio e dominância, IA como voz extra em plenária |
| `/ia-educacao-interdisciplinaridade` | Design de atividades genuinamente interdisciplinares em STHEM: critério de dependência mútua, avaliação de síntese e co-design docente |

### Ética e governança

| Skill | Descrição |
|-------|-----------|
| `/ia-educacao-etica` | Fundamentos éticos para uso de IA na educação |
| `/ia-educacao-governanca-dados` | LGPD, proteção de dados e governança de plataformas |
| `/ia-educacao-supervisao-humana` | Protocolos de supervisão docente por nível AIAS |
| `/ia-educacao-transparencia-explicabilidade` | AIAS como mecanismo de transparência; explicabilidade algorítmica |
| `/ia-educacao-vieses` | Auditoria de vieses em ferramentas de IA educacional |
| `/ia-educacao-impacto-algoritmico` | Avaliação de impacto algorítmico (AIA) de plataformas |
| `/ia-educacao-seguranca-digital` | Privacidade e segurança no uso de IA por estudantes |
| `/ia-educacao-integridade-academica` | Política de integridade acadêmica na era da IA generativa |

### Inclusão e equidade

| Skill | Descrição |
|-------|-----------|
| `/ia-educacao-acessibilidade-inclusao` | IA para acessibilidade; AIAS e tecnologia assistiva |
| `/ia-educacao-dua` | Desenho Universal para a Aprendizagem: três princípios DUA por nível de ensino e por perfil de aprendiz, integrado ao AIAS |
| `/ia-educacao-equidade-digital` | Equidade de acesso como pré-requisito para AIAS 4 e 5 |
| `/ia-educacao-letramento-dados` | Letramento em dados para compreender outputs de IA |
| `/ia-educacao-permanencia` | Sistemas de alerta precoce com IA para prevenção de evasão |

### Ferramentas e práticas

| Skill | Descrição |
|-------|-----------|
| `/ia-educacao-avaliacao` | Redesenho de avaliações com a Escala AIAS |
| `/ia-educacao-rubrica` | Design de rubricas analíticas, holísticas e single-point alinhadas a Bloom, AIAS e DUA |
| `/ia-educacao-feedback` | Feedback formativo em escala com IA: Feed Up/Back/Forward, feedback por pares e autoavaliação |
| `/ia-educacao-avaliacao-grupo` | Avaliação de trabalho em grupo: peer assessment calibrado (CATME/WebPA), detecção de free riders e fator individual |
| `/ia-educacao-avaliacao-competencia` | Avaliação por competências: rubricas de proficiência, tarefas de desempenho autênticas e alinhamento a DCNs/SINAES |
| `/ia-educacao-avaliacao-diagnostica` | Avaliação diagnóstica: mapeamento de pré-requisitos, identificação de misconceptions e testes de nivelamento |
| `/ia-educacao-avaliacao-oral` | Avaliação oral: rubricas, protocolos e simulação de banca com IA para apresentações, arguições, defesas e exames orais |
| `/ia-educacao-avaliacao-projeto` | Avaliação de projetos interdisciplinares, PBL/PjBL, iniciação científica e extensão com marcos e peer assessment |
| `/ia-educacao-autoavaliacao` | Autoavaliação do estudante: acurácia calibrada, instrumentos reflexivos e alinhamento com feedback docente |
| `/ia-educacao-portfolio` | Design de portfólios avaliativos (disciplina, desenvolvimento, reflexivo, projeto, estágio, e-portfólio) |
| `/ia-educacao-mcq` | Design, validação e análise de questões de múltipla escolha com distratores por área e alinhamento Bloom |
| `/ia-educacao-banco-questoes` | Banco de questões e blueprint de provas: tabela de especificações e balanceamento de instrumentos avaliativos |
| `/ia-educacao-design-problema` | Design de problemas para metodologias ativas: problema mal-estruturado, questão-motriz, ConcepTest e questão contestável |
| `/ia-educacao-pesquisa` | Pesquisa acadêmica com IA: revisão sistemática, integridade em TCCs e artigos, declaração de uso AIAS, checklist FINER |
| `/ia-educacao-escrita` | Escrita acadêmica e técnica com IA: ciclo correto (pensar→rascunhar→revisar), voz autoral, gêneros STHEM e integridade |
| `/ia-educacao-visualizacao-dados` | Visualização de dados e storytelling: escolha de gráfico por pergunta, detecção de engano, comunicação de incerteza e dashboard educacional |
| `/ia-educacao-rascunho` | Raciocínio conciso (Chain of Draft) em atividades, prompts de IA e feedback formativo |
| `/ia-educacao-verificacao` | Chain of Verification para docentes validarem materiais, questões e feedbacks gerados com IA |
| `/ia-educacao-personalizacao` | Plataformas adaptativas e STIs no contexto AIAS |
| `/ia-educacao-sti` | Sistemas Tutoriais Inteligentes: integração e uso de dados |
| `/ia-educacao-ia-desplugada` | Ensino de IA sem tecnologia (contextos sem infraestrutura) |
| `/ia-educacao-sandbox` | Ambientes experimentais regulatórios para testar IA educacional |
| `/ia-educacao-gestao` | Implantação institucional da política AIAS (4 fases) |
| `/ia-educacao-ecossistema-inovacao` | Fomento a pesquisa e inovação em IA educacional |
| `/ia-educacao-contratacao` | Critérios éticos e legais para contratar plataformas com IA |

## Estrutura de cada skill

```
skills/<nome>/SKILL.md
```

Cada arquivo segue o padrão:

```yaml
---
name: <slug>
category: <categoria>
model: any
version: <versão>
description: >
  <descrição para acionamento automático>
---

# Título

## Princípios
## Quando usar
## Workflow
## Formato de Saída
## Exemplos
## Limitações
## Dependências
## Referências
```

## Referências

- **Referencial MEC (2026)** — Referencial para Desenvolvimento e Uso Responsáveis de IA na Educação
- **PERKINS et al. (2024)** — The Artificial Intelligence Assessment Scale (AIAS). *Journal of University Teaching and Learning Practice*, v. 21, n. 6.
- **PERKINS et al. (2025)** — Reimagining the AIAS. *Journal of University Teaching and Learning Practice*, v. 22, n. 7.
