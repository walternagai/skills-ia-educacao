---
name: ia-educacao-escrita
category: ferramentas-praticas
model: claude
version: 1.2
description: >
  Especialista em escrita acadêmica e técnica com IA no Ensino Superior, com foco em manter a voz autoral e o raciocínio do estudante como núcleo do texto. Cobre relatórios técnicos, artigos científicos, cadernos de laboratório, redação de metodologia e discussão, e revisão com IA. Relevante para todas as áreas STHEM. Acione para: "escrever com IA", "escrita acadêmica", "relatório técnico", "artigo científico", "como usar IA para escrever sem perder minha voz", "revisão de texto com IA", "estrutura de argumento", "coerência do texto", "plágio e IA", "como revisar TCC com IA", "caderno de laboratório".
---

# Escrita Acadêmica e Técnica com IA

## Princípios
- Escrita é pensamento externalizado: o processo de escrever não é apenas comunicar o que já se pensou — é descobrir o que se pensa ao organizar as ideias no papel; usar IA para escrever antes de pensar corta o principal benefício cognitivo da escrita
- Voz autoral não é estilo — é julgamento: a voz do pesquisador aparece nas escolhas de estrutura, nas ênfases, nas ressalvas, nas conexões que o texto estabelece — não na originalidade das palavras; IA pode reformular sem destruir a voz se o pesquisador mantiver o controle das escolhas
- O ciclo correto com IA: pensar → rascunhar (próprio) → usar IA para melhorar → revisar e decidir o que aceitar; o ciclo errado: pedir à IA o texto → editar superficialmente → entregar
- Transparência é pré-requisito: declarar o uso de IA na escrita acadêmica não é fraqueza — é prática científica; o que viola a integridade não é usar IA, é omitir o uso
- Escrita técnica e científica têm convenções de gênero específicas: um relatório de laboratório, um artigo IMRD, um TCC e um relatório de engenharia têm estruturas distintas — IA precisa receber esse contexto para gerar outputs úteis

## Quando usar
- Rascunho de seções de TCC, dissertação ou artigo com IA como co-revisor, não como redator primário
- Estruturação de argumentos antes de escrever (outline com IA)
- Revisão de coerência, clareza e adequação ao gênero textual
- Adaptação de texto para diferentes audiências (técnico → leigo; leigo → científico)
- Cadernos de laboratório e relatórios técnicos com IA para organizar observações
- Revisão de língua portuguesa em texto já redigido (não geração de texto)

## Workflow

### 1. Entender o gênero textual antes de escrever

Cada tipo de texto acadêmico/técnico tem estrutura própria. IA precisa conhecer o gênero para ser útil:

| Gênero | Estrutura canônica | Área STHEM |
|--------|--------------------|-----------|
| **Artigo científico (IMRD)** | Introdução → Método → Resultados → Discussão | S, T, E, M |
| **Relatório técnico de engenharia** | Sumário executivo → Problema → Solução → Análise → Recomendação | E, T |
| **TCC/Monografia** | Introdução → Revisão de literatura → Metodologia → Resultados → Discussão → Conclusão | Todas |
| **Relatório de laboratório** | Objetivo → Fundamento teórico → Materiais e métodos → Resultados → Discussão → Conclusão | S, E, M |
| **Ensaio de humanidades** | Tese → Desenvolvimento temático → Contra-argumentos → Síntese | H |
| **Relatório de projeto (STHEM)** | Problema/questão-motriz → Processo → Produto → Reflexão | Todas |

### 2. O processo de escrita com IA — fase por fase

**Fase A — Pré-escrita (sem IA)**
Antes de qualquer prompt, o escritor precisa ter:
- O argumento central em uma frase: "Este trabalho argumenta que..."
- Os 3–5 pontos principais que sustentam o argumento
- A audiência: quem vai ler, o que já sabe, o que precisa saber

**Fase B — Outline com IA (AIAS 2)**
Com o argumento e os pontos definidos, IA pode:
- Sugerir estrutura de seções consistente com o gênero textual
- Identificar lacunas no argumento (o que falta para o leitor seguir o raciocínio)
- Propor ordem lógica das ideias

Prompt útil:
```
Tenho um argumento central: [argumento].
Meus pontos principais são: [listar].
O gênero é [artigo científico / TCC / relatório técnico].
A audiência é [especialistas / docentes / engenheiros / etc.].
Sugira uma estrutura de seções e identifique lacunas no argumento.
```

**Fase C — Rascunho próprio por seção**
Escrever cada seção sem IA. Imperfeito está correto — o objetivo é externalizar o raciocínio, não produzir texto final.

**Fase D — Revisão com IA (AIAS 3)**
Com o rascunho próprio escrito, usar IA como revisor:

