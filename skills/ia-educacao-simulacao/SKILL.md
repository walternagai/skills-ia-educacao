---
name: ia-educacao-simulacao
category: formacao-docente
model: claude
version: 1.0
description: >
  Especialista em simulações educacionais e role-playing com IA generativa no Ensino Superior. Orienta o design de simulações de cenários profissionais complexos (clínicos, jurídicos, de engenharia, diplomáticos, empresariais), o uso de IA como personagem ou interlocutor, e o debriefing estruturado que transforma a experiência em aprendizagem. Acione para: "simulação educacional", "role-playing com IA", "jogo de papéis", "simulação clínica", "simulação jurídica", "negociação simulada", "IA como personagem", "debriefing", "cenário simulado", "simulação de caso profissional".
---

# Simulações Educacionais e Role-Playing com IA

## Princípios
- Simulações criam o "como se" — o estudante age como um profissional *antes de sê-lo*, cometendo erros em ambiente seguro onde o custo do erro é aprendizagem, não dano real
- IA generativa transformou as possibilidades de simulação: pela primeira vez, um estudante pode ter uma conversa realista com um "paciente", "cliente", "cliente jurídico" ou "stakeholder" sem que exista uma pessoa do outro lado — isso escala simulações que antes exigiam atores, pacientes-simulados ou colegas disponíveis
- O debriefing é mais importante que a simulação em si: sem reflexão estruturada sobre o que aconteceu e por quê, a simulação é apenas uma experiência vivida, não aprendizagem — destinar pelo menos o mesmo tempo da simulação para o debriefing
- Fidelidade suficiente, não fidelidade máxima: a simulação precisa ser realista o suficiente para engajar, não tecnicamente perfeita — investir demais em fidelidade e de menos em debriefing é o erro mais comum
- IA como personagem tem limitações: não tem memória entre sessões independentes, pode ser inconsistente em emoções e comportamentos, e tende a ser mais colaborativa do que resistente — o docente precisa calibrar o persona para o objetivo pedagógico

## Quando usar
- Prática de habilidades profissionais que exigem interação com pessoas (entrevista clínica, consulta jurídica, negociação, mediação, comunicação de más notícias)
- Simulação de cenários de tomada de decisão sob pressão ou com informação incompleta
- Exploração de perspectivas de múltiplos stakeholders em situações complexas (política pública, gestão de crises, conflitos organizacionais)
- Prática de habilidades de comunicação difícil: dar feedback negativo, gerenciar conflito, comunicar incerteza técnica ao leigo
- Preparação para estágio, internato ou prática profissional — redução da ansiedade por exposição prévia ao cenário

## Workflow

### 1. Classificar o tipo de simulação

| Tipo | Descrição | Exemplos de uso |
|------|-----------|----------------|
| **Simulação de personagem** | IA assume identidade de paciente, cliente, usuário, oponente ou stakeholder; estudante interage como profissional | Anamnese médica, entrevista de emprego, consulta jurídica, atendimento ao cliente |
| **Simulação de cenário** | IA descreve um ambiente em evolução e reage às decisões do estudante | Gerenciamento de crise, simulação de negócios, resposta a desastre ambiental |
| **Simulação de debate/negociação** | IA representa posição contrária ou de um stakeholder específico; estudante deve negociar, argumentar ou mediar | Negociação trabalhista, audiência judicial, conselho de administração |
| **Simulação de caso colaborativo** | IA é membro de equipe com papel específico; estudante lidera ou colabora | Reunião de equipe multidisciplinar, revisão técnica, julgamento por júri |

### 2. Construir o persona da IA

O design do persona é o componente mais crítico para uma simulação eficaz. O docente precisa especificar:

**Template de persona para prompt do Claude:**
```
Você é [nome], [idade], [profissão/situação].
Contexto: [2–4 linhas descrevendo a situação atual do personagem].
Seu estado emocional: [ansioso / resistente / confuso / hostil / colaborativo — escolher].
O que você sabe: [lista do que o personagem tem consciência].
O que você NÃO sabe: [lacunas de informação do personagem — importantes para o realismo].
Como você se comporta: [comunicativo / reticente / desafiador / cooperativo / evasivo].
Seu objetivo na conversa: [o que o personagem quer obter da interação].
Restrições do personagem: [não revelar X até ser perguntado diretamente / não aceitar a solução sem resistência mínima de 2 turnos].
Se o estudante sair do papel ou pedir ajuda fora do personagem: [sair do personagem e oferecer orientação, depois retornar].
```

