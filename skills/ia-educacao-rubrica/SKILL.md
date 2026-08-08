---
name: ia-educacao-rubrica
category: ferramentas-praticas
model: any
version: 1.6
description: >
  Especialista em design de rubricas analíticas e holísticas para avaliação educacional, alinhadas à Taxonomia de Bloom, ao nível AIAS e aos princípios do DUA. Orienta docentes a criar critérios claros, descritores de desempenho precisos e instrumentos que avaliem competência independente do formato de entrega. Acione para: "criar rubrica", "rubrica analítica", "rubrica holística", "critérios de avaliação", "descritores de desempenho", "rubrica para trabalho com IA", "rubrica alinhada a Bloom", "rubrica inclusiva", "como avaliar com critérios claros", "rubrica para TCC", "rubrica para projeto".
---

# Design de Rubricas para Avaliação

## Princípios
- Rubricas tornam explícito o que seria julgamento implícito — o estudante sabe antecipadamente o que excelência significa naquela atividade
- Critérios avaliam *competências*, não formatos: uma rubrica bem construída funciona independente de o estudante ter entregue texto, vídeo, apresentação ou código
- Cada critério deve espelhar um objetivo de aprendizagem declarado — se não há objetivo correspondente, o critério não pertence à rubrica
- Na era da IA generativa, rubricas precisam avaliar o *processo de raciocínio* e a *autoria das decisões*, não apenas o produto final — outputs de IA sem raciocínio visível não satisfazem descritores de nível superior
- Rubricas comunicam expectativas: publicar a rubrica antes da atividade é parte do design, não opcional

## Quando usar
- Criação de rubrica do zero para qualquer tipo de atividade (projeto, TCC, apresentação, portfólio, relatório, código)
- Revisão de rubrica existente para alinhar com objetivos de Bloom ou nível AIAS definido
- Design de rubrica para atividades que integram IA (AIAS 3–5): como avaliar qualidade de uso, curadoria e autoria
- Criação de rubrica para avaliação por pares — descritores precisam ser interpretáveis por estudantes, não só por docentes
- Rubrica de processo vs. produto: avaliar as etapas de construção e não só o artefato final
- Adaptação de rubricas para seguir princípios do DUA: descritores que não privilegiam um formato específico

## Workflow

1. **Definir o propósito e o tipo de rubrica**

   | Tipo | Quando usar | Trade-off |
   |------|-------------|-----------|
   | **Analítica** | Feedback detalhado por dimensão; aprendizagem formativa | Mais tempo para criar e aplicar |
   | **Holística** | Avaliação rápida de impressão geral; trabalhos de alta complexidade integrada | Menos feedback específico |
   | **Single-Point** | Feedback narrativo; foco no que falta para o nível esperado | Menor complexidade; boa para iniciantes em rubricas |

2. **Identificar os critérios a partir dos objetivos**
   - Listar os objetivos de aprendizagem da atividade (usar `ia-educacao-bloom` para verificar nível cognitivo)
   - Cada critério deve corresponder a um objetivo — não criar critérios de "apresentação" ou "formatação" que não derivam de um objetivo declarado
   - Número ideal: 3–6 critérios por rubrica analítica (menos é mais rastreável; mais fragmenta demais)
   - Para atividades com IA (AIAS 3–5): incluir critério explícito de *qualidade de uso e curadoria da IA*, derivado do objetivo de aprendizagem sobre competência com IA

3. **Definir os níveis de desempenho**
   - Número recomendado: 3–4 níveis (2 é insuficiente para diferenciação; 5+ raramente é calibrável com consistência)
   - Nomeação: evitar rótulos punitivos ("Insuficiente", "Fraco") — preferir descritivos neutros ("Em desenvolvimento", "Proficiente", "Exemplar") ou numéricos
   - Pesos: definir peso de cada critério em função da sua importância para os objetivos — critérios de ordem cognitiva superior (Bloom 5–6) geralmente têm maior peso

4. **Redigir os descritores de desempenho**
   Esta é a etapa crítica. Cada célula da rubrica (critério × nível) precisa de um descritor que:
   - Use verbos observáveis no mesmo nível cognitivo do objetivo correspondente
   - Descreva o que o estudante *faz ou produz*, não o que *deveria ter feito*
   - Seja diferenciável dos níveis adjacentes sem sobreposição
   - Não mencione formato de entrega (evitar "o texto apresenta..." — preferir "o argumento demonstra...")

   **Armadilhas comuns nos descritores:**
   - Descritor vago: "O trabalho é bom" → sem critério de julgamento
   - Descritor quantitativo sem qualidade: "Cita 5 fontes" → não avalia uso das fontes
   - Escala por negação: nível 2 = "como o nível 3, mas com alguns erros" → inútil para feedback
   - Adjetivo sem âncora: "análise profunda" sem definir o que "profunda" significa naquele contexto

