---
name: ia-educacao-banco-questoes
category: ferramentas-praticas
model: claude
version: 1.2
description: >
  Especialista em design e gestão de bancos de questões e blueprints de prova para o Ensino Superior. Cobre taxonomia de itens, tabela de especificações (blueprint), parametrização por nível de Bloom e tipo de conhecimento, análise psicométrica básica, curadoria de banco com IA, e montagem de provas balanceadas a partir do banco. Acione para: "banco de questões", "blueprint de prova", "tabela de especificações", "montagem de prova", "banco de itens", "taxonomia de itens", "prova balanceada", "especificação de prova", "matriz de prova", "banco de questões com IA", "curadoria de itens", "prova parametrizada".
---

# Banco de Questões e Blueprint de Provas

## Princípios
- Um banco de questões sem taxonomia é um arquivo morto — a classificação de cada item (Bloom, dificuldade, tópico) é o que torna o banco útil para montar provas balanceadas
- O blueprint (tabela de especificações) é o contrato entre o docente e a prova: define quantas questões de cada tópico, nível cognitivo e tipo de conhecimento compõem o instrumento
- Uma prova balanceada amostra o conteúdo de forma representativa, não exaustiva — não é possível testar tudo, mas é possível testar uma amostra significativa
- A análise pós-prova alimenta o banco: itens com baixa discriminação ou distratores ineficazes são revisados ou removidos
- IA pode auxiliar na geração, classificação e curadoria de itens, mas a validação conceitual e o alinhamento ao blueprint são responsabilidade docente

## Quando usar
- Criação de banco de questões para disciplinas com múltiplas turmas ou ofertas regulares
- Design de blueprint de prova para avaliações somativas (provas bimestrais, exames finais)
- Montagem de provas balanceadas a partir de banco existente
- Revisão e curadoria de banco de questões (itens desatualizados, mal classificados, com baixo desempenho)
- Preparação de provas para ENADE, vestibulares, concursos e certificações
- Criação de provas parametrizadas (versões diferentes para turmas diferentes a partir do mesmo banco)
- Alimentação de sistemas de avaliação adaptativa (computer-adaptive testing)

## Workflow

1. **Estruturar o banco de questões**

   Cada item do banco deve ter metadados mínimos:

   | Campo | Descrição | Exemplo |
   |-------|-----------|---------|
   | **ID** | Identificador único | CALC-2026-001 |
   | **Tópico** | Assunto específico | Derivadas: regra da cadeia |
   | **Nível Bloom** | 1–5 (Lembrar a Avaliar) | 3 (Aplicar) |
   | **Tipo de conhecimento** | Factual, Conceitual, Procedimental | Procedimental |
   | **Dificuldade estimada** | Fácil, Médio, Difícil | Médio |
   | **Dificuldade observada (p)** | Índice pós-prova (0–1) | 0,65 |
   | **Discriminação (D)** | Índice pós-prova | 0,42 |
   | **Distratores eficazes** | Quais distratores tiveram >5% de escolha | B, C |
   | **Versão** | Controle de revisão | 2 |
   | **Última revisão** | Data da última validação | 2026-06-01 |
   | **Tags** | Palavras-chave adicionais | engenharia, física, cálculo |

2. **Construir o blueprint (tabela de especificações)**

   O blueprint define a composição da prova antes de selecionar as questões:

   **Exemplo: Prova de Cálculo I (Engenharia, 10 questões, 100 min)**

   | Tópico | Lembrar (1) | Compreender (2) | Aplicar (3) | Analisar (4) | Avaliar (5) | Total | Peso |
   |--------|------------|----------------|-------------|-------------|-------------|-------|------|
   | Limites | 1 | 1 | 1 | — | — | 3 | 30% |
   | Derivadas | — | 1 | 2 | 1 | — | 4 | 40% |
   | Aplicações | — | — | 1 | 1 | 1 | 3 | 30% |
   | **Total** | 1 | 2 | 4 | 2 | 1 | 10 | 100% |

   **Regras do blueprint:**
   - A soma das questões por tópico reflete a importância relativa do conteúdo
   - A distribuição por nível de Bloom reflete os objetivos de aprendizagem da disciplina
   - O blueprint é publicado antes da prova (transparência para o estudante)
   - O mesmo blueprint pode gerar provas diferentes a partir do banco

3. **Povoar o banco com itens**

   Para cada célula do blueprint, o banco deve ter múltiplos itens disponíveis:

   | Célula (tópico × Bloom) | Itens necessários no banco | Itens na prova |
   |-------------------------|---------------------------|----------------|
   | Limites × Lembrar | 3–5 | 1 |
   | Derivadas × Aplicar | 5–8 | 2 |
   | Aplicações × Avaliar | 3–5 | 1 |

   **Regra de ouro**: o banco deve ter pelo menos 3 itens disponíveis para cada item necessário na prova — isso permite rotatividade, versões diferentes e substituição de itens com baixo desempenho.

