# SKILL_rubric-applier.md

> Documento de avaliação e rubricas-modelo para a skill proposta **`rubric-applier`** — aplicadora/geradora de rubricas de avaliação alinhadas a critérios pedagógicos e à política de IA.
>
> **Método aplicado**: desenho de 3 rubricas-modelo (programação, redação, projeto) conforme `rubric-design-expert` + homóloga interna `ia-educacao-rubrica`; formatação em tabelas markdown (dimensões × níveis) conforme `academic-eval-markdown`; verificação de viés de IA e clareza conforme `aias-consultant` (skill interna do acervo).

---

## 1. Avaliação da skill proposta

**Proposta**: skill que aplica rubricas de avaliação a entregas de estudantes, gerando notas e feedback estruturado por critério, com coerência com o nível AIAS.

**Encaixe no acervo**: o design de rubricas já é coberto por `ia-educacao-rubrica` (tipos analítica/holística/single-point, 3–6 critérios, 3–4 níveis, descritores neutros, alinhamento Bloom/AIAS/DUA). A proposta agrega valor como **conjunto de rubricas-modelo prontas** para os três contextos mais frequentes — programação, redação e projeto — que este documento entrega.

**Regras aplicadas (fonte: `ia-educacao-rubrica`)**:
- Cada critério espelha um objetivo de aprendizagem declarado
- 3–6 critérios por rubrica analítica; 3–4 níveis de desempenho
- Rótulos neutros (não punitivos): Iniciante, Em desenvolvimento, Proficiente, Exemplar
- Descritores descrevem o que o estudante *faz ou produz*, sem mencionar formato de entrega
- Para AIAS 3–5: critério explícito de *qualidade de uso e curadoria da IA*

---

## 2. Rubrica-modelo 1 — Programação (Computação, AIAS 3)

**Objetivos de aprendizagem**: (1) implementar solução correta e eficiente; (2) escrever código legível e testável; (3) usar IA de forma crítica e documentada.

| Critério (peso) | Iniciante (1) | Em desenvolvimento (2) | Proficiente (3) | Exemplar (4) |
|---|---|---|---|---|
| **Correção funcional** (30%) | A solução não atende aos casos principais; falha em entradas básicas | Atende aos casos principais, mas falha em casos-limite ou de borda | Atende a todos os casos esperados, incluindo borda; saídas verificadas | Atende a todos os casos e demonstra robustez a entradas inválidas (tratamento explícito) |
| **Eficiência e estrutura** (25%) | Algoritmo correto porém ineficiente; estrutura confusa | Estrutura razoável; complexidade aceitável para o problema | Escolha algorítmica justificada; complexidade adequada; código organizado em funções | Solução eficiente com trade-offs documentados; organização que facilita manutenção e teste |
| **Legibilidade e testes** (20%) | Nomes pouco descritivos; sem testes | Nomes descritivos; testes cobrindo o caminho feliz | Código legível; testes cobrindo casos principais e de borda | Código autocontido; testes com casos de falha e documentação de decisões |
| **Uso e curadoria de IA** (25%) | Output de IA incorporado sem verificação ou documentação | Usa IA, mas documenta parcialmente; verificação superficial | Documenta prompts e verifica outputs contra fontes; mantém voz autoral nas decisões | Analisa criticamente os outputs da IA, identifica limitações e justifica as decisões que superaram a sugestão da IA |

**Nível AIAS declarado**: 3 (Colaboração com IA) — IA pode auxiliar na elaboração; o produto é do estudante; o critério de curadoria pondera 25%.

**Nota de aplicação**: o critério "Uso e curadoria de IA" deriva do objetivo (3) e não penaliza o uso autorizado — avalia a *qualidade* do uso, não a ocorrência.

---

## 3. Rubrica-modelo 2 — Redação argumentativa (Língua Portuguesa, AIAS 2)

**Objetivos de aprendizagem**: (1) construir tese clara e defendê-la; (2) sustentar argumentos com evidências contextualizadas; (3) organizar o texto com coesão e coerência.

| Critério (peso) | Iniciante (1) | Em desenvolvimento (2) | Proficiente (3) | Exemplar (4) |
|---|---|---|---|---|
| **Tese e posicionamento** (30%) | A tese é ausente ou contraditória ao longo do texto | A tese é identificável, mas oscila em parte do texto | A tese é clara e sustentada do início ao fim | A tese é original e refinada; o posicionamento evolui com a argumentação |
| **Evidências e fundamentação** (30%) | Afirmações sem evidências ou com evidências irrelevantes | Evidências presentes, mas genéricas ou mal contextualizadas | Evidências específicas e contextualizadas, com fonte identificável | Evidências trianguladas (múltiplas fontes), avaliadas criticamente quanto à pertinência |
| **Coesão e coerência** (20%) | Parágrafos soltos; conectivos ausentes; ideias contraditórias | Estrutura básica (introdução/desenvolvimento/conclusão) com deslizes de coesão | Progressão lógica clara; conectivos adequados; parágrafos com unidade | Estrutura a serviço do argumento; transições que antecipam e retomam ideias |
| **Voz autoral e uso de fontes** (20%) | Reproduz fontes sem distinção da própria voz | Distingue parcialmente fonte e voz própria | Distingue claramente; posiciona-se em relação às fontes | Dialoga criticamente com as fontes; a voz autoral dirige a seleção e a interpretação |

