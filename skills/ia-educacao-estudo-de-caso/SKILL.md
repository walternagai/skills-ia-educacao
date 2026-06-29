---
name: ia-educacao-estudo-de-caso
category: formacao-docente
model: claude
version: 1.2
description: >
  Especialista em Estudo de Caso como metodologia ativa no Ensino Superior, com integração de IA. Orienta o design de casos mal-estruturados, a facilitação de discussões pelo método Harvard e o uso de IA para gerar perspectivas de stakeholders, atualizar casos e avaliar a qualidade do argumento. Acione para: "estudo de caso", "método de caso", "caso Harvard", "caso para aula", "como criar um caso didático", "facilitação de discussão de caso", "caso de ensino", "análise de caso com IA", "caso interdisciplinar", "caso empresarial para aula".
---

# Estudo de Caso como Metodologia Ativa

## Princípios
- O caso não é um exemplo ilustrativo — é um problema real ou verossímil que exige que o estudante tome uma decisão com informação incompleta, restrições de tempo e perspectivas conflitantes
- A qualidade do caso se mede pela qualidade das decisões que provoca, não pela completude das informações que fornece — casos muito detalhados tendem a ter uma resposta óbvia
- O papel do docente na discussão de caso é socrático: fazer perguntas que aprofundam o argumento do estudante, nunca revelar a "resposta certa" antes que a turma esgote o raciocínio
- IA generativa amplia o estudo de caso: pode representar qualquer stakeholder do caso em tempo real, gerar análise de dados que o caso não forneceu, e criar variações do mesmo caso para grupos diferentes
- Casos precisam de atualização contínua — um caso "vencedor" de 2015 pode ter uma resposta conhecida hoje; IA facilita a atualização e a geração de variações que mantêm a tensão decisória

## Quando usar
- Design de caso de ensino do zero para uma disciplina ou unidade
- Adaptação de caso existente para o contexto institucional ou temporal da turma
- Facilitação de discussão de caso com método Harvard (abertura → desenvolvimento → fechamento)
- Geração de perspectivas de stakeholders para enriquecer a análise do caso
- Avaliação da qualidade do argumento dos estudantes durante e após a discussão
- Integração do caso com IA como ferramenta de análise (AIAS 3–4)

## Workflow

### 1. Distinguir tipos de caso

| Tipo | Estrutura | Objetivo pedagógico |
|------|-----------|---------------------|
| **Caso decisório** | Termina antes da decisão — estudante deve decidir | Praticar tomada de decisão com informação incompleta |
| **Caso de análise** | Decisão já foi tomada — estudante avalia se foi correta | Desenvolver julgamento retrospectivo; aprender com erros alheios |
| **Caso de problema** | Situação disfuncional sem decisor claro — estudante diagnostica | Diagnóstico de sistemas complexos |
| **Caso de pesquisa** | Caso real com dados primários — estudante investiga | Pesquisa aplicada; método científico em campo real |

Para o Ensino Superior, o **caso decisório** é geralmente o mais eficaz para desenvolver raciocínio crítico e transferência.

### 2. Estrutura de um caso de ensino bem construído

**Componentes obrigatórios:**
1. **Situação-gatilho**: o evento que criou a pressão para uma decisão (crise, oportunidade, conflito, dados alarmantes)
2. **Contexto do decisor**: quem precisa decidir, qual é seu papel, quais são seus recursos e restrições
3. **Informação relevante e irrelevante misturadas**: o estudante precisa separar o sinal do ruído
4. **Perspectivas conflitantes**: pelo menos dois stakeholders com visões legítimas e opostas
5. **Restrições reais**: tempo, orçamento, política institucional, ética
6. **Ponto de corte**: o caso termina exatamente onde a decisão precisa ser tomada

**O que NÃO colocar no caso:**
- A solução embutida na narrativa
- Indicações de qual stakeholder está certo
- Dados excessivos que eliminam a ambiguidade necessária
- Julgamentos morais explícitos

**Extensão recomendada:** 3–8 páginas para casos de graduação (mais curtos permitem leitura em sala; mais longos exigem pré-aula).

