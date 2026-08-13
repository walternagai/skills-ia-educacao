---
name: ia-educacao-planejamento-reverso
category: formacao-docente
model: any
version: 1.7
description: >
  Especialista no framework Planejamento Reverso (Backward Design / UbD — Wiggins & McTighe) aplicado ao design de disciplinas e cursos com IA. Guia docentes pelos três estágios: resultados desejados, evidências de aprendizagem com nível AIAS definido e plano de experiências alinhado a WHERETO. Acione para: "design de disciplina", "planejar um curso do zero", "planejamento reverso", "backward design", "UbD", "alinhamento construtivo", "compreensões duradouras", "questões essenciais", "tarefas de desempenho", "reformular ementa".
---

# Planejamento Reverso (Backward Design / UbD)

## Princípios
- O design começa pelo fim: definir o que o estudante deve *compreender e ser capaz de fazer* antes de decidir o que ensinar e como ensinar
- A lógica convencional — "tenho o conteúdo, agora faço a prova" — produz desalinhamento; o Planejamento Reverso inverte a ordem: resultados → evidências → experiências
- "Cobertura de conteúdo" não é aprendizado: o critério de seleção do conteúdo é sua contribuição para as compreensões duradouras, não sua presença na ementa tradicional
- IA generativa precisa ser considerada no Estágio 2 (evidências): a validade de uma tarefa de desempenho depende de o que ela avalia ainda ser relevante quando o estudante pode usar IA
- Alinhamento construtivo (Biggs) e Planejamento Reverso convergem: objetivos → avaliação → atividades formam uma tríade coerente, e qualquer inconsistência entre os três é uma falha de design

## Quando usar
- Design de disciplina nova ou reformulação completa de ementa existente
- Quando avaliações e atividades existentes não parecem alinhadas com o que o docente quer que os estudantes aprendam
- Definição de tarefas de desempenho autênticas que integrem IA de forma coerente (AIAS 3–5)
- Elaboração de questões essenciais para orientar uma unidade temática ou disciplina
- Criação de sequência didática: do conteúdo fundamental às atividades de maior complexidade
- Revisão de plano de ensino para identificar lacunas entre objetivos declarados e avaliações praticadas
- Formação docente: ensinar o método UbD como ferramenta de planejamento

## Workflow

### Estágio 1 — Resultados Desejados

**Pergunta central:** *O que o estudante precisa compreender, saber e ser capaz de fazer ao final desta disciplina/unidade?*

1. **Identificar Compreensões Duradouras** (2–5 por disciplina)
   São as grandes ideias que têm valor além da disciplina, transferíveis para novos contextos — o oposto de fatos memorizáveis que serão esquecidos.

   Formato: *"Os estudantes vão compreender que [afirmação de princípio transferível]."*

   Exemplos por área:
   - Computação: "Algoritmos são escolhas de trade-off entre tempo, espaço e legibilidade — não há solução ótima em todas as dimensões."
   - História: "Fontes históricas refletem o ponto de vista de quem as produziu; ausência de fonte é, ela própria, um dado histórico."
   - Biologia: "Evolução é um mecanismo de mudança populacional, não um progresso intencional em direção à perfeição."
   - IA na Educação: "Ferramentas de IA generativa ampliam capacidades humanas, mas os julgamentos de valor, contexto e ética permanecem com o humano."

2. **Formular Questões Essenciais** (3–7 por disciplina)
   São questões abertas, recorrentes ao longo da disciplina, sem resposta definitiva — convidam ao pensamento, não à memorização.

   Características: provocativas, transferíveis, conectadas às compreensões duradouras, revisitadas em diferentes pontos da disciplina.

   Exemplos:
   - "Quando um modelo é bom o suficiente?"
   - "Quem se beneficia desta tecnologia — e quem arca com seus riscos?"
   - "Como distinguir correlação de causalidade em dados reais?"
   - "O que um texto gerado por IA pode e não pode dizer sobre o pensamento do autor?"

3. **Definir Conhecimentos e Habilidades** (o que o estudante deve *saber* e *ser capaz de fazer*)
   Classificar com a Taxonomia Revisada de Bloom — usar `ia-educacao-bloom` para a matriz bidimensional completa.

   Garantir progressão cognitiva: não concentrar apenas em Lembrar/Compreender; identificar quais objetivos exigem Analisar/Avaliar/Criar.

---

### Estágio 2 — Evidências de Aprendizagem

**Pergunta central:** *Que evidências demonstrariam que o estudante alcançou os resultados do Estágio 1?*

Este estágio é projetado **antes** de planejar qualquer aula. A avaliação define o destino; as atividades são o caminho.