4. **Montar a prova a partir do banco**

   Algoritmo de montagem:

   1. Definir o blueprint (tópicos × níveis × quantidades)
   2. Selecionar itens do banco que preencham cada célula
   3. Verificar: itens selecionados não se sobrepõem (um item não responde a outro)
   4. Verificar: itens selecionados não têm pistas mútuas (resposta de um revela resposta de outro)
   5. Verificar: distribuição de dificuldade compatível com o nível da turma
   6. Gerar versão final com ordenação por dificuldade (fácil → difícil)

   **Para múltiplas turmas:**
   - Versão A e B: mesmos tópicos e níveis, itens diferentes do banco
   - Versão A e B: mesma dificuldade média, itens diferentes
   - Rotação: versão A este semestre, versão B no próximo

5. **Analisar itens pós-prova e retroalimentar o banco**

   Após cada aplicação, atualizar os metadados de cada item:

   | Métrica | Cálculo | Ação |
   |---------|---------|------|
   | **p (dificuldade)** | acertos / total | p < 0,2: muito difícil — revisar; p > 0,9: muito fácil — revisar ou mover para nível Bloom inferior |
   | **D (discriminação)** | (acertos no terço superior - acertos no terço inferior) / n | D < 0,1: item não discrimina — revisar ou remover; D < 0: item problemático — investigar |
   | **Eficácia de distratores** | % de escolha por distrator | Distrator com < 5%: substituir; distrator com > gabarito: misconception forte — revisar ensino |
   | **Confiabilidade (alfa)** | Consistência interna da prova | α < 0,7: prova com baixa consistência — revisar itens problemáticos |

6. **Integrar IA na gestão do banco**

   | Tarefa | Como a IA auxilia | Supervisão necessária |
   |--------|------------------|----------------------|
   | **Geração de itens** | Sugerir itens para células vazias do blueprint | Validar precisão conceitual e alinhamento Bloom |
   | **Classificação** | Sugerir nível Bloom e tipo de conhecimento | Confirmar classificação |
   | **Revisão de distratores** | Sugerir novos distratores para itens com baixa eficácia | Verificar plausibilidade |
   | **Análise pós-prova** | Calcular métricas e identificar itens problemáticos | Interpretar resultados no contexto da turma |
   | **Montagem de prova** | Selecionar itens que preenchem o blueprint | Verificar sobreposições e pistas mútuas |

7. **Adaptar para STHEM**

   | Área | Característica do banco | Ênfase no blueprint |
   |------|------------------------|---------------------|
   | **Science** | Itens com cenários experimentais e análise de dados | Níveis 3–4 (Aplicar, Analisar) com maior peso |
   | **Technology** | Itens com trechos de código, saídas, diagramas | Níveis 3–5 (Aplicar a Avaliar) |
   | **Humanities** | Itens com excertos de fontes e análise argumentativa | Níveis 2–5 (Compreender a Avaliar) |
   | **Engineering** | Itens com problemas de múltiplas restrições | Níveis 3–5 com ênfase em tomada de decisão |
   | **Mathematics** | Itens com demonstrações e raciocínio abstrato | Níveis 1–4 com ênfase em Aplicar e Analisar |

8. **Verificar e validar o banco e a prova montada**

   Antes de aplicar a prova, verificar a integridade do banco e da montagem:

   | Dimensão | O que verificar | Como verificar |
   |----------|----------------|----------------|
   | **Cobertura do blueprint** | Todas as células do blueprint têm itens disponíveis? | Relatório de cobertura: células com menos de 3 itens precisam de novos itens |
   | **Qualidade dos metadados** | Cada item tem classificação Bloom, dificuldade e tópico corretos? | Amostragem: revisar 20% dos itens do banco para verificar consistência da classificação |
   | **Independência entre itens** | Itens selecionados para a mesma prova não se sobrepõem? | Verificar se a resposta de um item não é revelada por outro item |
   | **Balanceamento de dificuldade** | A prova tem distribuição equilibrada de itens fáceis, médios e difíceis? | Calcular a dificuldade média estimada da prova: deve estar próxima do nível da turma |
   | **Atualização do banco** | Itens com baixo desempenho em aplicações anteriores foram revisados? | Verificar data da última revisão de cada item selecionado |
   | **Validação de itens gerados por IA** | Itens gerados por IA passaram por Chain of Verification? | Aplicar CoVe a cada item gerado por IA antes de incluir no banco |
   | **Versões múltiplas** | Para múltiplas turmas, as versões são equivalentes em dificuldade e cobertura? | Comparar blueprints e dificuldade média entre versões A e B |

   **Checklist de verificação (pré-aplicação):**
   - [ ] Blueprint completo com todas as células preenchidas
   - [ ] Banco tem no mínimo 3 itens por célula do blueprint
   - [ ] Itens selecionados são independentes entre si
   - [ ] Dificuldade média da prova compatível com a turma
   - [ ] Itens com baixo desempenho histórico foram revisados ou substituídos
   - [ ] Itens gerados por IA passaram por Chain of Verification
   - [ ] Versões múltiplas (se houver) são equivalentes
   - [ ] Prova ordenada por dificuldade (fácil → difícil)