5. **Calibrar e testar a rubrica**
   - Aplicar a rubrica a 2–3 exemplos de trabalhos reais (ou fictícios) antes de publicar
   - Verificar: dois avaliadores chegam ao mesmo nível para o mesmo trabalho? Se não, os descritores estão ambíguos
   - Para rubricas de avaliação por pares: testar se estudantes conseguem aplicar os descritores sem treinamento extensivo

6. **Alinhar rubrica com AIAS**
   - Para cada nível AIAS, o critério de *uso de IA* tem um descritor diferente:

   | AIAS | Descritor do critério "uso de IA" |
   |------|-----------------------------------|
   | 1 | Não aplicável — IA não é permitida |
   | 2 | Documenta como usou IA no planejamento; produto final é autoral |
   | 3 | Demonstra revisão crítica dos outputs de IA; mantém voz autoral identificável |
   | 4 | Dirige a IA com prompts intencionais; avalia e justifica escolhas sobre outputs |
   | 5 | Analisa criticamente capacidades e limitações da IA usada; gera insights além do output inicial |

7. **Adaptar para DUA**
   - Substituir referências a formatos específicos por descrições de competência: "o argumento está estruturado com clareza" em vez de "o texto tem introdução, desenvolvimento e conclusão"
   - Para avaliação por pares: simplificar linguagem dos descritores sem reduzir o rigor cognitivo
   - Para estudantes com dislexia ou TDAH: oferecer versão com marcadores visuais ou checklist derivado da rubrica

## Formato de Saída
- **Rubrica analítica completa**: tabela critério × nível com descritores e pesos
- **Rubrica holística**: descrição narrativa por nível de desempenho global
- **Single-point rubric**: coluna central com o padrão esperado + espaço para feedback narrativo
- **Checklist derivado**: versão simplificada da rubrica para autoavaliação ou avaliação por pares
- **Relatório de alinhamento**: tabela objetivo de Bloom → critério → peso → nível AIAS

## Exemplos

**Cenário 1 — TCC em Computação (AIAS 5)**
Critérios: (1) Fundamentação teórica, (2) Originalidade da contribuição, (3) Rigor metodológico, (4) Uso crítico de IA no desenvolvimento, (5) Clareza da comunicação.
Critério 4 — nível Exemplar: "Documenta e analisa o uso de IA generativa no desenvolvimento, identificando limitações, vieses detectados e decisões autorais que superaram os outputs da IA."

**Cenário 2 — Projeto interdisciplinar (Ensino Médio, AIAS 3)**
Critérios: (1) Resposta ao problema proposto, (2) Integração de saberes das disciplinas envolvidas, (3) Qualidade do argumento, (4) Uso e curadoria de fontes (incluindo IA).
Critério 4 — nível Proficiente: "Usa fontes diversas, incluindo IA quando permitido; verifica afirmações da IA contra fontes primárias; diferencia informação autoral de output de IA na entrega."

**Cenário 3 — Avaliação por pares de redação (Ensino Superior, AIAS 2)**
Rubrica Single-Point para revisão por pares: padrão esperado = "O argumento central é identificável, sustentado por pelo menos duas evidências contextualizadas e respondido com uma conclusão que retoma a tese."
Espaço de feedback: "O que ainda falta para atingir este padrão:" + "O que já está funcionando bem:"

## Limitações
- Rubricas bem construídas reduzem subjetividade, mas não a eliminam — calibração entre avaliadores é necessária para alta validade
- Rubricas para competências muito complexas (ex: criatividade, inovação) são difíceis de decompor sem trivializar — nestes casos, rubrica holística ou portfólio narrativo pode ser mais adequado
- Rubrica publicada antes da atividade pode induzir o estudante a "marcar as caixas" em vez de desenvolver pensamento genuíno — mitigar com critérios de ordem superior (Avaliar/Criar) que não são satisfeitos por checklist

## Dependências
- `ia-educacao-bloom` — classificação dos objetivos que originam os critérios; verbos dos descritores alinhados ao nível cognitivo
- `ia-educacao-avaliacao` — contexto mais amplo de redesenho de avaliações; rubrica como um dos instrumentos possíveis
- `ia-educacao-planejamento-reverso` — a rubrica do Estágio 2 (UbD) deve ser construída antes do Estágio 3
- `ia-educacao-dua` — adaptação dos descritores para garantir que rubricas avaliem competência, não formato
- `aias-consultant` — definição do nível AIAS que determina o descritor do critério de uso de IA
- `ia-educacao-avaliacao-competencia` — rubricas de proficiência são o instrumento central de certificação de competências
- `ia-educacao-avaliacao-projeto` — rubricas analíticas para avaliar marcos, processo e produto final de projetos

## Referências
- BROOKHART, S. M. How to Create and Use Rubrics for Formative Assessment and Grading. Alexandria, VA: ASCD, 2013.
- ANDRADE, H. L. A Critical Review of Research on Student Self-Assessment. Frontiers in Education, 2019.
- WIGGINS, G.; McTIGHE, J. Understanding by Design. 2. ed. Alexandria, VA: ASCD, 2005.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026.
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024. Disponível em: https://doi.org/10.53761/q3azde36. Acesso em: 30 jun. 2026.