### 3. Criar casos com IA

IA é útil em duas etapas distintas:

**Etapa A — Gerar o rascunho do caso**

Prompt modelo:
```
Crie um caso de ensino decisório para [disciplina] de [nível de ensino].
Contexto: [área / tema central].
O caso deve terminar exatamente quando [tipo de decisão] precisa ser tomada.
Stakeholders relevantes: [listar 3–4 com perspectivas diferentes].
Restrições: [tempo / orçamento / ética / política].
Extensão: [X páginas].
NÃO inclua a solução nem sinalize qual stakeholder está certo.
```

**Etapa B — Gerar perspectivas de stakeholders para a discussão**

Durante a aula, o docente pode usar IA em tempo real:
```
Você é [Nome], [cargo/papel] da organização do caso.
Sua posição sobre a decisão é: [posição].
Seu interesse pessoal e profissional neste resultado é: [interesse].
Se um estudante te perguntar sobre [aspecto do caso], responda na perspectiva de [Nome].
```
Cada grupo interroga um stakeholder diferente → síntese coletiva das perspectivas.

**Verificação obrigatória:** aplicar `ia-educacao-verificacao` (CoVe) para checar precisão factual de casos baseados em fatos reais antes de usar com estudantes.

### 4. Facilitar a discussão pelo método Harvard

A discussão de caso segue três fases:

**Abertura (15–20% do tempo): "O que está acontecendo?"**
- Docente chama um estudante para "abrir o caso" — apresentar o diagnóstico da situação em 2–3 min
- Pergunta de abertura: "Fulano, o que está acontecendo neste caso e o que você faria?"
- Docente não avalia — registra na lousa (ou quadro) as principais posições declaradas

**Desenvolvimento (60–70% do tempo): "Por que essa decisão? Quais as alternativas?"**
- Aprofundar cada posição com perguntas socráticas
- Perguntas úteis:
  - "Você disse X. Que evidência do caso sustenta isso?"
  - "Quem discorda? Por quê?"
  - "Se você fosse [outro stakeholder], como enxergaria essa decisão?"
  - "Qual é o pior cenário se sua proposta der errado?"
  - "Que informação adicional você precisaria para ter mais certeza?"
- Docente mapeia as posições na lousa; vai construindo a estrutura do argumento coletivamente

**Fechamento (15–20% do tempo): "O que aprendemos?"**
- Docente revela, se houver, o desdobramento real do caso
- Atenção: o fechamento não é "a resposta certa" — é a oportunidade de perguntar "dado o que aconteceu, o que a decisão dos grupos teria produzido?"
- Síntese dos conceitos: "Que princípio de [disciplina] este caso ilustra?"

### 5. Integrar IA na discussão (AIAS 3–4)

| Momento | Uso da IA | AIAS |
|---------|-----------|------|
| Pré-discussão | Estudante usa IA para analisar dados do caso (financeiros, epidemiológicos, ambientais) | 3 |
| Durante | Grupo consulta IA como "consultor neutro" — IA oferece perspectiva de um stakeholder não presente no caso | 3 |
| Durante | IA analisa cenários alternativos à decisão proposta pelo grupo | 4 |
| Pós-discussão | IA sintetiza as posições dos grupos; turma avalia se a síntese foi fiel | 3 |
| Avaliação | Estudante usa IA para identificar as falácias argumentativas usadas durante sua própria defesa | 4 |

### 6. Avaliar o argumento do estudante

O que avaliar em discussão de caso:
- **Uso de evidência**: o argumento está ancorado em dados do caso ou é opinião não fundamentada?
- **Reconhecimento de trade-offs**: o estudante considera as consequências da sua proposta para os outros stakeholders?
- **Adaptabilidade**: o estudante revisa a posição quando apresentado com contra-argumento sólido (vs. defensividade)?
- **Integração de conceitos**: o raciocínio usa o vocabulário e os frameworks da disciplina?

Usar `ia-educacao-rubrica` com estes quatro critérios para avaliação de participação na discussão.