4. **Desenhar Tarefas de Desempenho Autênticas** (2–4 por disciplina)
   São situações realistas que exigem aplicação das compreensões duradouras — vão além de provas de reprodução de conteúdo.

   Formato GRASP para tarefas autênticas:
   - **G**oal (Meta): qual o objetivo da tarefa no mundo real?
   - **R**ole (Papel): qual papel o estudante assume?
   - **A**udience (Audiência): para quem o produto se destina?
   - **S**ituation (Situação): qual o contexto e as restrições?
   - **P**roduct (Produto): o que o estudante entrega?

   **Definir o nível AIAS para cada tarefa de desempenho:**
   Aqui o docente decide explicitamente o papel da IA generativa na demonstração de aprendizagem. A escolha do nível AIAS é parte do design da tarefa, não um detalhe posterior:
   - AIAS 1 — a validade requer demonstração sem IA (ex: prova presencial de raciocínio formal)
   - AIAS 2–3 — IA auxilia o processo; o produto final é do estudante
   - AIAS 4–5 — uso competente de IA é parte do objetivo de aprendizagem; a tarefa avalia como o estudante dirige e valida a IA

   **Checklist de validade da tarefa de desempenho na era da IA:**
   - [ ] A tarefa avalia uma compreensão duradoura ou apenas conteúdo reproduzível?
   - [ ] Se o nível é AIAS 1: a tarefa perde sentido se realizada com IA? (deveria perder)
   - [ ] Se o nível é AIAS 3–5: a tarefa exige que o estudante *diriga* a IA (não apenas execute o output dela)?
   - [ ] A rubrica avalia o processo de raciocínio, não apenas o produto final?

5. **Definir Outras Evidências** (avaliações formativas e de monitoramento)
   - Quizzes, testes de conceito, exercícios rápidos (evidência de Lembrar/Compreender)
   - Atividades de prática supervisionada (evidência de Aplicar)
   - Reflexões e autoavaliações (evidência metacognitiva)
   - Registros de processo: rascunhos, versões intermediárias, diários de aprendizagem

6. **Criar Rubricas Alinhadas**
   Cada critério da rubrica deve espelhar um objetivo do Estágio 1.
   - Usar `ia-educacao-bloom` para garantir que descritores de desempenho reflitam o nível cognitivo esperado
   - Usar `ia-educacao-dua` para garantir que rubricas avaliem competência, não formato de entrega

---

### Estágio 3 — Plano de Experiências de Aprendizagem

**Pergunta central:** *Que sequência de experiências equipa o estudante para alcançar os resultados e produzir as evidências dos Estágios 1 e 2?*

7. **Sequenciar as experiências com o framework WHERETO**

   | Elemento | Propósito | Exemplos de atividades |
   |----------|-----------|------------------------|
   | **W** — Onde vamos? | Tornar os objetivos e a avaliação transparentes desde o início | Apresentar rubricas e questões essenciais na aula 1; mostrar exemplos de trabalhos finais |
   | **H** — Engajar e manter | Conectar o conteúdo a problemas reais e interesses dos estudantes | Caso provocador, dado surpreendente, dilema ético, questão essencial sem resposta fácil |
   | **E** — Equipar | Fornecer conhecimento, habilidade e ferramentas para a tarefa de desempenho | Aulas, leituras, laboratórios, tutoriais, modelos a imitar |
   | **R** — Rever e refletir | Criar oportunidades de feedback e revisão antes da entrega final | Rascunhos comentados, revisão por pares, autoavaliação com rubrica |
   | **E** — Avaliar | Avaliar o próprio aprendizado e o produto | Autoavaliação estruturada, portfólio reflexivo, arguição oral |
   | **T** — Personalizar | Adaptar para diferentes perfis e ritmos de aprendizagem | DUA: múltiplos meios, opções de entrega, scaffolding diferenciado |
   | **O** — Organizar | Sequenciar para maximizar a aprendizagem | Do concreto ao abstrato; do simples ao complexo; do individual ao colaborativo |

8. **Verificar o alinhamento construtivo**
   Após os três estágios, percorrer a tríade de trás para frente:
   - Cada atividade do Estágio 3 serve a uma evidência do Estágio 2?
   - Cada evidência do Estágio 2 demonstra um resultado do Estágio 1?
   - Os verbos das rubricas espelham os verbos dos objetivos de Bloom?
   - O nível AIAS de cada tarefa é coerente com o objetivo de aprendizagem declarado?

## Formato de Saída
- **Documento Estágio 1**: tabela de compreensões duradouras, questões essenciais e objetivos classificados por Bloom
- **Documento Estágio 2**: descrição das tarefas de desempenho (GRASP), nível AIAS de cada tarefa, rubricas alinhadas e plano de evidências formativas
- **Documento Estágio 3**: sequência de atividades com WHERETO, cronograma por semana/módulo e adaptações DUA
- **Mapa de alinhamento construtivo**: tabela objetivo → evidência → atividade → nível AIAS
- **Checklist de revisão**: instrumento para o docente auditar coerência do design antes de publicar o plano de ensino

## Exemplos

