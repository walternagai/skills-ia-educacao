---
name: ia-educacao-design-problema
category: ferramentas-praticas
model: claude
version: 1.0
description: >
  Especialista em design de problemas, questões-motrizes e situações-gatilho para metodologias ativas no Ensino Superior. Transforma conteúdo disciplinar em problemas autênticos e mal-estruturados que provocam investigação, análise e tomada de decisão. Complementa planejamento-reverso com foco na criação do artefato central (o problema) que ainda está ausente. Acione para: "como criar um problema para minha aula", "problema para PBL", "questão motriz", "situação-gatilho", "problema mal-estruturado", "caso para estudo", "problema autêntico", "como transformar conteúdo em problema", "problema para metodologia ativa", "enunciado que gera discussão".
---

# Design de Problemas para Metodologias Ativas

## Princípios
- Um problema bem construído é o design mais difícil e mais impactante da pedagogia ativa — professores dominam o conteúdo, mas transformar conteúdo em problema que provoca investigação genuína é uma habilidade distinta que precisa ser aprendida
- "Problema" aqui não é exercício com solução conhecida — é uma situação que exige que o estudante use conhecimento para tomar decisão, propor solução ou formular explicação em contexto com incerteza real
- IA acelera drasticamente o rascunho de problemas; o que levava 2–4 horas pode ser esboçado em 15–20 min — mas a calibração de dificuldade, a validação de autenticidade e o teste com estudantes reais continuam sendo trabalho do docente
- A qualidade do problema é o principal preditor da qualidade da aprendizagem em metodologias ativas; um problema fraco torna o melhor facilitador impotente
- Diferentes metodologias exigem diferentes arquiteturas de problema: PBL usa problema mal-estruturado de caso; PjBL usa questão-motriz; sala invertida usa questão-âncora; debate usa questão contestável; estudo de caso usa situação-gatilho decisória

## Quando usar
- Criação de problemas para qualquer metodologia ativa (PBL, PjBL, estudo de caso, sala invertida, debate, Peer Instruction)
- Transformação de conteúdo disciplinar "árido" em problemas autênticos que criam senso de propósito
- Avaliação e melhoria de problemas existentes que não estão gerando engajamento ou pensamento de ordem superior
- Geração de variações de um mesmo problema para diferentes grupos, turmas ou graus de dificuldade
- Construção de banco de problemas para uma disciplina ou módulo

## Workflow

### 1. Escolher a arquitetura de problema pela metodologia

| Metodologia | Arquitetura | Características centrais |
|-------------|-------------|--------------------------|
| **PBL** | Problema mal-estruturado | Sem solução única; informação incompleta; múltiplos stakeholders; termina sem resolver |
| **PjBL** | Questão-motriz | Abre para produto concreto; responde "para quem" e "com qual impacto" |
| **Estudo de caso** | Situação-gatilho decisória | Ponto de corte na decisão; decisor identificado; dados misturados (relevantes e irrelevantes) |
| **Peer Instruction** | ConcepTest | Uma resposta correta; revela um misconception específico; não exige cálculo |
| **Debate** | Questão contestável | Binária ou polarizável; especialistas legítimos discordam; evidência existe para ambos os lados |
| **Sala invertida** | Questão-âncora | Sem resposta direta no pré-aula; cria tensão que só será resolvida no presencial |

### 2. Processo de design em 5 etapas

**Etapa 1 — Partir do objetivo de aprendizagem (Bloom 4–6)**
O problema precisa exigir o nível cognitivo que o objetivo declara. Verificar:
- Objetivo é "analisar" → o problema exige decompor algo em partes e identificar relações
- Objetivo é "avaliar" → o problema exige emitir julgamento fundamentado com critérios
- Objetivo é "criar" → o problema exige produzir algo novo a partir dos elementos disponíveis

Se o objetivo é Bloom 1–3, o problema é um exercício — não uma situação-problema.

**Etapa 2 — Identificar o contexto autêntico**
Um problema autêntico responde às perguntas:
- *Onde* este problema ocorreria no mundo profissional ou da vida real?
- *Quem* precisa resolvê-lo e com qual urgência?
- *Quais* são as restrições reais (tempo, orçamento, ética, regulação)?
- *O que* está em jogo se a decisão for errada?

Fontes de contexto autêntico:
- Notícia recente da área
- Caso publicado (HBR, JAMA, IEEE Spectrum, Nexo, Piauí)
- Situação da própria instituição ou da comunidade local
- Problema proposto pelo parceiro em projeto de extensão
- Cenário criado por IA a partir de parâmetros reais

**Etapa 3 — Construir a tensão central**
O problema precisa de tensão — sem ela, há solução óbvia. Fontes de tensão:
- **Conflito entre valores**: eficiência vs. equidade; inovação vs. segurança; individual vs. coletivo
- **Informação incompleta**: dados ausentes que seriam necessários para certeza
- **Stakeholders com interesses opostos**: a solução boa para um é ruim para outro
- **Restrições conflitantes**: o que tecnicamente é melhor não é o que é eticamente aceitável
- **Consequências não-lineares**: a decisão correta de curto prazo pode ser errada no longo prazo

