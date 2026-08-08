---
name: ia-educacao-tbl
category: formacao-docente
model: any
version: 1.7
description: >
  Especialista em Team-Based Learning (TBL) com IA no Ensino Superior. Orienta o design do Readiness Assurance Process (iRAT/gRAT), das atividades de aplicação em equipes permanentes e da avaliação entre pares (CATME/IPAC). Amplamente adotado em Medicina, Saúde e Engenharia. Acione para: "TBL", "team-based learning", "aprendizagem baseada em equipes", "iRAT", "gRAT", "readiness assurance", "equipes permanentes", "avaliação entre pares em grupos", "CATME", "aplicação em equipes", "TBL em medicina".
---

# Team-Based Learning (Aprendizagem Baseada em Equipes)

## Princípios
- TBL não é trabalho em grupo — é um modelo pedagógico completo com estrutura específica: equipes permanentes, accountability individual antes do coletivo e atividades de aplicação que exigem integração do conteúdo por toda a equipe ao mesmo tempo
- A sequência é inviolável: preparação individual → teste individual (iRAT) → teste em equipe (gRAT) → aplicação — pular qualquer etapa destrói a lógica do modelo
- Equipes permanentes ao longo do semestre são condição necessária: equipes que mudam a cada atividade não desenvolvem as dinâmicas de confiança e accountability que tornam o TBL eficaz
- IA pode apoiar a preparação, o design das atividades e a análise de dados de avaliação entre pares — mas não substitui o debate entre pares que é o coração do gRAT e da aplicação
- TBL escala: funciona com turmas de 20 a 200 estudantes; quanto maior a turma, mais importante a estrutura do modelo

## Quando usar
- Design ou implementação de uma disciplina completa em TBL
- Criação do banco de questões para o iRAT (Readiness Assurance Test individual)
- Design de atividades de aplicação (Application Activities) com critérios 4S
- Implementação de avaliação entre pares (peer assessment) com CATME ou protocolo equivalente
- Diagnóstico de disfunções em equipes de TBL e intervenção
- Integração de IA nos momentos de preparação e aplicação sem corromper a accountability do RAP

## Workflow

### 1. Estrutura do TBL: módulo por módulo

Cada módulo (unidade temática) do TBL tem três fases:

```
FASE 1 — PREPARAÇÃO (fora de sala, antes do módulo)
   Estudante lê/assiste ao material de pré-aula
   ↓
FASE 2 — READINESS ASSURANCE PROCESS (RAP)
   iRAT: teste individual (10–15 questões, 15–20 min)
   ↓
   gRAT: mesmo teste, agora em equipe (30–45 min, com IF-AT opcional)
   ↓
   Recurso: equipes contestam questões — docente arbitra
   ↓
   Mini-aula: docente esclarece apenas os pontos que os recursos revelaram
   ↓
FASE 3 — ATIVIDADES DE APLICAÇÃO (maioria do tempo)
   Todas as equipes trabalham simultaneamente no mesmo problema
   ↓
   Galeria ou plenária: equipes apresentam respostas; debate entre equipes
   ↓
   Fechamento: princípio unificador do módulo
```

### 2. Design do iRAT/gRAT

O RAT testa *preparação para o módulo*, não domínio final. Questões devem cobrir o que era possível aprender na pré-aula.

**Especificações do teste:**
- 10–15 questões de múltipla escolha, 4 alternativas
- Bloom 1–3 (lembrar, compreender, aplicar simples) — não incluir análise/avaliação no RAT
- Cada questão deve ser respondível em 60–90 segundos
- Nenhuma questão deve exigir cálculo complexo ou memorização de tabelas

**Criação com IA:**
```
Crie [X] questões de múltipla escolha para o iRAT de [tema], nível [graduação].
Objetivo: verificar se o estudante leu e compreendeu o material de pré-aula.
Nível cognitivo alvo: Bloom 1–3 (lembrar, compreender, aplicar).
Cada questão: 1 alternativa correta + 3 distratores plausíveis.
As questões NÃO devem exigir cálculo complexo — devem ser respondíveis por compreensão conceitual.
Material de referência: [lista de tópicos ou resumo do conteúdo de pré-aula]
```

**Validação:** aplicar `ia-educacao-verificacao` para checar precisão factual das questões antes de publicar.

**IF-AT (Immediate Feedback Assessment Technique):**
Cards de raspadinha onde equipes raspam uma alternativa por vez — se correta, aparece uma estrela; se errada, continuam raspando. Criam suspense, debate e feedback imediato dentro do gRAT. Disponível em: epsteineducation.com. Alternativa digital: Kahoot em modo equipe.

### 3. Conduzir o gRAT (teste em equipe)

