---
name: ia-educacao-avaliacao-grupo
category: ferramentas-praticas
model: any
version: 1.7
description: >
  Especialista em avaliação de trabalho em grupo no Ensino Superior, com foco em capturar contribuição individual dentro de equipes. Orienta o design de peer assessment calibrado (CATME, WebPA, protocolos simplificados), a detecção de free riders e o uso de IA para identificar padrões de disfunção em equipes. Acione para: "avaliação de grupo", "nota individual em trabalho em grupo", "free rider", "avaliação por pares em grupo", "CATME", "peer assessment", "avaliar contribuição individual", "trabalho em equipe", "avaliação de equipe", "nota de grupo injusta".
---

# Avaliação de Trabalho em Grupo

## Princípios
- Nota coletiva para trabalho em grupo é o instrumento que mais sistematicamente recompensa free riders (membros que se beneficiam do grupo sem contribuir) e pune contribuidores diferenciais — sem avaliação individual dentro do grupo, o instrumento é injusto por design
- Peer assessment calibrado não é "dar nota para o amigo" — é um instrumento com escala estruturada, critérios definidos, autoavaliação para calibração e peso real na nota; sem esses quatro elementos, não é peer assessment, é socialização de notas
- A avaliação de grupo precisa capturar três dimensões distintas: (1) qualidade do produto coletivo, (2) processo de colaboração, (3) contribuição individual — confundir essas dimensões produz instrumentos que não medem o que pretendem
- IA pode analisar dados de peer assessment para identificar padrões (free riders, conflitos latentes, estudante isolado no grupo) antes que se tornem problemas sérios
- Equipes que recebem feedback sobre dinâmica de grupo no ponto médio do semestre têm desempenho significativamente melhor na segunda metade — a avaliação de grupo deve ser formativa, não só somativa

## Quando usar
- Design de sistema de avaliação para qualquer disciplina com trabalho em grupo permanente ou esporádico
- Implementação de CATME ou protocolo simplificado de peer assessment
- Diagnóstico de disfunção em equipe (free rider declarado, conflito, exclusão de membro)
- Análise de dados de peer assessment para ajuste de notas individuais
- Design de rubrica de produto de grupo + instrumento de contribuição individual
- Disciplinas em TBL, PBL, PjBL ou qualquer metodologia com equipes permanentes

## Workflow

### 1. Separar as três dimensões de avaliação

Antes de escolher o instrumento, definir o que será avaliado:

| Dimensão | O que mede | Quem avalia | Peso recomendado |
|----------|-----------|-------------|-----------------|
| **Produto do grupo** | Qualidade do artefato entregue (relatório, código, apresentação) | Docente (+ parceiro, se AS) | 50–60% |
| **Processo de colaboração** | Como a equipe trabalhou ao longo do tempo | Pares (peer assessment) | 20–30% |
| **Contribuição individual** | O quanto cada membro contribuiu vs. o esperado | Pares + autoavaliação | 20–30% |

A **nota individual final** = (nota do produto) × (fator de contribuição individual derivado do peer assessment).

### 2. Escolher o instrumento de peer assessment

**Opção A — CATME (Comprehensive Assessment of Team Member Effectiveness)**

5 dimensões avaliadas por cada membro da equipe sobre cada colega:
1. Contribuição para o trabalho da equipe
2. Interação com os membros da equipe
3. Manutenção do time (resolver conflitos, manter o ambiente positivo)
4. Expectativas do trabalho (cumprir prazos, entregar qualidade)
5. Ensinar e aprender com os outros (compartilhar conhecimento, pedir ajuda)

Cada dimensão tem 5 ancoragens comportamentais (não apenas "bom/ruim" — comportamentos observáveis).
Cada membro avalia todos e a si mesmo — a diferença entre autoavaliação e avaliação dos pares é um dado formativo poderoso.
Ferramenta gratuita: catme.org

**Opção B — Protocolo de distribuição de pontos (simples)**

Cada membro distribui 10 pontos entre os *colegas* (não para si mesmo), proporcional à contribuição percebida.
- Contribuição igual: todos recebem a mesma fração
- Contribuição diferenciada: livre alocação com justificativa escrita obrigatória para distribuição desigual
- Fator individual = média dos pontos recebidos / (10 / n_membros)
- Fator mínimo: 0,5 (piso para não punir em excesso um único avaliador injusto)
- Fator máximo: 1,25 (teto para evitar inflação)

**Opção C — WebPA (método proporcional ponderado)**