**Cenário 1 — Disciplina de Redação Científica (Letras/Humanas, Ensino Superior)**
Compreensão duradoura: "Escrever é um processo iterativo de construção de sentido — o texto final emerge da revisão, não da inspiração."
Questão essencial: "Como saber quando um texto está bom o suficiente?"
Tarefa de desempenho (AIAS 3): escrever um artigo de opinião sobre tema controverso; IA pode auxiliar na revisão de estilo; estudante deve documentar as decisões autorais tomadas sobre sugestões da IA.
Atividade WHERETO-R: oficina de revisão por pares usando rubrica de critérios autorais.

**Cenário 2 — Disciplina de Algoritmos (Computação, Ensino Superior)**
Compreensão duradoura: "A escolha do algoritmo é sempre um trade-off — eficiência, legibilidade e correção raramente coexistem no máximo."
Questão essencial: "Como justificar que esta solução é boa o suficiente para este problema?"
Tarefa de desempenho (AIAS 4): projetar e implementar solução para problema aberto usando IA como par de programação (ex.: Copilot); avaliar criticamente as sugestões geradas e documentar as escolhas de design com justificativa técnica.
Tarefa de desempenho complementar (AIAS 1): prova presencial de análise de complexidade sem ferramentas — valida domínio individual do raciocínio formal.

**Cenário 3 — Disciplina de Biologia (Ensino Médio)**
Compreensão duradoura: "Evolução explica a diversidade da vida sem recorrer a propósito ou direção."
Questão essencial: "Por que é difícil aceitar que não existe 'progresso' na evolução?"
Tarefa de desempenho (AIAS 2): criar infográfico explicando um exemplo de evolução para o público geral; IA pode ajudar na estruturação visual; conteúdo científico deve ser verificado pelo estudante com fontes primárias.
Evidência formativa: debate sobre mitos comuns da evolução (detecta misconceptions antes da tarefa final).

**Cenário 4 — Reformulação de ementa existente (qualquer área)**
Docente tem ementa antiga centrada em tópicos; quer reformular com Planejamento Reverso.
→ Estágio 1: identificar quais tópicos da ementa contribuem para uma compreensão duradoura real — eliminar os que só "estão lá por tradição".
→ Estágio 2: substituir prova final de múltipla escolha por tarefa de desempenho autêntica; definir AIAS coerente.
→ Estágio 3: reorganizar sequência de conteúdo para que atividades práticas apareçam antes das avaliações somativas, não depois.

## Limitações
- Planejamento Reverso exige tempo de design antecipado maior que o planejamento tradicional — não é adequado para ajustes pontuais de uma única aula
- O método pressupõe que o docente tem clareza sobre o que "compreender profundamente" significa na sua disciplina — em contextos com currículo muito prescritivo (BNCC, currículos nacionais padronizados), compreensões duradouras podem entrar em conflito com a lista de conteúdos obrigatórios
- Tarefas de desempenho autênticas são mais trabalhosas de avaliar que provas objetivas; o ganho em validade tem custo em tempo docente
- Definir o nível AIAS no Estágio 2 requer que o docente já tenha clareza sobre a política institucional de uso de IA — usar `aias-consultant` se ainda não estiver definido

## Dependências
- `ia-educacao-bloom` — classificação dos objetivos do Estágio 1 e verificação de progressão cognitiva; descritores de rubrica alinhados ao nível cognitivo
- `ia-educacao-avaliacao` — redesenho completo de instrumentos avaliativos; validação de tarefas de desempenho na era da IA
- `ia-educacao-dua` — integração de DUA no Estágio 3 (elemento **T** do WHERETO: personalização para diferentes perfis)
- `ia-educacao-planejamento-didatico` — integração do design UbD no plano de ensino formal com política AIAS declarada
- `aias-consultant` — definição do nível AIAS das tarefas de desempenho do Estágio 2; redação do enunciado com declaração AIAS
- `ia-educacao-avaliacao-competencia` — quando o Estágio 1 parte do perfil do egresso, os resultados desejados se expressam como competências a certificar

## Referências
- WIGGINS, G.; McTIGHE, J. Understanding by Design. 2. ed. Alexandria, VA: ASCD, 2005.
- WIGGINS, G.; McTIGHE, J. The Understanding by Design Guide to Creating High-Quality Units. Alexandria, VA: ASCD, 2011.
- BIGGS, J.; TANG, C. Teaching for Quality Learning at University. 4. ed. Berkshire: McGraw-Hill, 2011. [Alinhamento construtivo]
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026. — Seções 4.1 (Objetivos de Aprendizagem) e 4.2 (Avaliação)
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024. Disponível em: https://doi.org/10.53761/q3azde36. Acesso em: 30 jun. 2026.
- FINK, L. D. Creating Significant Learning Experiences: An Integrated Approach to Designing College Courses. 2. ed. San Francisco: Jossey-Bass, 2013.