## Formato de Saída
- **Caso de ensino completo** (situação-gatilho + contexto + dados + perspectivas + ponto de corte) pronto para uso
- **Notas de docente** (teaching note): como facilitar a discussão, perguntas chave por fase, armadilhas a evitar
- **Personas de stakeholders** prontos para uso com IA durante a discussão
- **Rubrica de avaliação** da qualidade do argumento na discussão
- **Variações do caso** (versão com mais pressão de tempo / versão com dado adicional / versão com stakeholder extra)

## Exemplos

**Cenário 1 — Administração (Ensino Superior)**
Caso: startup brasileira de saúde digital recebe proposta de aquisição de empresa estrangeira; CEO tem 48 horas para decidir; board dividido; dado de mercado ambíguo.
IA durante a aula: cada grupo interroga um stakeholder (CEO, investidor-anjo, fundador técnico, cliente institucional) representado por IA com persona calibrado.

**Cenário 2 — Engenharia Ambiental (Ensino Superior, AIAS 3)**
Caso: empresa mineradora solicita licença de ampliação em área de risco hidrológico; laudo técnico dividido; comunidade afetada; pressão econômica regional.
Estudantes usam IA para modelar impacto ambiental de três cenários alternativos — depois apresentam a recomendação com a análise como evidência.

**Cenário 3 — Medicina / Bioética (Ensino Superior)**
Caso: família solicita suspensão de suporte vital de paciente sem testamento vital; equipe médica dividida; legislação ambígua.
IA representa médico assistente, familiar discordante e consultora de bioética — grupos precisam construir um protocolo de decisão que satisfaça as três perspectivas.

**Cenário 4 — Geografia (3.º ano EM, escola pública federal, AIAS 3 — Colaboração com IA)**
Caso decisório: um município do semiárido nordestino recebe proposta de instalação de parque eólico que geraria 200 empregos temporários e 40 permanentes, mas exigiria a remoção de 80 famílias de comunidade quilombola de seu território histórico. A prefeitura tem 30 dias para emitir parecer.
Situação-gatilho: estudantes são a comissão técnica que assessora a câmara municipal — sem posição prévia e com dados conflitantes sobre impacto socioambiental.
IA (AIAS 3): grupos usam IA para analisar dados socioeconômicos do IBGE sobre o município (PIB per capita, IDH, desemprego) e identificar precedentes de conflitos territoriais similares no Brasil; a recomendação final e a defesa oral são elaboradas pelos estudantes.
Produto esperado: parecer técnico de uma página com recomendação fundamentada, apresentado em plenária com defesa oral mediada pelo método Harvard.

## Limitações
- Casos muito simples ou com resposta óbvia não geram discussão de qualidade — revisar o caso com olhar crítico antes de usar pela primeira vez
- Facilitação de discussão de caso é uma habilidade que requer prática — as primeiras sessões tendem a ser mais expositivas do que o método prevê
- Casos baseados em situações reais recentes podem ter a resolução facilmente pesquisável — usar IA para criar variações fictícias plausíveis ou casos de situações menos conhecidas
- Avaliação de participação oral tem desafios de registro e consistência — usar rúbrica e eventual gravação (com consentimento) para garantir equidade

## Dependências
- `ia-educacao-debate` — técnicas de facilitação de argumentação e gestão de participação
- `ia-educacao-rubrica` — avaliação da qualidade do argumento na discussão
- `ia-educacao-verificacao` — checagem factual de casos gerados com IA ou baseados em fatos reais
- `ia-educacao-bloom` — garantir que o caso ativa nível cognitivo de Análise/Avaliação (Bloom 4–5)
- `aias-consultant` — definição do papel de IA durante a análise do caso

## Referências
- CHRISTENSEN, C. R.; GARVIN, D. A.; SWEET, A. Education for Judgment: The Artistry of Discussion Leadership. Boston: Harvard Business School Press, 1991.
- HERREID, C. F. What Makes a Good Case? Journal of College Science Teaching, v. 27, n. 3, p. 163–165, 1997.
- ERSKINE, J. A.; LEENDERS, M. R.; MAUFFETTE-LEENDERS, L. A. Teaching with Cases. 3. ed. London, ON: Ivey Publishing, 1998.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, 2026.

