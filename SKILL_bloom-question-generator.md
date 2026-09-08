# SKILL_bloom-question-generator.md

> Documento de avaliação e exemplos para a skill proposta **`bloom-question-generator`** — gerador de questões alinhadas à Taxonomia Revisada de Bloom (Anderson & Krathwohl, 2001) para o acervo IA-Educação.
>
> **Método aplicado**: revisão dos 6 níveis de Bloom (fonte: `bloom-taxonomy-educator` + homóloga interna `ia-educacao-bloom`), estruturação de 18 exemplos de questões (3 por nível) em formato de avaliação acadêmica (`academic-eval-markdown`), validação de 3 questões de múltipla escolha — uma por disciplina-alvo (`stem-mcq-validator` + homóloga interna `ia-educacao-mcq`).

---

## 1. Avaliação da skill proposta

**Proposta**: skill que gera questões de prova alinhadas à Taxonomia Revisada de Bloom, com progressão cognitiva explícita e coerência com o nível AIAS.

**Encaixe no acervo**: o tema já é coberto por três skills existentes:

| Skill existente | Cobertura | Sobreposição com a proposta |
|---|---|---|
| `ia-educacao-bloom` | Matriz bidimensional (6 níveis × 4 tipos de conhecimento), verbos presenciais e digitais, diagnóstico de lacunas, alinhamento Bloom × AIAS | Alta — a proposta reutiliza a matriz e os verbos |
| `ia-educacao-mcq` | Design e validação de MCQs: distratores por misconception, alinhamento Bloom, checklist pré-aplicação, análise pós-prova | Alta — a proposta valida MCQs |
| `ia-educacao-banco-questoes` | Bancos de itens, blueprints de prova, metadados por questão | Média — a proposta gera itens que alimentam bancos |

**Recomendação**: a proposta tem valor como **material de referência** (acervo de exemplos formatados por nível), não como skill nova — o acervo já possui as skills de processo. Este documento entrega esse material: 18 exemplos (3 por nível) e 3 MCQs validadas.

---

## 2. Os 6 níveis de Bloom (revisão)

Fonte: Taxonomia Revisada (Anderson & Krathwohl, 2001), matriz da `ia-educacao-bloom`.

| Nível | Verbo clássico | O que o estudante faz | Vulnerabilidade à IA |
|---|---|---|---|
| 1 Lembrar | listar, nomear, reconhecer, recitar | Recupera fatos, termos e definições | Alta — IA responde trivialmente |
| 2 Compreender | resumir, classificar, explicar, comparar | Constrói significado a partir do material | Alta |
| 3 Aplicar | executar, demonstrar, calcular, usar | Usa o conceito em situação nova | Média |
| 4 Analisar | diferenciar, organizar, atribuir, examinar | Decompõe, relaciona, encontra causas | Média |
| 5 Avaliar | julgar, criticar, justificar, testar | Julga com critérios explícitos | Baixa |
| 6 Criar | projetar, produzir, planejar, inventar | Gera produto ou solução original | Baixa |

**Regra de ouro do acervo**: nível AIAS e nível cognitivo são escolhas independentes, mas coerentes — uma atividade AIAS 1 pode exigir Criar; uma AIAS 4 pode ser apenas Lembrar. A coerência é intencionada, não automática.

---

## 3. 18 exemplos de questões (3 por nível)

Formato de cada exemplo: **nível · verbo · disciplina · questão · alinhamento AIAS sugerido**.

### Nível 1 — Lembrar

**Q1.1 · listar · Biologia (Ciência)**
> Liste as quatro fases da mitose, na ordem em que ocorrem, e indique em qual delas os cromossomos se alinham no plano equatorial.

*AIAS sugerido: 1 (Sem IA) — recuperação de fato; IA responderia trivialmente; usar em verificação de leitura prévia, não em somativa.*

**Q1.2 · nomear · Programação (Tecnologia)**
> Nomeie as três estruturas de controle básicas da programação estruturada e associe cada uma ao comando correspondente em Python (`if`, `for`, `while`).

*AIAS sugerido: 1 — reconhecimento de terminologia; complementar com itens de nível 3–5 na mesma prova.*

**Q1.3 · reconhecer · História (Humanidades)**
> Reconheça, entre as alternativas abaixo, o ano em que foi promulgada a primeira Constituição da República brasileira: (a) 1824; (b) 1891; (c) 1934; (d) 1946.

*AIAS sugerido: 1 — fato isolado; a IA responde com precisão, então o item serve para diagnóstico, não para nota.*

### Nível 2 — Compreender

**Q2.1 · explicar · Física (Ciência)**
> Explique, com suas palavras, por que um astronauta em órbita "flutua" mesmo estando sob a ação da gravidade terrestre.

*AIAS sugerido: 2 (Planejamento Assistido por IA) — a explicação é do estudante; IA pode auxiliar na estruturação, não no conteúdo.*

**Q2.2 · comparar · Matemática (Matemática)**
> Compare as funções f(x) = x² e g(x) = 2ˣ no intervalo [0, 4]: em que pontos uma supera a outra e por quê?