## Formato de Saída
- **Template de banco de questões**: planilha com campos de metadados por item
- **Blueprint de prova**: tabela de especificações tópico × nível Bloom × quantidade
- **Prova montada**: instrumento completo com gabarito, gerado a partir do blueprint
- **Relatório de análise pós-prova**: métricas por item (dificuldade, discriminação, distratores)
- **Plano de curadoria**: itens a revisar, substituir ou remover com base na análise
- **Relatório de cobertura do banco**: células do blueprint com itens insuficientes
- **Checklist de verificação pré-aplicação**: 8 itens de conferência antes de aplicar a prova
- **Relatório de validação da prova montada**: verificação de independência, balanceamento e equivalência entre versões

## Exemplos

**Cenário 1 — Blueprint para prova de Cálculo I (Engineering, AIAS 1)**
Disciplina com 3 turmas. Blueprint: 10 questões, 100 min.
Banco: 45 itens classificados por tópico (limites, derivadas, aplicações) e nível Bloom (1–5).
Montagem: versão A e B a partir do mesmo blueprint, itens diferentes.
Análise pós-prova: 3 itens com D < 0,1 — revisados e substituídos no banco.

**Cenário 2 — Banco de questões para disciplina de Programação (Technology, AIAS 1)**
Disciplina com 200 estudantes, 4 turmas. Banco com 120 itens.
Blueprint: 15 questões, 90 min. Tópicos: variáveis/condicionais (4), loops (4), arrays (4), funções (3).
Distribuição Bloom: Lembrar (2), Compreender (3), Aplicar (6), Analisar (3), Avaliar (1).
Montagem: 4 versões diferentes (uma por turma) a partir do banco.

**Cenário 3 — Curadoria de banco para disciplina de História (Humanities, AIAS 2)**
Banco existente com 80 itens, muitos desatualizados (pré-IA).
Curadoria: (1) Remover itens de Lembrar factual que IA responde trivialmente; (2) Adicionar itens de Analisar/Avaliar com excertos de fontes; (3) Reclassificar itens por Bloom (muitos estavam superestimados).
Resultado: banco reduzido para 60 itens, com distribuição Bloom mais equilibrada.

**Cenário 4 — Prova parametrizada para laboratório de Física (Science, AIAS 1)**
Mesma prova, 5 versões com parâmetros diferentes (valores numéricos, ordem de questões, distratores).
Blueprint idêntico para todas as versões. Banco com itens parametrizáveis.
IA gera as variações numéricas; docente valida uma versão e replica o padrão.

## Limitações
- Construir e manter um banco de questões é trabalho contínuo — o retorno vem após 2–3 ofertas da disciplina
- A análise psicométrica requer amostra mínima (idealmente n > 50 por item) — turmas pequenas têm métricas instáveis
- O blueprint é uma ferramenta de design, não uma camisa de força — ajustes contextuais são legítimos
- Itens de nível 5 (Avaliar) são difíceis de classificar consistentemente e podem ter baixa discriminação
- IA pode gerar itens com erros conceituais sutis — a validação docente é obrigatória antes de qualquer item entrar no banco

## Dependências
- `ia-educacao-mcq` — design de itens de múltipla escolha que povoam o banco
- `ia-educacao-bloom` — classificação de cada item por nível cognitivo e tipo de conhecimento
- `ia-educacao-avaliacao` — contexto de redesenho de avaliações; blueprint como ferramenta de design
- `ia-educacao-verificacao` — Chain of Verification para validar itens gerados por IA antes de incluir no banco
- `ia-educacao-planejamento-reverso` — alinhamento do blueprint com os resultados desejados (Estágio 1 do UbD)
- `aias-consultant` — definição do nível AIAS que determina se a prova é presencial (AIAS 1) ou com consulta (AIAS 2+)

## Referências
- HALADYNA, T. M.; RODRIGUEZ, M. C. Developing and Validating Test Items. New York: Routledge, 2013.
- DOWNING, S. M.; HALADYNA, T. M. (Eds.). Handbook of Test Development. Mahwah, NJ: Lawrence Erlbaum, 2006.
- ANDERSON, L. W.; KRATHWOHL, D. R. (Orgs.). A Taxonomy for Learning, Teaching, and Assessing: A Revision of Bloom's Taxonomy of Educational Objectives. New York: Longman, 2001.
- BIGGS, J.; TANG, C. Teaching for Quality Learning at University. 4. ed. Berkshire: McGraw-Hill, 2011.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, 2026.
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024.

