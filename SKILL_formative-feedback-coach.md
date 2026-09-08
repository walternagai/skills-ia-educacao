# SKILL_formative-feedback-coach.md

> Documento de avaliação e templates de feedback formativo para a skill proposta **`formative-feedback-coach`** — coach de feedback formativo com IA, adaptado por contexto de aprendizagem.
>
> **Método aplicado**: verificação de clareza/especificidade/acionabilidade de cada feedback via Chain of Verification (`chain-of-verification` + homóloga interna `ia-educacao-verificacao`); versões por necessidade de aprendizagem — aluno típico, aluno com dislexia, aluno com TDAH (`dua-educator` + homóloga interna `ia-educacao-dua`); reescrita para estimular reflexão, não apenas correção (`active-learning-stem` + homóloga interna `ia-educacao-aprendizagem-ativa`).

---

## 1. Avaliação da skill proposta

**Proposta**: skill que atua como coach de feedback formativo — gera, adapta e verifica feedback para diferentes perfis de estudante, com foco em ação e reflexão.

**Encaixe no acervo**: o design de feedback formativo já é coberto por `ia-educacao-feedback` (modelo Feed Up / Feed Back / Feed Forward de Hattie & Timperley, 2007; máximo de 2 ações por feedback; feedback centrado na tarefa, não na pessoa). A proposta agrega valor como **conjunto de templates adaptados por contexto de aprendizagem** — o que este documento entrega.

**Regras aplicadas (fonte: `ia-educacao-feedback`)**:
- Feedback responde a três perguntas: *Para onde vou?* (feed up), *Como estou indo?* (feed back), *O que fazer a seguir?* (feed forward)
- Máximo de 2 ações de melhoria por feedback — mais do que isso paralisa
- Equilíbrio entre o que funciona e o que precisa melhorar
- Cada ação do feed forward deve ser realizável antes da próxima entrega

---

## 2. Caso de uso base

**Entrega**: redação argumentativa sobre "o uso de tecnologia em sala de aula" (Ensino Superior, 1ª versão, AIAS 2).

**Problemas identificados** (foco da rodada — 2 dimensões, conforme `ia-educacao-feedback`):
1. **Argumento sem evidência**: a tese "a tecnologia distrai os alunos" é afirmada sem dados, exemplos ou fontes.
2. **Conclusão fraca**: o último parágrafo repete a tese sem sintetizar o percurso argumentativo.

**O que funciona** (para equilibrar): a introdução apresenta a tese com clareza e o texto tem progressão lógica entre os dois primeiros parágrafos.

---

## 3. Template 1 — Aluno típico

**Feed Up** (para onde vou):
> O objetivo desta etapa era defender uma tese com argumentos sustentados por evidências. Sua entrega endereça esse objetivo: a tese está clara na introdução e o texto progride de forma lógica até o segundo parágrafo.

**Feed Back** (como estou indo):
> O que está funcionando: a tese "a tecnologia distrai os alunos" é apresentada com clareza, e a progressão entre os dois primeiros parágrafos sustenta a leitura.
> O que ainda não está: (1) a tese é afirmada sem evidências — não há dados, exemplos ou fontes que a sustentem; (2) a conclusão repete a tese em vez de sintetizar o percurso do texto.

**Feed Forward** (o que fazer a seguir — máx. 2 ações):
> 1. Para a próxima versão, sustente a tese com **uma evidência concreta** (dado de pesquisa, exemplo de sala de aula ou fonte citada) no parágrafo em que ela é afirmada.
> 2. Reescreva a conclusão para **sintetizar o percurso** — retome a tese e o caminho argumentativo em uma ou duas frases, sem repetir a introdução.

**Pergunta reflexiva** (estímulo à metacognição):
> Qual evidência você considera mais forte para sustentar sua tese — e por quê?

**Checklist CoVe** (verificação do feedback):
- [x] **Claro**: uma leitura basta para entender as duas ações — sem jargão, sem ambiguidade
- [x] **Específico**: refere trechos concretos da entrega (tese na introdução, conclusão repetitiva)
- [x] **Acionável**: as duas ações são realizáveis antes da próxima entrega (adicionar 1 evidência; reescrever 1 parágrafo)

---

## 4. Template 2 — Aluno com dislexia

**Adaptações DUA aplicadas** (fonte: `ia-educacao-dua`, perfil Dislexia): frases curtas, vocabulário acessível, uma ideia por frase, sem ambiguidade, foco reduzido. O rigor do feedback é mantido — apenas a forma muda.

**Feed Up** (para onde vou):
> O objetivo desta etapa era defender uma tese com evidências. Sua tese está clara na introdução. O texto avança bem até o segundo parágrafo.

**Feed Back** (como estou indo):
> O que está funcionando: a tese é clara e o texto tem progressão lógica.
> O que ainda não está: (1) a tese não tem evidência — falta um dado, um exemplo ou uma fonte; (2) a conclusão repete a tese em vez de fechar o texto.

**Feed Forward** (o que fazer a seguir — máx. 2 ações):
> 1. Adicione **uma evidência** ao parágrafo da tese: um dado, um exemplo de sala de aula ou uma fonte citada.
> 2. Reescreva a conclusão em **uma ou duas frases** que retomem a tese e o caminho do texto.