**Calibração de dificuldade:**
- Iniciante: persona cooperativo, ansioso por ajuda, informações completas
- Intermediário: persona parcialmente resistente, informação incompleta, emoção presente
- Avançado: persona hostil ou com agenda oculta, múltiplos problemas sobrepostos, pressão de tempo

### 3. Estruturar a simulação

**Briefing pré-simulação (5–10 min):**
- Objetivo da simulação: o que se espera que o estudante pratique (não "o que fazer", mas qual habilidade treinar)
- Informações que o estudante *tem*: contexto do caso, papel que assume, dados iniciais
- Informações que o estudante *não tem* ainda: o que precisará descobrir na interação
- Restrições: tempo, recursos disponíveis, nível de AIAS da simulação

**Condução da simulação:**
- Estudante interage diretamente com o persona da IA
- Docente observa e não intervém durante (apenas em emergência pedagógica)
- Duração: 10–25 min para simulações de personagem; 20–45 min para cenários complexos
- Possibilidade de pausa: "freeze" para reflexão rápida antes de uma decisão crítica

**Registro obrigatório:**
- Estudante anota (ou IA registra) 3 momentos-chave: (1) a decisão mais difícil tomada, (2) o momento em que sentiu mais incerteza, (3) o que diria diferente agora
- Este registro alimenta o debriefing

### 4. Conduzir o debriefing estruturado

O debriefing transforma experiência em aprendizagem. Modelo em 3 fases (Rudolph et al.):

**Fase 1 — Reações (5–10 min)**: "Como foi? O que sentiram?"
- Liberar tensão emocional antes de analisar — sem isso, a análise não acontece
- Não corrigir nada nesta fase; apenas escutar e validar

**Fase 2 — Análise (15–25 min)**: "O que aconteceu e por quê?"
- Identificar os momentos de decisão: "Quando você escolheu X — o que estava pensando?"
- Explorar hipóteses alternativas: "O que poderia ter feito diferente? Com qual efeito?"
- Conectar com conceitos teóricos: "Como isso se relaciona com o que vimos sobre [conceito]?"
- Usar IA como recurso: replay das decisões — pedir à IA do personagem para "sair do personagem" e comentar o que o estudante fez bem e o que poderia melhorar

**Fase 3 — Síntese (5–10 min)**: "O que levar para a prática real?"
- Cada estudante formula 1 princípio de ação derivado da experiência
- Docente conecta com os objetivos de aprendizagem declarados no briefing

### 5. Nível AIAS para simulações

| AIAS | Papel da IA | Produto avaliado |
|------|-------------|-----------------|
| 1 | Sem IA — role-playing com colegas ou ator | Desempenho na interação humana |
| 2 | IA fornece o briefing do caso e documentos de contexto | Decisões do estudante baseadas na leitura |
| 3 | IA é o personagem; estudante conduz a interação | Qualidade da comunicação e das decisões durante a simulação |
| 4 | IA é o personagem *e* ferramenta de análise durante (pausa para consultar IA sobre opções) | Qualidade do uso estratégico de IA + decisões |
| 5 | IA co-cria o cenário com o estudante + é personagem | Capacidade de projetar e facilitar simulação para outros |

### 6. Variações de formato

**Simulação em grupo (fishbowl):**
- 2–3 estudantes fazem a simulação no centro; turma observa e analisa
- Rotação: após 10 min, outro grupo entra; o anterior passa para observador
- Debriefing coletivo: observadores comentam o que notaram

**Simulação escalada (multiple runs):**
- Mesma simulação, parâmetros diferentes (persona mais resistente, menos tempo, informação adicional)
- Estudante percebe como mudanças de contexto exigem ajustes de estratégia

**Simulação com IA e pares:**
- Estudante A interage com persona (IA); estudante B observa e anota; depois invertem papéis
- Feedback de par + debriefing com docente