**Etapa 4 — Escrever o enunciado com a estrutura adequada**

Estrutura para problema mal-estruturado (PBL):
```
[Contexto: 2–3 linhas situando o cenário e o decisor]
[Evento-gatilho: o que aconteceu que cria a urgência]
[Dados disponíveis: mistura de relevantes e irrelevantes]
[Perspectivas em conflito: pelo menos 2 stakeholders com visões opostas]
[Demanda: "O que você faria?" / "Qual é a sua recomendação?" / "Como você explicaria?"]
```

Estrutura para questão-motriz (PjBL):
```
"Como poderíamos [verbo de ação] para [audiência específica] que [necessidade real], considerando [restrição relevante]?"
```
Exemplos:
- "Como poderíamos desenvolver um sistema de alerta precoce de evasão para os estudantes da UNIFEI que considere variáveis socioeconômicas e de desempenho, sem violar a LGPD?"
- "Como poderíamos criar um material educativo sobre saúde mental para adolescentes da rede pública que seja acessível sem internet?"

**Etapa 5 — Validar antes de usar**

Checklist de qualidade (aplicar para qualquer arquitetura):
- [ ] O objetivo de aprendizagem está em Bloom 4–6?
- [ ] O contexto é reconhecível como autêntico por quem conhece a área?
- [ ] Há pelo menos uma fonte de tensão genuína (conflito de valores, informação incompleta, stakeholders opostos)?
- [ ] Não há resposta óbvia embutida no enunciado?
- [ ] O problema é respondível com os recursos disponíveis para os estudantes (tempo, acesso a fontes)?
- [ ] Um especialista da área reconheceria este como um problema real (mesmo que adaptado)?

### 3. Criar problemas com IA

IA é mais útil no rascunho — não no design final.

**Prompt para PBL:**
```
Crie um problema mal-estruturado para PBL em [disciplina], nível [graduação].
Objetivo de aprendizagem: [descrever — Bloom 4+].
Contexto: [área / setor / localização geográfica].
Restrições: [técnicas / éticas / orçamentárias / temporais].
Stakeholders: inclua pelo menos [N] perspectivas conflitantes.
O problema NÃO deve ter resposta óbvia nem revelar a solução no próprio enunciado.
Extensão: [1–2 parágrafos].
```

**Prompt para questão-motriz PjBL:**
```
Gere 5 questões-motrizes para projeto de [área/disciplina] que:
- Usem o formato "Como poderíamos [verbo] para [audiência] que [necessidade]?"
- Gerem um produto concreto entregável em [X semanas]
- Sejam relevantes para o contexto [local/regional/setorial específico]
- Permitam nível AIAS [X] de uso de IA no desenvolvimento
```

**Prompt para ConcepTest:**
```
Crie um ConcepTest para o conceito [conceito específico] em [disciplina].
O objetivo é revelar o misconception: [descrição do erro conceitual].
4 alternativas: 1 correta + 3 distratores plausíveis que representem erros reais.
A questão não deve exigir cálculo — deve ser respondível por raciocínio conceitual em <90 segundos.
```

**Após o rascunho da IA:**
1. Verificar autenticidade: o contexto é plausível?
2. Verificar tensão: há realmente ambiguidade ou o problema tem resposta óbvia?
3. Verificar nível cognitivo: o problema exige Bloom 4–6 ou apenas recall?
4. Aplicar `ia-educacao-verificacao` para checagem factual se o problema usa dados reais

### 4. Gerar variações de um mesmo problema

Variações permitem turmas simultâneas sem a mesma resposta circulando, e diferentes graus de complexidade:

| Tipo de variação | Como gerar | Propósito |
|-----------------|-----------|----------|
| **Por stakeholder**: mesma situação, perspectiva diferente | Trocar o decisor (de gestor para engenheiro) | Idem conteúdo, ângulo diferente |
| **Por restrição**: adicionar ou remover uma restrição | "Agora o orçamento é 30% menor" | Aumentar dificuldade |
| **Por contexto**: mesmo problema, setor diferente | Da saúde para a educação | Testar transferência |
| **Por dado**: trocar dados disponíveis | Adicionar dado irrelevante ou retirar dado relevante | Treinar separação de sinal e ruído |
| **Por urgência**: adicionar pressão de tempo | "Decisão em 2 horas" | Testar priorização sob pressão |

IA gera variações rapidamente a partir do problema-base — docente valida cada variação no checklist.

### 5. Construir banco de problemas

