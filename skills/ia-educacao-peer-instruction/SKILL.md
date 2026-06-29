---
name: ia-educacao-peer-instruction
category: formacao-docente
model: claude
version: 1.2
description: >
  Especialista em Peer Instruction (Instrução por Pares), metodologia de Eric Mazur, aplicada ao Ensino Superior com IA. Orienta o design de ConcepTests (questões conceituais), a condução do ciclo vote-discuss-revote, a análise de dados de resposta para identificar misconceptions, e a integração com IA para criar questões e interpretar padrões de erro. Acione para: "peer instruction", "instrução por pares", "ConcepTest", "votação em sala", "vote-discuss-revote", "questão conceitual", "clicker", "plickers", "misconceptions em física", "diagnóstico de erros conceituais", "mazur".
---

# Peer Instruction (Instrução por Pares)

## Princípios
- Estudantes aprendem melhor com pares do que com especialistas quando se trata de superar misconceptions — o par ainda se lembra de ter tido a dúvida; o especialista esqueceu
- O ConcepTest não é um quiz de conteúdo — é uma questão projetada para revelar uma confusão conceitual específica que o ensino tradicional tipicamente não resolve
- O dado que importa é a distribuição de respostas *antes* da discussão: se todo mundo acertou (>90%), a questão é fácil demais; se todo mundo errou (<30%), a questão é difícil demais ou mal formulada; a zona produtiva é 30–70% de acertos na primeira votação
- IA generativa escala a criação de ConcepTests — criar uma questão boa à mão leva 30–60 min; com IA, 5–10 min; mas a calibração e a validação continuam sendo humanas
- Peer Instruction é adaptável a qualquer disciplina — começou em Física, mas funciona em Cálculo, Programação, Direito, Medicina, Economia e qualquer área com conceitos que estudantes frequentemente confundem

## Quando usar
- Identificar e corrigir misconceptions conceituais em qualquer disciplina do Ensino Superior
- Substituir partes expositivas da aula por ciclos de ativação que verificam compreensão em tempo real
- Integrar com sala de aula invertida: pré-aula traz o conteúdo, aula usa Peer Instruction para ativar
- Diagnóstico formativo sem avaliação somativa: o docente vê em tempo real onde a turma está
- Gerar dados de aprendizagem por turma para adaptar o ritmo e a ênfase do ensino

## Workflow

### 1. Entender a estrutura do ciclo

```
[Exposição breve: 10–15 min]
       ↓
[ConcepTest apresentado]
       ↓
[Votação individual silenciosa: 1–2 min]
       ↓
[Distribuição de respostas revelada]
       ↓
   SE <30% ou >90%:     SE 30–70%:
   ↓                    ↓
   [Resolver / reformular]   [Discussão com par: 2–3 min]
                              ↓
                         [Re-votação]
                              ↓
                    [Resolução e explicação: 3–5 min]
```

Cada ciclo completo dura 8–15 minutos. Uma aula de 50 min comporta 2–3 ciclos.

### 2. Design de ConcepTests com IA

Um ConcepTest eficaz:
- **Tem uma única resposta correta** (não é questão de opinião)
- **Testa um conceito específico**, não cálculo ou memorização
- **As alternativas erradas são plausíveis**: cada distrator representa um misconception real, não um erro aleatório
- **Não é resolvível por cálculo** — o estudante deve raciocinar, não calcular
- **Funciona em 1–2 minutos** — se precisa de mais tempo, o escopo está errado

**Prompt para geração de ConcepTest com IA:**
```
Crie um ConcepTest para o conceito de [conceito específico] em [disciplina], nível [graduação].
O objetivo é revelar o misconception: [descrição do erro conceitual comum].
A questão deve ter 4 alternativas onde:
- Alternativa correta: [breve descrição]
- Distrator 1: representa o erro de [tipo de confusão A]
- Distrator 2: representa o erro de [tipo de confusão B]
- Distrator 3: representa o erro de [tipo de confusão C]
A questão NÃO deve envolver cálculo numérico — deve ser respondida por raciocínio.
```

**Validação antes de usar:**
- [ ] A resposta correta é inequívoca (dois especialistas concordam)?
- [ ] Cada distrator representa um erro conceitual real (não um erro de digitação ou distração)?
- [ ] A questão pode ser lida e respondida em 90 segundos por um estudante que sabe o conteúdo?
- [ ] A questão *não* pode ser respondida corretamente sem entender o conceito (ex: por eliminação ou cálculo)?