Variante do protocolo B com cálculo automático e maior sofisticação estatística. Disponível em: webpaproject.lboro.ac.uk

### 3. Calibrar o peer assessment antes de aplicar

Sem calibração, peer assessment produz inflação de notas (todos se avaliam bem) ou avaliações baseadas em afinidade.

**Protocolo de calibração na primeira semana:**
1. Apresentar casos exemplares de comportamento nas 5 dimensões do CATME (ou nos critérios escolhidos)
2. Pedir que a turma avalie um caso fictício antes de avaliarem os colegas reais
3. Discutir divergências: por que o mesmo comportamento recebeu notas diferentes?
4. Estabelecer âncoras comuns: o que é "contribuição exemplar" nesta turma/projeto?

**Autoavaliação como instrumento de calibração:**
Diferença entre autoavaliação e avaliação dos pares > 1 ponto na escala: sinal de descalibração.
- Autoavaliação sistematicamente acima dos pares → excesso de confiança na contribuição
- Autoavaliação sistematicamente abaixo dos pares → modéstia excessiva ou insegurança

### 4. Usar IA para analisar dados de peer assessment

IA pode processar os dados do CATME ou do protocolo de pontos para identificar padrões:

**Análise de free rider:**
```
Dados de peer assessment da equipe X:
[tabela de pontuações por membro]
Identifique: há algum membro que recebe sistematicamente pontuação baixa em múltiplas dimensões? 
Qual dimensão é mais problemática? 
O que isso sugere sobre a natureza da disfunção nesta equipe?
```

**Análise de consenso vs. dissensão:**
Se um membro recebe notas muito distintas de colegas diferentes (ex: 5 de um e 1 de outro), isso sinaliza conflito interpessoal, não variação de contribuição real.

**Análise de padrão na turma:**
Se todas as equipes inflam os pares acima de 4/5, o instrumento perdeu poder discriminativo — recalibrar na próxima rodada.

### 5. Aplicar peer assessment no ponto médio (formativo)

A rodada de ponto médio é a mais importante. Objetivo: corrigir trajetória, não penalizar.

**Protocolo de ponto médio:**
1. Aplicar peer assessment após 40–50% do projeto
2. Cada membro recebe o feedback dos pares (anônimo ou nominado — decidir por turma)
3. Reunião obrigatória de equipe (15–20 min): "O que aprendemos sobre nossa dinâmica? O que vamos mudar na segunda metade?"
4. Docente verifica equipes com padrão de disfunção (free rider detectado, membro isolado) e intervém com conversa individual
5. Rodada formativa não tem peso de nota — serve para ajuste de comportamento

**Intervenção do docente em disfunção detectada:**
- Free rider confirmado: conversa individual + plano de responsabilização explícito para a segunda metade
- Conflito: mediação com as partes separadamente antes de juntar
- Membro excluído sistematicamente: conversa com a equipe sobre dinâmica, sem nomear o membro excluído; ajuste de papéis

### 6. Comunicar o sistema de avaliação aos estudantes

Transparência é pré-requisito para legitimidade do peer assessment:
- Explicar na semana 1 como a nota individual será calculada a partir da nota do produto e do fator de contribuição
- Mostrar exemplos com números: "Se a nota do produto é 8,0 e o fator individual é 0,85, a nota individual é 6,8"
- Deixar claro que as avaliações são tratadas com confidencialidade — mas que padrões extremos podem levar a conversa com o docente
- **Declarar o nível AIAS da atividade** e como ele afeta os critérios do peer assessment (ver Seção 7)

### 7. Alinhar peer assessment com o nível AIAS

O nível AIAS da atividade de grupo determina quais dimensões do peer assessment precisam de ajuste:

| Nível AIAS | Impacto no peer assessment | Ajuste recomendado |
|---|---|---|
| 1 — Sem IA | Produto inteiramente humano | Dimensões padrão (contribuição, processo, produto); sem critério de IA |
| 2 — Planejamento Assistido por IA | IA usada apenas na fase de planejamento/ideação | Adicionar critério "qualidade da estratégia de uso de IA no planejamento" |
| 3 — Colaboração com IA | IA usada na elaboração e refinamento | Avaliar "integração de IA e manutenção da autoria do estudante" como dimensão explícita |
| 4 — IA Integral | Uso estratégico e extensivo de IA | Critério específico: "competência no uso de IA como ferramenta profissional" com ancoragem comportamental |
| 5 — Exploração de IA | Co-criação e inovação com IA | Avaliar "contribuição para inovação com IA" e "documentação crítica do processo de co-criação" |