*AIAS sugerido: 2 — comparação conceitual; exigir justificativa própria.*

**Q2.3 · classificar · Química (Ciência)**
> Classifique cada substância a seguir como iônica, covalente molecular ou metálica, justificando a classificação pela natureza das ligações: NaCl, H₂O, Fe, CO₂.

*AIAS sugerido: 2 — classificação com justificativa; o erro de classificação revela misconception de ligação.*

### Nível 3 — Aplicar

**Q3.1 · calcular · Cálculo (Matemática)**
> Calcule a derivada de f(x) = x³·eˣ e determine os pontos críticos da função no intervalo [−2, 2].

*AIAS sugerido: 1 — aplicação de regras; em ambiente controlado. Em AIAS 3+, exigir verificação manual de um passo e justificativa.*

**Q3.2 · executar · Programação (Tecnologia)**
> Escreva uma função em Python que receba uma lista de inteiros e retorne a soma dos elementos pares. Execute-a com a entrada [1, 2, 3, 4, 5, 6] e registre a saída.

*AIAS sugerido: 1 (ambiente controlado) ou 3 (com IA: exigir log de prompts e verificação dos outputs).*

**Q3.3 · usar · Engenharia (Engineering)**
> Usando a Lei de Ohm, determine a corrente que atravessa um resistor de 220 Ω submetido a uma tensão de 12 V, e calcule a potência dissipada.

*AIAS sugerido: 1 — aplicação direta de fórmula; distrator típico: inverter V e R na divisão.*

### Nível 4 — Analisar

**Q4.1 · diferenciar · Estatística (Matemática)**
> Dado o conjunto de dados {2, 3, 5, 5, 7, 9, 12}, diferencie o papel da média, da mediana e da moda na descrição da tendência central e identifique qual delas é mais robusta à presença de um outlier.

*AIAS sugerido: 3 (Colaboração com IA) — IA pode gerar os cálculos; o estudante interpreta e decide.*

**Q4.2 · examinar · Programação (Tecnologia)**
> Examine o trecho de código abaixo e identifique a causa do erro de lógica (não de sintaxe), explicando o que a função retorna em cada iteração:

```python
def busca(lista, alvo):
    for i in range(len(lista)):
        if lista[i] == alvo:
            return i
    return -1
```

*AIAS sugerido: 3 — análise de raciocínio algorítmico; IA auxilia, estudante diagnostica.*

**Q4.3 · atribuir · História da Ciência (Humanidades)**
> Atribua a cada descoberta listada o cientista e o contexto histórico correspondentes, justificando por que a atribuição é defensável: radioatividade, estrutura do DNA, relatividade restrita.

*AIAS sugerido: 2 — organização e atribuição com justificativa; verificar contra fontes (CoVe).*

### Nível 5 — Avaliar

**Q5.1 · julgar · Engenharia de Software (Tecnologia)**
> Julgue a afirmação: "Testes unitários com 100% de cobertura garantem a ausência de defeitos no software." Fundamente seu julgamento com critérios de qualidade de teste (cobertura de ramos, mutação, casos-limite).

*AIAS sugerido: 4 (IA Integral) — IA pode gerar testes; o estudante julga a suficiência da evidência.*

**Q5.2 · criticar · Economia (Humanidades)**
> Critique a seguinte conclusão de um relatório: "O aumento do salário mínimo causou o aumento do desemprego, pois ambos cresceram no mesmo período." Aponte a falha de causalidade e proponha uma análise alternativa.

*AIAS sugerido: 3 — julgamento com critérios; distrator típico: confundir correlação com causalidade.*

**Q5.3 · testar · Física (Ciência)**
> Um artigo afirma que um novo material supercondutor opera a −50 °C. Teste a plausibilidade dessa afirmação com base no que se sabe sobre supercondutividade de alta temperatura e liste as evidências adicionais necessárias para confirmá-la.

*AIAS sugerido: 4 — avaliação crítica de afirmação científica; IA auxilia na pesquisa, o estudante julga.*

### Nível 6 — Criar

**Q6.1 · projetar · Engenharia (Engineering)**
> Projete um sistema de irrigação automatizada para uma estufa de 100 m², especificando sensores, atuadores, lógica de controle e critérios de falha segura. Justifique cada escolha.

*AIAS sugerido: 4 ou 5 — projeto com IA como ferramenta central; avaliar processo e autoria das decisões.*

**Q6.2 · produzir · Programação (Tecnologia)**
> Produza um programa em Python que leia um arquivo CSV de notas, calcule a média por disciplina e gere um relatório em Markdown com aprovação/reprovação (média ≥ 6,0). Inclua tratamento de arquivo ausente.

*AIAS sugerido: 3 — produto do estudante com auxílio de IA; exigir documentação do processo.*

**Q6.3 · planejar · Biologia (Ciência)**
> Planeje um experimento para testar a hipótese de que a luz azul acelera a germinação de sementes de alface, especificando grupo controle, variáveis controladas, amostragem e critérios de análise estatística.

*AIAS sugerido: 3 — planejamento experimental; IA pode sugerir desenhos, o estudante valida o rigor.*

---