**Pergunta reflexiva** (estímulo à metacognição):
> Qual exemplo de sala de aula você já viu que mostra a distração causada pela tecnologia?

**Checklist CoVe** (verificação do feedback):
- [x] **Claro**: frases curtas (máx. ~15 palavras), vocabulário acessível, uma ideia por frase
- [x] **Específico**: refere os mesmos trechos concretos da entrega (tese, conclusão)
- [x] **Acionável**: as duas ações são realizáveis antes da próxima entrega; a pergunta reflexiva ancora em experiência concreta (exemplo de sala de aula), reduzindo carga de abstração

**Nota DUA**: se o estudante usar leitor de tela ou TTS, o feedback funciona igualmente — a estrutura em tópicos curtos é compatível com leitura assistiva. Tecnologia assistiva é sempre garantida, inclusive em AIAS 1 (fonte: `ia-educacao-dua`).

---

## 5. Template 3 — Aluno com TDAH

**Adaptações DUA aplicadas** (fonte: `ia-educacao-dua`, perfil TDAH): microtarefas, checklist claro, uma ação por vez, contexto ancorado, texto enxuto, sem excesso de informação.

**Feed Up** (para onde vou):
> O objetivo desta etapa: defender uma tese com evidências. Sua tese está clara. O texto progride bem até o segundo parágrafo.

**Feed Back** (como estou indo):
> O que está funcionando: tese clara e progressão lógica.
> O que ainda não está: (1) a tese não tem evidência; (2) a conclusão repete a tese.

**Feed Forward** (o que fazer a seguir — 1 ação priorizada + 1 opcional):
> **Ação 1 (faça primeiro)**: adicione **uma evidência** ao parágrafo da tese — um dado, um exemplo ou uma fonte. É a mudança de maior impacto.
> **Ação 2 (se sobrar tempo)**: reescreva a conclusão em uma ou duas frases que fechem o texto.

**Pergunta reflexiva** (estímulo à metacognição):
> Antes de reescrever, responda em uma frase: o que sua evidência mostra sobre a distração causada pela tecnologia?

**Checklist CoVe** (verificação do feedback):
- [x] **Claro**: texto enxuto, estrutura explícita (Ação 1 / Ação 2), sem parágrafos longos
- [x] **Específico**: refere os mesmos trechos concretos da entrega
- [x] **Acionável**: uma ação priorizada (menor carga de decisão), a segunda opcional; a pergunta reflexiva é curta e respondível em uma frase

**Nota DUA**: microtarefas e priorização explícita reduzem a carga executiva (fonte: `ia-educacao-dua`, perfil TDAH — "microtarefas; checklist claro; feedback imediato"). O feedback imediato é viável porque a rodada é formativa, antes da entrega final.

---

## 6. Comparação entre os templates

| Dimensão | Típico | Dislexia | TDAH |
|---|---|---|---|
| Estrutura | 3 partes do modelo | 3 partes, frases curtas | 3 partes, ações numeradas e priorizadas |
| Ações | 2 ações equivalentes | 2 ações equivalentes | 1 ação priorizada + 1 opcional |
| Pergunta reflexiva | Aberta ("qual evidência...") | Ancorada em experiência concreta | Curta, respondível em 1 frase |
| Rigor | Mantido | Mantido (apenas forma adaptada) | Mantido (apenas forma adaptada) |

**Princípio transversal**: nenhuma adaptação reduz o rigor cognitivo do feedback — as três versões exigem as mesmas duas melhorias (evidência + conclusão); muda apenas a forma de comunicar (fonte: `ia-educacao-dua` — "DUA não reduz o rigor: remove barreiras arbitrárias mantendo o desafio cognitivo").

---

## 7. Verificação CoVe consolidada

Aplicação do Chain of Verification (fonte: `ia-educacao-verificacao`) a cada feedback, com perguntas atômicas e binárias:

| Afirmação do feedback | Pergunta de verificação | Resposta |
|---|---|---|
| "A tese está clara na introdução" | A introdução apresenta uma tese identificável? | Sim — "a tecnologia distrai os alunos" |
| "A tese não tem evidência" | Há dado, exemplo ou fonte no parágrafo da tese? | Não — apenas afirmação |
| "A conclusão repete a tese" | A conclusão sintetiza o percurso ou repete a introdução? | Repete — sem síntese |
| "As ações são realizáveis antes da próxima entrega" | O estudante consegue executar as 2 ações em uma rodada de revisão? | Sim — 1 evidência + 1 parágrafo |

**Parecer**: **aprovado** — os três feedbacks são claros, específicos e acionáveis; as afirmações sobre a entrega foram verificadas contra o caso de uso base, não inferidas.

---

## 8. Referências

- HATTIE, J.; TIMPERLEY, H. The Power of Feedback. Review of Educational Research, v. 77, n. 1, p. 81–112, 2007.
- NICOL, D. J.; MACFARLANE-DICK, D. Formative Assessment and Self-Regulated Learning: A Model and Seven Principles of Good Feedback Practice. Studies in Higher Education, v. 31, n. 2, p. 199–218, 2006.
- CAST. Universal Design for Learning Guidelines. Version 2.2. Wakefield, MA: CAST, 2018. Disponível em: https://udlguidelines.cast.org. Acesso em: 30 jun. 2026.
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024. Disponível em: https://doi.org/10.53761/q3azde36. Acesso em: 30 jun. 2026.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026.