**Exemplo de comunicação para atividade AIAS 3**: "Esta atividade é Nível 3 — Colaboração com IA. O peer assessment inclui o critério *integração de IA e autoria*: cada membro avalia se o colega usou IA de forma que manteve a autoria intelectual do grupo. O enunciado completo da atividade declara o que é e o que não é permitido neste nível."

Ao aplicar os instrumentos CATME ou protocolo de pontos, acrescentar o critério de IA como uma das dimensões avaliadas — com ancoragem comportamental específica para o nível declarado.

## Formato de Saída
- **Sistema de avaliação de grupo completo**: dimensões, instrumentos por dimensão, pesos e fórmula de nota individual
- **Protocolo de peer assessment** simplificado (distribuição de pontos) com instruções para estudantes e fórmula de cálculo
- **Instrução de cadastro no CATME** e configuração recomendada para a disciplina
- **Protocolo de reunião de ponto médio** (guia de discussão para a equipe + checklist de intervenção do docente)
- **Análise de dados de peer assessment** (a partir de tabela fornecida): padrões, alertas, recomendações

## Exemplos

**Cenário 1 — TBL em Medicina (equipes de 6, semestre inteiro)**
CATME aplicado 3 vezes: semana 4 (calibração), semana 8 (formativo), semana 15 (somativo).
Análise IA na semana 8: equipe 3 tem membro com pontuação <2 em "cumprir prazos" por 4 colegas — docente agenda conversa individual antes da semana 9.

**Cenário 2 — Projeto integrador (Engenharia, equipes de 4)**
Protocolo de distribuição de pontos no ponto médio + ao final.
Fórmula: nota_individual = nota_produto × min(1,25; max(0,5; fator_pontos))
Um grupo entrega produto excelente (9,5), mas um membro recebe fator 0,6 → nota individual 5,7. O estudante, questionado, reconhece que não participou das reuniões. Docente usa isso como dado para a conversa de retorno.

**Cenário 3 — PjBL interdisciplinar (Computação + Design, AIAS 4)**
Peer assessment com 3 critérios específicos do projeto: contribuição técnica, contribuição criativa/design, comunicação e alinhamento da equipe.
IA analisa as notas e identifica: todas as equipes avaliaram "comunicação" acima de 4/5, mas "contribuição técnica" teve alta variância — sinal de que o critério de comunicação não está bem calibrado e precisa de ancoragem comportamental mais específica para o próximo semestre.

## Limitações
- Peer assessment perde eficácia quando os estudantes não se conhecem bem o suficiente para avaliar a contribuição real do colega — mínimo de 3–4 semanas de trabalho conjunto antes da primeira rodada
- Avaliação por pares em grupos muito pequenos (2–3 membros) é frágil: um avaliador injusto tem impacto desproporcional — usar piso/teto no fator individual
- Culturas de sala onde "trair o colega é desonroso" produzem inflação sistemática de notas — calibração explícita e comunicação de que avaliação honesta é responsabilidade acadêmica ajudam, mas não eliminam completamente
- Projetos de curta duração (menos de 4 semanas) raramente produzem dados de peer assessment confiáveis

## Dependências
- `aias-consultant` — para declarar e comunicar o nível AIAS da atividade de grupo e alinhar os critérios do peer assessment ao nível escolhido
- `ia-educacao-rubrica` — critérios de avaliação do produto do grupo precisam de rubrica; critérios do peer assessment precisam de ancoragem comportamental
- `ia-educacao-tbl` — TBL usa peer assessment (CATME) como componente estrutural; as duas skills se complementam
- `ia-educacao-pbl` — projetos PBL/PjBL têm avaliação individual que a skill de avaliação de grupo operacionaliza
- `ia-educacao-feedback` — feedback dos pares no ponto médio é feedback formativo; modelo Feed Back/Forward se aplica

## Referências
- OHLAND, M. W. et al. The Comprehensive Assessment of Team Member Effectiveness: Development of a Behaviorally Anchored Rating Scale for Self- and Peer Evaluation. Academy of Management Learning & Education, v. 11, n. 4, p. 609–630, 2012.
- FREEMAN, M.; McKENZIE, J. SPARK, a Confidential Web-Based Template for Self and Peer Assessment of Student Teamwork. British Journal of Educational Technology, v. 33, n. 5, p. 551–569, 2002.
- MICHAELSEN, L. K.; KNIGHT, A. B.; FINK, L. D. (Eds.). Team-Based Learning: A Transformative Use of Small Groups in College Teaching. Sterling, VA: Stylus, 2004.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026.