| Tipo de revisão | Prompt eficaz |
|----------------|--------------|
| Clareza | "Revise para clareza sem mudar o argumento. Indique onde o leitor pode se perder." |
| Coerência | "Há contradições ou saltos lógicos entre os parágrafos? Indique cada um." |
| Adequação ao gênero | "Este texto segue as convenções de [gênero]? O que foge do padrão?" |
| Linguagem técnica | "Os termos técnicos estão usados corretamente? Há imprecisões?" |
| Concisão | "Identifique onde o texto é prolixo. Sugira versão mais concisa sem perder significado." |

**Fase E — Decisão do autor**
Para cada sugestão da IA, o escritor decide: aceitar, adaptar ou rejeitar. Aceitar automaticamente todas as sugestões destrói a voz autoral.

### 3. Manter a voz autoral com IA

**O que é voz autoral em texto técnico/científico:**
- As conexões que o autor faz entre ideias (não óbvias para a IA)
- As ressalvas e limitações que o autor reconhece (revela maturidade científica)
- A ênfase em certos resultados em detrimento de outros (revela julgamento interpretativo)
- O posicionamento em relação à literatura (onde o autor concorda, discorda, amplia)

**Técnica "âncora de voz":**
Antes de pedir à IA para revisar ou expandir um trecho, escrever uma frase que encapsula o julgamento autoral daquele trecho: "O ponto que não pode se perder aqui é: [frase]." Incluir essa frase no prompt.

**Sinais de que a voz autoral se perdeu:**
- O texto poderia ter sido escrito por qualquer pessoa da área (genérico demais)
- As ressalvas desapareceram (o texto ficou mais assertivo do que o dado permite)
- As conexões entre ideias se tornaram óbvias (IA prefere conexões seguras)
- O autor não consegue defender cada frase do texto oralmente

### 4. Escrita técnica por área STHEM

**Science — Relatório de laboratório:**
Estrutura rígida; IA útil para:
- Transformar anotações brutas de bancada em texto de "Materiais e métodos" bem formatado
- Gerar tabela de resultados a partir de dados organizados
- Identificar se a "Discussão" responde às hipóteses declaradas na "Introdução"

**Technology — Documentação técnica / relatório de projeto:**
IA útil para:
- Gerar README, documentação de API, manual de uso a partir de notas do desenvolvedor
- Verificar consistência entre especificação e implementação descrita
- Adaptar documentação técnica para stakeholder não-técnico

**Humanities — Ensaio argumentativo:**
IA útil para:
- Identificar onde o argumento é mais fraco (contra-argumento não respondido)
- Sugerir fontes que o autor pode não conhecer (verificar antes de usar)
- Revisar coerência da progressão argumentativa entre parágrafos

**Engineering — Relatório de engenharia:**
IA útil para:
- Estruturar "Sumário executivo" a partir do relatório completo
- Verificar se as "Recomendações" decorrem logicamente da "Análise"
- Revisar linguagem técnica (normas ABNT, terminologia de área)

**Math — Texto matemático:**
IA útil para:
- Revisar clareza das demonstrações em linguagem natural
- Verificar se as hipóteses declaradas são de fato usadas na prova
- Adaptar texto formal para linguagem mais acessível sem perder rigor

### 5. Situações de risco e como mitigar

| Risco | Sinal de alerta | Mitigação |
|-------|----------------|-----------|
| **Geração de referências falsas** | IA cita autores e títulos sem DOI verificável | Nunca aceitar referência que IA gerou sem busca em PubMed/Scopus/Scholar |
| **Texto genérico sem contribuição** | Nenhuma afirmação original; poderia ser resumo de Wikipedia | Aplicar "âncora de voz"; reescrever com perspectiva do próprio dado |
| **Alucinação factual** | IA afirma dado empírico sem citar fonte | Verificar cada afirmação factual com `ia-educacao-verificacao` |
| **Perda de nuance** | IA remove ressalvas e limitações do texto original | Restaurar ressalvas; são marca de maturidade científica, não fraqueza |
| **Homogeneização de estilo** | Todos os textos da turma soam iguais | Usar IA para revisão, não para geração; exigir rascunho próprio antes |

### 6. Declaração de uso de IA na escrita

Para trabalhos acadêmicos, declarar:
- Quais ferramentas foram usadas (Claude, Grammarly, etc.)
- Em quais fases (outline, revisão de gramática, revisão de coerência, etc.)
- O que *não* foi gerado por IA (o argumento central, a interpretação dos dados, as conclusões)

Modelo conciso para rodapé ou nota metodológica:
```
IA generativa (Claude/[ferramenta]) foi usada para revisão de clareza e coerência
nas seções [X] e [Y]. O argumento, a interpretação dos dados e as conclusões são
de autoria exclusiva do(s) autor(es). Nível AIAS: [X].
```