Para disciplinas em metodologias ativas que se repetem a cada semestre:
- Organizar problemas por: metodologia, objetivo de Bloom, tema, nível de dificuldade, AIAS
- Atualizar anualmente: um bom problema de 2022 pode ter resposta conhecida em 2026
- Registrar a performance de cada problema (gerou discussão rica? precisou de reformulação?)
- IA analisa o banco e sugere lacunas: "Os problemas existentes cobrem análise (Bloom 4) mas raramente avaliação (Bloom 5) — você gostaria que eu gerasse 3 problemas de avaliação para [tema]?"

## Formato de Saída
- **Problema mal-estruturado completo** (PBL) com contexto, dados, stakeholders e demanda
- **Questão-motriz** (PjBL) com formato "Como poderíamos..." + restrições e audiência
- **ConcepTest** com 4 alternativas, identificação do misconception de cada distrator e gabarito comentado
- **Questão contestável** para debate com posições-tipo e principais argumentos de cada lado
- **Banco de 5–10 variações** de um mesmo problema-base para uso em diferentes grupos ou semestres
- **Análise de problema existente**: aplicação do checklist de qualidade com diagnóstico e sugestão de melhoria

## Exemplos

**Cenário 1 — Engenharia Elétrica (Ensino Superior)**
Objetivo: avaliar trade-offs em projetos de sistemas de energia.
Problema gerado: distribuidora de energia recebe relatório de consultoria indicando que modernizar a rede elétrica de um município rural com microgeração solar custará 3x mais que manter o sistema atual, mas reduzirá interrupções em 70%. Conselho municipal tem dados conflitantes e grupos de interesse opostos. A engenheira responsável precisa apresentar uma recomendação em 48 horas.
Checklist: ✅ Bloom 5 (avaliação), ✅ contexto autêntico, ✅ stakeholders opostos, ✅ sem resposta óbvia.

**Cenário 2 — Bacharelado em IA (UNIFEI, AIAS 4)**
Questão-motriz: "Como poderíamos desenvolver um sistema de recomendação de vagas de estágio para estudantes da UNIFEI que priorize equidade de acesso para estudantes de baixa renda, sem reforçar os vieses presentes nos dados históricos de contratação?"
Produto: protótipo funcional em Python + relatório de vieses identificados + proposta de mitigação.

**Cenário 3 — Medicina (6.º período)**
Problema PBL: paciente de 42 anos, professora, chega à UBS com fadiga crônica, perda de peso de 6 kg em 3 meses e sudorese noturna. Nega tabagismo. Filho de 8 anos com diagnóstico recente de tuberculose pulmonar. Exames iniciais: hemograma normal, glicemia 102 mg/dL, RX de tórax "sem alterações significativas" (laudo do médico radiologista). Paciente muito ansiosa — pergunta se pode continuar trabalhando.
Variação A: acrescentar PPD reator 15 mm. Variação B: acrescentar que a paciente mora em abrigo coletivo.

## Limitações
- IA gera rascunhos plausíveis, não problemas validados — sem aplicação com estudantes reais e revisão baseada em como o problema funciona na prática, o banco fica teórico
- Problemas muito longos ou com muitos dados perdem o foco — a extensão ideal é a mínima que cria tensão genuína
- Problemas de área técnica muito específica (ex: cálculo de reservatório petrolífero) requerem revisão por especialista antes de uso — IA pode inserir dados incorretos que parecem plausíveis
- Calibração de dificuldade só é possível empiricamente — um problema que parece "intermediário" pode ser trivial para turmas avançadas e impossível para turmas iniciantes

## Dependências
- `ia-educacao-pbl` — os problemas PBL criados com esta skill são o insumo central da metodologia PBL
- `ia-educacao-planejamento-reverso` — o design do problema parte dos objetivos de aprendizagem (Estágio 1 do UbD) e compõe as evidências (Estágio 2)
- `ia-educacao-bloom` — verificação do nível cognitivo exigido pelo problema e pelos descritores das rubricas associadas
- `ia-educacao-peer-instruction` — ConcepTests são um tipo específico de problema; a skill de Peer Instruction os contextualiza no ciclo pedagógico
- `ia-educacao-verificacao` — validação factual de problemas baseados em dados ou casos reais

## Referências
- JONASSEN, D. H. Instructional Design Models for Well-Structured and Ill-Structured Problem-Solving Learning Outcomes. Educational Technology Research and Development, v. 45, n. 1, p. 65–94, 1997.
- HMELO-SILVER, C. E. Problem-Based Learning: What and How Do Students Learn? Educational Psychology Review, v. 16, n. 3, p. 235–266, 2004.
- BUCK INSTITUTE FOR EDUCATION. PBL Works: Project Based Learning for the 21st Century. Novato: BIE, 2019.
- WIGGINS, G.; McTIGHE, J. Understanding by Design. 2. ed. Alexandria, VA: ASCD, 2005.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, 2026.
- UNIFEI. Resolução CEPEAd nº 17, de 29 de dezembro de 2025 — Norma de Graduação. Itajubá: UNIFEI, 2025.