O gRAT é onde o TBL acontece de verdade: equipes discutem cada questão até chegar a consenso — não votam, debatem até a última resistência ceder ou a melhor evidência prevalecer.

**Papéis do docente durante o gRAT:**
- Circular entre equipes e escutar o raciocínio (não intervir)
- Registrar os padrões de erro para o momento de recursos
- Gerenciar o tempo

**Processo de recursos (Appealing):**
Após o gRAT, equipes podem contestar questões que acham mal formuladas ou cuja resposta marcada como correta entendem estar errada. A contestação exige argumento escrito fundamentado — não reclamação. Docente decide e explica a decisão para toda a turma. Este processo é pedagogicamente valioso: força a equipe a construir argumento técnico.

### 4. Design das Atividades de Aplicação (critérios 4S)

As Application Activities são o momento de maior aprendizagem no TBL. Para que funcionem, precisam satisfazer os quatro critérios 4S:

| Critério | O que significa | Exemplo de verificação |
|----------|----------------|----------------------|
| **S**ignificant Problem | O problema é relevante e autêntico para a área | Estudantes perguntariam "Por que estou fazendo isso?" se não satisfeito |
| **S**ame Problem | Todas as equipes trabalham no *mesmo* problema | Garante que a discussão entre equipes compare soluções |
| **S**pecific Choice | A resposta é uma escolha específica, não um texto aberto | "Qual das quatro opções é melhor?" — não "Descreva uma abordagem" |
| **S**imultaneous Report | Todas as equipes revelam a resposta ao mesmo tempo | Evita que a primeira equipe a responder influence as outras |

**Formatos de Simultaneous Report:**
- Cartão A/B/C/D levantado ao sinal do docente
- Pôster com a resposta virado para baixo, revelado ao mesmo tempo
- Código no Mentimeter enviado mas não revelado até todas as equipes votarem

**Integração de IA nas Application Activities:**

| AIAS | Papel da IA |
|------|-------------|
| 1 | Sem IA — equipes trabalham com os materiais fornecidos |
| 2 | IA forneceu dados ou contexto adicional como parte do problema |
| 3 | Equipes podem consultar IA durante a atividade, mas devem citar e justificar o que usaram |
| 4 | IA é ferramenta central da atividade — equipes comparam resultados de diferentes abordagens com IA e justificam a escolha |

**Plenária pós-aplicação:**
O momento mais rico — docente pergunta às equipes com respostas diferentes para defender sua escolha. Equipes debatem entre si. Docente não revela a "resposta certa" imediatamente — deixa o debate esgotar. Ao final, sintetiza o princípio de decisão que o exercício ilustrou.

### 5. Avaliação entre pares (Peer Assessment)

TBL exige avaliação entre pares ao menos duas vezes no semestre. Os dois instrumentos mais usados:

**CATME (Comprehensive Assessment of Team Member Effectiveness):**
- 5 dimensões: contribuição, interação com a equipe, manutenção da equipe, expectativas do trabalho, capacidade de ensinar e aprender com outros
- Cada membro avalia todos os colegas e a si mesmo
- Ferramenta online: catme.org (gratuita)
- IA pode ser usada para analisar padrões nos dados do CATME e identificar equipes com disfunção antes que afete o aprendizado

**Protocolo simplificado (sem CATME):**
Cada estudante distribui 10 pontos entre os colegas (não para si mesmo) proporcional à contribuição de cada um. Justificativa escrita obrigatória para distribuição desigual. Média das avaliações recebidas multiplica a nota da atividade em grupo (ex: nota do grupo × fator individual).

**Prevenção de free riders:**
- Peer assessment com peso real na nota (recomendado: 20–30% da nota do módulo)
- Discussão aberta na turma sobre o que é contribuição de qualidade — antes da primeira avaliação
- Protocolo de resolução de conflito dentro da equipe (mediado pelo docente se necessário)

### 6. Formação de equipes

Equipes TBL não são formadas por afinidade — são formadas pelo docente para maximizar diversidade e distribuir recursos:

- **Tamanho ideal:** 5–7 membros (menos → menos perspectivas; mais → free riders)
- **Critérios de distribuição:** espalhar estudantes com experiência prévia na área, habilidades complementares, e diferentes perfis de aprendizagem
- **Permanência:** a equipe não muda ao longo do semestre — a dinâmica que se desenvolve é parte do aprendizado
- **IA para formação:** docente pode usar IA para analisar os perfis de entrada (formulário inicial sobre experiência, área de atuação, ponto forte e fraco autodeclarado) e sugerir combinações de equipes com diversidade maximizada