## 4. Três MCQs validadas (uma por disciplina-alvo)

Validação aplicada conforme `ia-educacao-mcq` (checklist pré-aplicação): stem autossuficiente, 4 alternativas homogêneas, distratores por misconception, sem "todas/nenhuma das anteriores", sem pistas gramaticais, gabarito único, nível Bloom declarado, ausência de vieses, resistência à IA.

### MCQ 1 — Cálculo Diferencial (Matemática, AIAS 1)

**Stem**: "Seja f(x) = x³ − 3x. No intervalo [−2, 2], o valor máximo local de f ocorre em:"

**Alternativas**:
- (a) x = −1
- (b) x = 0
- (c) x = 1
- (d) x = 2

**Gabarito**: (a) — f'(x) = 3x² − 3; pontos críticos em x = ±1; f(−1) = 2 é máximo local (f''(−1) = −6 < 0).

**Distratores e misconceptions**:
- (b) x = 0 — misconception: confundir ponto de inflexão (f''(0) = 0) com extremo local.
- (c) x = 1 — misconception: esquecer o teste da segunda derivada; f(1) = −2 é mínimo local.
- (d) x = 2 — misconception: confundir extremo local com extremo absoluto no intervalo fechado (f(2) = 2, empata com f(−1) mas não é local).

**Nível Bloom**: 4 (Analisar) — diferenciar pontos críticos e classificar extremos.

**Validação**: stem autossuficiente (não depende das alternativas); alternativas homogêneas (todas valores de x); gabarito único; sem pistas gramaticais; contexto cultural neutro. **Resistência à IA**: IA resolve corretamente — em AIAS 1, aplicar em ambiente controlado ou exigir justificativa escrita.

### MCQ 2 — Programação Estruturada (Tecnologia, AIAS 1)

**Stem**: "Considere o trecho abaixo. Qual é o valor impresso ao final da execução?"

```python
x = 2
for i in range(3):
    x = x * 2
print(x)
```

**Alternativas**:
- (a) 8
- (b) 12
- (c) 16
- (d) 32

**Gabarito**: (c) — três iterações: 2→4→8→16.

**Distratores e misconceptions**:
- (a) 8 — misconception: contar 3 multiplicações a partir de 1 (2³) em vez de 3 iterações a partir de 2.
- (b) 12 — misconception: somar em vez de multiplicar (2 + 2 + 2 + 2 + 2 + 2).
- (d) 32 — misconception: contar 4 iterações (confundir `range(3)` com `range(4)`).

**Nível Bloom**: 3 (Aplicar) — executar mentalmente um laço em situação concreta.

**Validação**: stem autossuficiente (código completo, sem dependência externa); alternativas homogêneas (números); gabarito único; sem pistas gramaticais; contexto neutro. **Resistência à IA**: IA responde trivialmente — em AIAS 1, usar em ambiente controlado; em AIAS 3+, complementar com item de nível 5 (julgar a eficiência de uma solução).

### MCQ 3 — Física I (Ciência, AIAS 1)

**Stem**: "Uma bola é lançada verticalmente para cima com velocidade inicial de 20 m/s. Desprezando a resistência do ar, o tempo total de voo até retornar ao ponto de lançamento é:"

**Alternativas**:
- (a) 2,0 s
- (b) 4,0 s
- (c) 8,0 s
- (d) 10,0 s

**Gabarito**: (b) — tempo de subida t = v₀/g = 20/10 = 2,0 s; tempo total = 2 × 2,0 = 4,0 s.

**Distratores e misconceptions**:
- (a) 2,0 s — misconception: calcular apenas o tempo de subida (esquecer a descida).
- (c) 8,0 s — misconception: usar v₀/g com g = 2,5 ou dobrar duas vezes (erro de fator).
- (d) 10,0 s — misconception: confundir tempo de voo com v₀ (20) dividido por 2, ou aplicar fórmula de queda livre sem o fator ½.

**Nível Bloom**: 3 (Aplicar) — aplicar cinemática de lançamento vertical a situação concreta.

**Validação**: stem autossuficiente; alternativas homogêneas (tempos em segundos); gabarito único; sem pistas gramaticais; contexto neutro. **Resistência à IA**: IA responde trivialmente — em AIAS 1, ambiente controlado; em AIAS 3+, exigir justificativa do raciocínio (opção "mostre o raciocínio", conforme adaptação STHEM da `ia-educacao-mcq`).

---

## 5. Referências

- ANDERSON, L. W.; KRATHWOHL, D. R. (Orgs.). A Taxonomy for Learning, Teaching, and Assessing: A Revision of Bloom's Taxonomy of Educational Objectives. New York: Longman, 2001.
- CHURCHES, A. Bloom's Digital Taxonomy. Educational Origami, 2008. Disponível em: https://educationalorigami.wikispaces.com/Bloom%27s+Digital+Taxonomy. Acesso em: jan. 2025.
- HALADYNA, T. M.; RODRIGUEZ, M. C. Developing and Validating Test Items. New York: Routledge, 2013.
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024. Disponível em: https://doi.org/10.53761/q3azde36. Acesso em: 30 jun. 2026.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026.