**Nível AIAS declarado**: 2 (Planejamento Assistido por IA) — IA pode auxiliar na ideação e estruturação; o texto final é do estudante. O critério "Voz autoral" verifica exatamente essa fronteira.

**Nota de aplicação**: descritores não mencionam formato ("o texto tem introdução...") — avaliam competência (tese, evidência, coesão), conforme adaptação DUA da `ia-educacao-rubrica`.

---

## 4. Rubrica-modelo 3 — Projeto integrador (Engenharia, AIAS 4)

**Objetivos de aprendizagem**: (1) responder a um problema real com solução viável; (2) aplicar método de projeto com marcos e entregas; (3) dirigir o uso de IA de forma estratégica e avaliar seus limites.

| Critério (peso) | Em desenvolvimento (1) | Proficiente (2) | Exemplar (3) |
|---|---|---|---|
| **Resposta ao problema** (35%) | A solução aborda o problema parcialmente; requisitos essenciais ausentes | A solução atende aos requisitos essenciais e é viável no contexto dado | A solução atende aos requisitos, antecipa restrições não explicitadas e propõe melhoria além do escopo mínimo |
| **Método e gestão do projeto** (30%) | Marcos ausentes ou não cumpridos; decisões não registradas | Marcos cumpridos; decisões registradas e rastreáveis | Processo documentado com alternativas consideradas e critérios de decisão explícitos |
| **Uso estratégico de IA** (35%) | IA usada pontualmente sem direção; outputs incorporados sem avaliação | Dirige a IA com prompts intencionais; avalia e justifica as escolhas sobre outputs | Analisa criticamente capacidades e limitações da IA usada; gera insights além do output inicial; documenta o processo para replicação |

**Nível AIAS declarado**: 4 (IA Integral) — uso estratégico e abrangente de IA; o estudante dirige e interpreta. O critério de IA pondera 35% porque o uso competente de IA é objetivo de aprendizagem da atividade.

**Nota de aplicação**: 3 níveis (não 4) — projeto integrador tem complexidade integrada; a faixa 3–4 níveis da `ia-educacao-rubrica` recomenda menos níveis quando a calibração entre avaliadores é difícil.

---

## 5. Verificação de viés de IA e clareza (via `aias-consultant`)

### 5.1 Check de viés de IA

| Pergunta | Rubrica 1 (Programação) | Rubrica 2 (Redação) | Rubrica 3 (Projeto) |
|---|---|---|---|
| O critério de IA penaliza o uso autorizado? | Não — avalia qualidade do uso (documentação, verificação, autoria), não a ocorrência | Não — AIAS 2 permite IA no planejamento; o critério verifica a fronteira voz/fonte | Não — AIAS 4 pressupõe uso estratégico; o critério avalia direção e análise crítica |
| Os descritores avaliam competência, não formato? | Sim — "código legível", não "X linhas" | Sim — "tese clara", não "5 parágrafos" | Sim — "solução viável", não "apresentação de slides" |
| Há descritor que exija ferramenta específica? | Não — nenhum critério cita IDE, linguagem ou assistente | Não — nenhum critério cita ferramenta de escrita | Não — nenhum critério cita ferramenta de IA específica |
| Estudante sem acesso a IA é prejudicado? | Não — AIAS 3 permite, não exige; o critério avalia curadoria quando há uso | Não — AIAS 2 não exige IA | Não — AIAS 4 exige uso competente; equidade de acesso deve ser garantida pela instituição (nota na política da atividade) |

**Parecer**: **aprovado** — nenhum descritor penaliza uso autorizado de IA, nenhum exige ferramenta específica, e todos avaliam competência independente do formato de entrega.

### 5.2 Check de clareza

| Pergunta | Resultado |
|---|---|
| Cada célula descreve o que o estudante *faz ou produz*? | Sim — verbos observáveis (implementa, sustenta, dirige, documenta) |
| Níveis adjacentes são diferenciáveis sem sobreposição? | Sim — progressão verificável (ex.: "atende aos casos principais" → "incluindo borda" → "robustez a entradas inválidas") |
| Há descritor vago ("bom", "adequado") sem âncora? | Não — cada adjetivo tem âncora observável ("adequado para o problema", "contextualizadas") |
| A escala usa negação ("como o nível 3, mas com erros")? | Não — cada nível é descrito positivamente |
| O estudante consegue usar a rubrica para autoavaliação? | Sim — linguagem direta; recomendado publicar antes da atividade (princípio da `ia-educacao-rubrica`) |

**Parecer**: **aprovado** — descritores ancorados, sem negação, sem jargão; prontas para publicação antes da atividade.

---

## 6. Referências

- BROOKHART, S. M. How to Create and Use Rubrics for Formative Assessment and Grading. Alexandria, VA: ASCD, 2013.
- WIGGINS, G.; McTIGHE, J. Understanding by Design. 2. ed. Alexandria, VA: ASCD, 2005.
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024. Disponível em: https://doi.org/10.53761/q3azde36. Acesso em: 30 jun. 2026.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026.