## Formato de Saída
- **Banco de questões iRAT/gRAT** (10–15 questões) para um módulo específico, com gabarito e justificativa dos distratores
- **Atividade de aplicação (4S)** completa: problema, opções, critérios de revelação simultânea e perguntas de plenária
- **Protocolo de peer assessment** com escala e instruções para os estudantes
- **Plano de módulo TBL completo** (preparação → RAP → aplicação → plenária), com timebox
- **Rubrica de avaliação de contribuição em equipe** para a avaliação entre pares

## Exemplos

**Cenário 1 — Farmacologia (Medicina, Ensino Superior)**
iRAT: 12 questões sobre mecanismo de ação de antibióticos (material de pré-aula: capítulo + vídeo de 15 min).
Aplicação (4S): dado o caso de um paciente com infecção por S. aureus resistente à meticilina, qual dos quatro antibióticos é a escolha mais justificável? Todas as equipes revelam ao mesmo tempo com cartão colorido → debate entre equipes com posições diferentes.

**Cenário 2 — Engenharia de Produção (Ensino Superior, AIAS 3)**
Atividade de aplicação: qual das quatro configurações de layout de fábrica minimiza o custo total de movimentação no cenário dado?
Equipes podem usar IA para calcular distâncias percorridas nas alternativas — mas a escolha e a justificativa de trade-offs são da equipe.

**Cenário 3 — Direito (Ensino Superior)**
RAP sobre legislação de proteção de dados (LGPD).
Aplicação: dado um caso de vazamento de dados em empresa de médio porte, qual dos quatro tratamentos propostos está mais alinhado com as obrigações do controlador segundo a LGPD?
Simultaneous report via Mentimeter; debate entre equipes com posições A e C; docente fecha com análise do art. 48 da LGPD.

**Cenário 4 — Primeiros Socorros (Técnico em Enfermagem, CEFET-MG, AIAS 1 — Sem IA)**
Módulo: avaliação primária da vítima — protocolo ABCDE do trauma.
iRAT (individual, sem IA): 12 questões sobre sequência de avaliação, sinais de alerta e condutas iniciais; respondido em 15 minutos com ficha impressa.
gRAT (equipes de 5, sem IA): mesmas questões; equipes debatem cada alternativa até consenso — uso de IF-AT em raspadinha para feedback imediato.
Aplicação 4S (AIAS 1): todas as equipes recebem o mesmo simulado de cena de acidente (texto descritivo + foto); devem escolher, entre quatro condutas simultâneas possíveis, qual é a primeira prioridade na abordagem da vítima. Simultaneous report com cartão colorido; debate entre equipes com posições divergentes.
Justificativa do AIAS 1: atividade de saúde com risco real — o protocolo ABCDE precisa estar internalizado para uso em emergência; nenhum momento do módulo permite consulta a IA ou dispositivo.

## Limitações
- TBL exige redesign completo da disciplina — não é possível implementar parcialmente sem perder a lógica do RAP
- Resistência inicial dos estudantes é comum: "Estou pagando para ser ensinado, não para ensinar meus colegas" — contextualizar a metodologia explicitamente na primeira aula
- A qualidade do iRAT/gRAT é determinante: questões mal formuladas geram recursos indevidos e perda de credibilidade do docente
- Turmas com alta proporção de estudantes que não fazem a preparação pré-aula tornam o RAP menos eficaz — combinar com just-in-time teaching para diagnóstico antecipado

## Dependências
- `ia-educacao-peer-instruction` — o design de questões para o iRAT usa os mesmos princípios do ConcepTest; as duas metodologias são frequentemente combinadas
- `ia-educacao-avaliacao-grupo` — protocolo detalhado de peer assessment dentro de equipes permanentes
- `ia-educacao-rubrica` — critérios das Application Activities e da avaliação de contribuição
- `ia-educacao-verificacao` — validar questões do iRAT/gRAT geradas com IA
- `aias-consultant` — definir nível AIAS para as Application Activities do módulo
- `ia-educacao-simulacao` — Application Activities frequentemente usam cenários de simulação; debriefing estruturado potencializa a aprendizagem do gRAT
- `ia-educacao-avaliacao-diagnostica` — o iRAT é, em essência, um instrumento de avaliação diagnóstica individual dentro do Readiness Assurance Process

## Referências
- MICHAELSEN, L. K.; KNIGHT, A. B.; FINK, L. D. (Eds.). Team-Based Learning: A Transformative Use of Small Groups in College Teaching. Sterling, VA: Stylus, 2004.
- SIBLEY, J.; OSTAFICHUK, P. Getting Started with Team-Based Learning. Sterling, VA: Stylus, 2014.
- ESPEY, M. Enhancing Critical Thinking Using Team-Based Learning. Higher Education Research & Development, v. 37, n. 1, p. 15–29, 2018.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026.