## Formato de Saída
- **Outline estruturado** para o gênero textual solicitado, com checklist de argumento
- **Revisão de seção** com comentários por tipo (clareza / coerência / gênero / concisão)
- **Versão melhorada de parágrafo** com justificativa de cada mudança (para o autor decidir)
- **Checklist de integridade autoral** pré-entrega
- **Adaptação de texto** para audiência específica (técnico → leigo, português → inglês científico)

## Exemplos

**Cenário 1 — TCC em Engenharia (AIAS 3)**
Estudante tem rascunho próprio da "Discussão" — confuso, sem estrutura.
Usa IA: "Meu argumento central nesta seção é [X]. Identifique onde o texto se afasta desse argumento e onde há saltos lógicos."
IA aponta 3 saltos; estudante reescreve os 3 parágrafos problemáticos; aceita 2 sugestões de reformulação e rejeita 1 (porque a IA perdeu a nuance técnica do dado).

**Cenário 2 — Relatório de laboratório (Química, AIAS 2)**
Estudante transcreve anotações brutas do experimento.
Usa IA para estruturar "Materiais e métodos" no formato padrão ABNT — revisa para garantir que o protocolo real (não o protocolo ideal) está descrito.
Escreve "Discussão" sem IA, depois usa IA para verificar se as conclusões respondem às hipóteses declaradas na "Introdução".

**Cenário 3 — Ensaio argumentativo em Humanidades (AIAS 3)**
Docente pede à turma: "Escreva um rascunho de 500 palavras antes de usar qualquer IA."
Após o rascunho, estudante usa IA para identificar onde o contra-argumento não está sendo respondido — reescreve o parágrafo de resposta.
Resultado entregue tem voz autoral preservada, argumento mais robusto.

**Cenário 4 — Redação Argumentativa (Português, 3.º ano EM, escola pública estadual, AIAS 2 — Planejamento Assistido por IA)**
Tema-tipo ENEM: impactos dos algoritmos de recomendação no acesso à informação por jovens brasileiros (direitos humanos e cidadania).
Fluxo: estudante define tese e os três argumentos principais sem IA; usa IA para estruturar o plano textual (introdução, desenvolvimento, proposta de intervenção) e identificar lacunas na articulação das ideias; escreve a redação completa sem IA; usa IA apenas para revisar ortografia antes de entregar.
Produto esperado: redação dissertativo-argumentativa de 30 linhas com nota-alvo na Competência 3 do ENEM (seleção de argumentos e informações para defesa de ponto de vista). A IA é usada exclusivamente na etapa de planejamento — o texto é integralmente do estudante.

## Limitações
- Esta skill não cobre escrita criativa, jornalismo ou comunicação científica para o público leigo — esses gêneros têm convenções distintas
- Revisão de língua estrangeira (inglês científico) com IA funciona bem mas requer que o conteúdo já esteja correto em português — traduzir e revisar com IA ao mesmo tempo aumenta o risco de perda de nuance
- Não há substituição para leitura extensiva do gênero — escrever bem relatórios científicos exige ter lido muitos relatórios científicos; IA não substitui essa exposição

## Dependências
- `ia-educacao-pesquisa` — o processo de escrita acadêmica está integrado ao processo de pesquisa; as duas skills cobrem fases complementares
- `ia-educacao-rascunho` — CoD (Chain of Draft) para processar ideias de forma concisa antes de expandir na escrita
- `ia-educacao-verificacao` — validação de afirmações factuais e referências antes de incluir no texto
- `ia-educacao-feedback` — feedback formativo em ciclos de revisão de escrita; modelo Feed Forward para orientadores
- `ia-educacao-integridade-academica` — política de integridade que rege o uso de IA na escrita de trabalhos avaliados

## Referências
- FLOWER, L.; HAYES, J. R. A Cognitive Process Theory of Writing. College Composition and Communication, v. 32, n. 4, p. 365–387, 1981.
- ZINSSER, W. On Writing Well: The Classic Guide to Writing Nonfiction. 30th Anniversary ed. New York: HarperCollins, 2006.
- DAY, R. A.; GASTEL, B. How to Write and Publish a Scientific Paper. 8. ed. Cambridge: Cambridge University Press, 2016.
- MOLLICK, E. R.; MOLLICK, L. Instructors as Innovators: a Future-focused Approach to New AI Learning Opportunities, With Prompts. The Wharton School Research Paper, 2024.
- ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. NBR 6022: Informação e Documentação — Artigo em Publicação Periódica Científica — Apresentação. Rio de Janeiro: ABNT, 2018.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026.