## Formato de Saída
- **Persona completo** para o tipo de simulação solicitado, com prompt pronto para Claude
- **Briefing do estudante**: o que saber antes de começar, objetivo, restrições
- **Guia de debriefing** com perguntas por fase (Reações → Análise → Síntese)
- **Rubrica de avaliação da simulação**: critérios de qualidade da interação, não do resultado
- **Variações de dificuldade** do mesmo cenário (iniciante, intermediário, avançado)

## Exemplos

**Cenário 1 — Medicina (Ensino Superior, AIAS 3)**
Persona: paciente de 67 anos, diabético, resistente ao tratamento prescrito, desconfiado da medicina.
Objetivo: praticar comunicação em saúde e motivational interviewing.
Debriefing: "Em que momento o paciente ficou mais resistente? O que você fez antes disso que pode ter contribuído?"

**Cenário 2 — Engenharia / Gestão de Projetos (Ensino Superior, AIAS 4)**
Cenário: reunião de crise — produto tem defeito técnico identificado 3 dias antes do lançamento; estudante é gerente de projeto; IA representa engenheiro-chefe (resistente a adiamento), gerente comercial (pressiona para lançar) e CEO (quer decisão em 20 min).
IA também disponível como ferramenta de análise durante pausas (consultar cronograma de impacto, estimar custo de recall).

**Cenário 3 — Direito (Ensino Superior, AIAS 3)**
Persona: cliente em audiência de mediação — dono de empresa em conflito trabalhista; desconfiado, parcialmente culpado, mas não o admite.
Objetivo: praticar técnicas de mediação e identificar interesses subjacentes à posição declarada.
Debriefing: "Quando o cliente revelou algo que contradiz a posição inicial dele? O que você fez nesse momento?"

**Cenário 4 — Relações Internacionais / Administração Pública (Ensino Superior, AIAS 5)**
Estudantes projetam a simulação: definem o cenário de crise diplomática, criam os personas dos países envolvidos, configuram as IAs para cada delegação, facilitam a rodada com a turma, e conduzem o debriefing.
Produto avaliado: qualidade do design da simulação + facilitação + reflexão sobre o que aprenderam ao criar o cenário.

## Limitações
- Personas de IA tendem a ser mais cooperativos do que resistentes por padrão — calibração cuidadosa do prompt é necessária para aumentar a fricção realista
- IA não tem memória entre sessões independentes — simulações que requerem continuidade em encontros diferentes precisam de contexto explícito fornecido no início de cada sessão
- Simulações emocionalmente intensas (comunicação de morte, violência, trauma) requerem preparação psicológica adicional dos estudantes e acompanhamento docente — o debriefing torna-se crítico para não deixar carga emocional sem processamento
- Avaliar simulação é mais difícil que avaliar produto escrito — usar rubrica de processo, não de resultado

## Dependências
- `ia-educacao-rubrica` — critérios de avaliação da qualidade da interação durante a simulação
- `ia-educacao-feedback` — estrutura do debriefing alimenta o ciclo Feed Up/Back/Forward
- `ia-educacao-metacognicao` — registro dos momentos-chave durante a simulação é instrumento metacognitivo
- `ia-educacao-bloom` — calibração do nível cognitivo exigido pela simulação (análise, avaliação, criação)
- `aias-consultant` — definição do papel da IA na simulação por nível AIAS

## Referências
- RUDOLPH, J. W.; SIMON, R.; RAEMER, D. B.; EPPICH, W. J. Debriefing as Formative Assessment: Closing Performance Gaps in Medical Education. Academic Emergency Medicine, v. 15, n. 11, p. 1010–1016, 2008.
- KOLB, D. A. Experiential Learning: Experience as the Source of Learning and Development. 2. ed. Upper Saddle River, NJ: Pearson, 2015.
- MOLLICK, E. R.; MOLLICK, L. Instructors as Innovators: a Future-focused Approach to New AI Learning Opportunities, With Prompts. The Wharton School Research Paper, 2024.
- GABA, D. M. The Future Vision of Simulation in Healthcare. Simulation in Healthcare, v. 1, n. 1, 2004.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, 2026.
- UNIFEI. Resolução CEPEAd nº 17, de 29 de dezembro de 2025 — Norma de Graduação. Itajubá: UNIFEI, 2025.