**Banco de misconceptions por área para orientar a geração:**

| Área | Exemplos de misconceptions comuns |
|------|-----------------------------------|
| Física | Força implica movimento; peso = massa; circuitos em série têm mesma corrente |
| Cálculo | Derivada é a função; limite só existe se a função está definida no ponto |
| Programação | Recursão é mais lenta que iteração sempre; variáveis são caixas, não etiquetas |
| Estatística | P-valor < 0,05 prova H1; correlação implica causalidade; média representa o grupo |
| Economia | Balança comercial deficitária é sempre ruim; preço mais alto sinaliza melhor qualidade |
| Biologia | Evolução é progresso; organismos se adaptam porque precisam; genes determinam tudo |

### 3. Implementar a votação

**Opções de tecnologia (do mais simples ao mais sofisticado):**

| Método | Como funciona | Vantagem |
|--------|--------------|----------|
| **Cartões coloridos** | Cada estudante tem conjunto A/B/C/D — levanta o cartão | Zero custo; visível instantaneamente |
| **Plickers** | QR code impresso; docente scanneia com celular | Sem dispositivo para o estudante; dados automáticos |
| **Mentimeter / Slido** | Estudante acessa link no celular; vota | Dados em tempo real; histograma automático |
| **Kahoot / Quizizz** | App gamificado; ranking visível | Alta motivação; competição pode distorcer o foco |
| **iClicker** | Hardware dedicado | Mais confiável; dados integráveis ao LMS |

Para Ensino Superior com turmas de 20–60 estudantes: Mentimeter ou Plickers são o melhor custo-benefício.

### 4. Interpretar e agir sobre a distribuição de respostas

| Distribuição | Diagnóstico | Ação do docente |
|-------------|-------------|-----------------|
| >90% correto | Questão muito fácil OU conceito bem dominado | Avançar rapidamente; usar questão mais difícil |
| 70–90% correto | Maioria entendeu; minoria tem misconception específico | Discussão breve; explicação focada no distrator mais escolhido |
| **30–70% correto** | **Zona produtiva** — turma genuinamente dividida | **Discussão com par + re-votação** |
| <30% correto | Questão muito difícil OU exposição inadequada | Não fazer re-votação; voltar ao conteúdo; reformular explicação |

**O dado mais informativo:** qual distrator foi mais escolhido — isso revela o misconception dominante na turma.

Exemplo: em questão sobre lei de Newton, se 60% erraram escolhendo o distrator "a força é proporcional à velocidade", o docente sabe exatamente o que corrigir — e pode preparar a próxima questão para atacar especificamente esse erro.

### 5. Conduzir a discussão entre pares

Instruções para os estudantes durante a fase de discussão:
1. Encontre alguém que escolheu resposta *diferente* da sua (não discutir com quem concorda)
2. Explique *por que* você escolheu a sua resposta — não apenas o que escolheu
3. Escute a explicação do colega antes de responder
4. Você pode mudar de resposta na re-votação — isso é esperado e bem-vindo

O docente circula e *escuta* — não responde perguntas de conteúdo durante a discussão; apenas garante que a conversa está acontecendo.

### 6. Integrar IA no Peer Instruction

| Uso | Descrição | AIAS |
|-----|-----------|------|
| **Pré-aula** | IA gera banco de ConcepTests para a unidade; docente seleciona e valida | 2 (docente usa IA para preparar) |
| **Durante** | Após re-votação, docente pede a IA para gerar explicação do porquê o distrator X é atraente | 3 |
| **Após** | IA analisa o padrão de erros da turma e sugere conceitos para revisar | 3 |
| **Estudante** | Após a aula, estudante usa IA para explorar por que sua resposta inicial estava errada | 3 |

### 7. Avaliar com Peer Instruction

Peer Instruction gera dados naturais de avaliação formativa:
- **Taxa de acerto por questão**: indica onde a turma está
- **Ganho de aprendizagem no ciclo** (Hake Factor): (acerto pós − acerto pré) / (100% − acerto pré) — mede o quanto a discussão ajudou
- **Padrão de distratores**: informa sobre a natureza do misconception
- **Evolução ao longo do semestre**: turmas com Peer Instruction consistente mostram ganho acumulado detectável

Componente de nota opcional: participação nas votações (presença, não acerto) — remove ansiedade e incentiva votação honesta.

## Formato de Saída
- **Banco de ConcepTests** (5–10 questões) para um conceito ou unidade específica, com gabarito comentado e identificação do misconception de cada distrator
- **Plano de aula** com ciclos de Peer Instruction integrados (timebox por ciclo)
- **Protocolo de discussão entre pares** para distribuir aos estudantes na primeira sessão
- **Análise de distribuição de respostas**: interpretação de um resultado hipotético ou real com recomendação de ação
- **Prompt de geração de ConcepTests** calibrado para a disciplina e nível do docente

## Exemplos

**Cenário 1 — Física para Engenharia (Ensino Superior, 80 estudantes)**
Conceito: Terceira Lei de Newton.
ConcepTest: "Um caminhão bate em um carro. Qual força é maior — a do caminhão sobre o carro ou a do carro sobre o caminhão?"
Resultado típico: 35% correto (forças iguais) — zona produtiva. Após discussão: 72% correto.
O docente vê que o distrator mais comum foi "a do caminhão, porque é maior" — e constrói a explicação em torno do misconception de que força depende da massa.

**Cenário 2 — Introdução à Programação (Ensino Superior, AIAS 3)**
Após a aula, estudantes usam IA para gerar 3 ConcepTests sobre o conceito que mais erraram na sessão — trazem na aula seguinte; docente seleciona os melhores para a próxima rodada.
Avalia a qualidade do ConcepTest gerado (distratores plausíveis, conceito bem focado) — competência metacognitiva e de compreensão do conceito.

**Cenário 3 — Estatística (Ensino Superior)**
Conceito: Interpretação de p-valor.
ConcepTest: "Um experimento obteve p = 0,03. O que isso significa?"
Distratores calibrados para revelar os três misconceptions clássicos: (A) probabilidade da H0 ser verdadeira, (B) probabilidade de replicação, (C) tamanho do efeito.
Resultado típico: <40% correto na primeira votação — indica que a exposição prévia sobre p-valor foi insuficiente e precisa ser refeita antes da discussão.

**Cenário 4 — Física (2.º ano EM, escola estadual pública, AIAS 1 — Sem IA)**
Conceito: eletrostática — superposição de campos elétricos.
ConcepTest: "Duas cargas iguais e de sinais opostos estão fixas e equidistantes de um ponto P. O campo elétrico resultante em P aponta em qual direção?" — 4 alternativas calibradas para revelar o misconception de que campos de sinais contrários se cancelam em vez de se somarem vetorialmente.
Votação: cartões coloridos impressos (escola sem infraestrutura de wi-fi estável); sem dispositivos durante a sessão — AIAS 1.
Resultado típico: 38% correto na primeira votação — zona produtiva; após discussão em duplas, 69% correto.
Alinhamento ENEM: conceito recorrente no eixo "Calor, Ótica e Eletromagnetismo" do exame; o ConcepTest foi calibrado para o nível de abstração vetorial exigido nas questões de Física do ENEM.

## Limitações
- Turmas passivas ou culturalmente avessas a "errar na frente dos outros" resistem ao Peer Instruction no início — normalizar o erro como parte do processo desde a primeira sessão
- ConcepTests mal construídos geram distribuições de resposta que não revelam o misconception, apenas confundem — a qualidade da questão é o fator limitante
- Em turmas muito pequenas (<12 estudantes), a probabilidade de ninguém ter resposta diferente na fase de discussão é alta — adaptar para duplas com questões sequenciais

## Dependências
- `ia-educacao-sala-invertida` — Peer Instruction é o núcleo do presencial na sala invertida; as duas skills se complementam diretamente
- `ia-educacao-verificacao` — validar ConcepTests gerados por IA antes de aplicar à turma
- `ia-educacao-metacognicao` — reflexão pós-sessão sobre erros conceituais é instrumento metacognitivo
- `ia-educacao-avaliacao` — dados de votação como evidência de aprendizagem formativa

## Referências
- MAZUR, E. Peer Instruction: A User's Manual. Upper Saddle River, NJ: Prentice Hall, 1997.
- CROUCH, C. H.; MAZUR, E. Peer Instruction: Ten Years of Experience and Results. American Journal of Physics, v. 69, n. 9, p. 970–977, 2001.
- HAKE, R. R. Interactive-Engagement versus Traditional Methods: A Six-Thousand-Student Survey of Mechanics Test Data for Introductory Physics Courses. American Journal of Physics, v. 66, n. 1, p. 64–74, 1998.
- SMITH, M. K. et al. Why Peer Discussion Improves Student Performance on In-Class Concept Questions. Science, v. 323, n. 5910, p. 122–124, 2009.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, 2026.

