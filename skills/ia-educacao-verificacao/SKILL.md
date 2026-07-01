---
name: ia-educacao-verificacao
category: ferramentas-praticas
model: claude
version: 1.3
description: >
  Especialista em aplicar Chain of Verification (CoVe) para docentes validarem materiais didáticos, questões de prova, planos de aula e feedbacks gerados com IA generativa antes de usar em sala. Acione para: "verificar questões geradas por IA", "validar material didático com IA", "checar afirmações de texto gerado por IA", "revisar feedback de IA antes de devolver ao aluno", "como confiar (ou não) no que a IA produziu", "verificação de fatos em material didático", "supervisão docente de output de IA", "conferir plano de aula gerado por IA".
---

# Verificação Docente de Materiais Gerados por IA

## Princípios
- Docentes têm responsabilidade epistêmica sobre o conteúdo que aplicam em sala — IA gera o plausível, não necessariamente o correto
- Verificação sistemática é mais confiável que revisão impressionista: ler com atenção não é o mesmo que verificar afirmação por afirmação
- CoVe transforma a IA de "oráculo" em "assistente que precisa de supervisão qualificada" — postura alinhada ao Referencial MEC (2026) e às normas institucionais de graduação vigentes
- A verificação independente (Factored CoVe) elimina viés de confirmação: cada afirmação é avaliada isoladamente, sem contaminação pela leitura do texto completo
- O esforço de verificação deve ser proporcional ao impacto: prova somativa exige mais rigor do que rascunho formativo

## Quando usar
- Questões de prova e gabaritos gerados com IA (verificar distratores, respostas corretas, enunciados)
- Resumos, slides e apostilas produzidos com IA generativa
- Planos de aula ou sequências didáticas gerados com IA
- Feedbacks em massa gerados por IA para devolver a estudantes
- Bibliografias e referências sugeridas por IA (risco alto de títulos e autores inventados)
- Rubricas e critérios de avaliação produzidos com IA
- Sempre que o material será publicado, aplicado institucionalmente ou terá impacto na nota do estudante

## Workflow

1. **Delimitar o material e seu impacto**
   - Qual é o tipo de material? (questões, texto expositivo, feedback, referências)
   - Qual é o impacto de um erro? (baixo: rascunho formativo / alto: prova somativa, publicação)
   - Aplicar verificação completa para impacto alto; verificação amostral para impacto baixo

2. **Gerar ou receber o material baseline**
   - Se a IA ainda não gerou: produzir o material com prompt claro e documentado
   - Se o material já existe: registrar a fonte e o prompt utilizado (rastreabilidade)

3. **Identificar afirmações verificáveis**
   Extrair do material todas as afirmações que podem ser verdadeiras ou falsas:
   - Fatos históricos, datas, nomes de pessoas e lugares
   - Conceitos científicos, fórmulas, definições
   - Referências bibliográficas (autor, título, ano, periódico)
   - Respostas a questões e justificativas de distratores
   - Afirmações normativas ("a lei exige que...", "a norma estabelece...")

4. **Planejar perguntas de verificação atômicas**
   Para cada afirmação, formular uma pergunta binária e independente:
   - ✓ Atômica: uma afirmação por pergunta
   - ✓ Binária: respondível com Sim/Não ou com dado preciso
   - ✓ Independente: respondível sem consultar o texto original
   - ✗ Evitar: "Este parágrafo está correto?" (vaga e composta)

   **Exemplo — questão de Biologia gerada por IA:**
   ```
   Afirmação: "A mitose produz células geneticamente idênticas à célula-mãe"
   Pergunta de verificação: "A mitose resulta em células com o mesmo número de cromossomos da célula-mãe?"

   Afirmação: "A meiose ocorre em células somáticas"
   Pergunta de verificação: "A meiose ocorre em células somáticas ou em células germinativas?"
   ```

5. **Executar verificações de forma independente (Factored CoVe)**
   Responder cada pergunta **sem consultar o texto original**:
   - Usar o próprio conhecimento da área
   - Quando houver dúvida: consultar fonte confiável (livro-texto, artigo revisado, legislação oficial)
   - Registrar para cada pergunta: **Verificado ✓ / Incorreto ✗ / Incerto ?**
   - Itens "Incerto" exigem pesquisa em fonte externa antes de usar o material

6. **Cross-check e decisão**
   Confrontar os resultados das verificações com o texto original:
   - Afirmações **Verificadas ✓**: manter no material
   - Afirmações **Incorretas ✗**: corrigir ou remover
   - Afirmações **Incertas ?**: resolver antes do uso ou sinalizar com ressalva explícita

7. **Produzir versão validada**
   - Registrar o que foi verificado e o resultado (rastreabilidade)
   - Corrigir ou descartar afirmações não verificadas
   - Documentar limitações do material para uso consciente em sala

## Formato de Saída
- **Tabela de verificação** com afirmação, pergunta, resultado (✓/✗/?) e fonte consultada
- **Relatório de confiabilidade**: proporção de afirmações verificadas, incorretas e incertas
- **Versão corrigida** do material com marcações das alterações realizadas
- **Protocolo reutilizável** por tipo de material (questões de prova, plano de aula, feedback, referências)
- **Alerta de risco**: aviso quando mais de 20% das afirmações são incertas ou incorretas — material exige revisão antes do uso

## Exemplos

**Cenário 1 — Questões de prova (Biologia, Ensino Médio)**
Docente gera 10 questões de múltipla escolha com IA sobre divisão celular.
→ Identifica 3 afirmações por questão = 30 afirmações verificáveis.
→ Aplica Factored CoVe: responde cada pergunta de verificação de forma isolada.
→ Encontra 2 distratores com erro conceitual e 1 questão com gabarito ambíguo.
→ Corrige antes da aplicação. Relatório: 27/30 verificadas ✓, 3 corrigidas ✗.

**Cenário 2 — Resumo histórico (História, Ensino Superior)**
Docente usa IA para gerar resumo de 2 páginas sobre a Revolução Industrial.
→ Extrai 15 afirmações (datas, personagens, causas, consequências).
→ Verifica independentemente; detecta data errada e nome de inventor trocado.
→ Corrige o resumo antes de distribuir como material de apoio.

**Cenário 3 — Feedback em massa (Redação, ENEM)**
Professor usa IA para gerar feedback em 30 redações. Antes de devolver:
→ Aplica CoVe amostral em 5 feedbacks (critério: impacto médio, não somativo).
→ Detecta que a IA classifica incorretamente competência 3 em 2 dos 5 textos.
→ Decide revisar manualmente os feedbacks das redações com nota abaixo de 600.

**Cenário 4 — Referências bibliográficas**
Docente pede à IA uma lista de 10 referências sobre aprendizagem ativa.
→ Para cada referência: verifica autor, título, periódico/editora e ano via DOI ou base de dados.
→ Descobre que 3 referências são inexistentes (alucinação de IA).
→ Remove ou substitui antes de publicar o plano de ensino.

**Cenário 5 — Plano de aula (Química, EPT)**
Coordenador usa IA para gerar sequência didática sobre reações de oxirredução.
→ Identifica afirmações conceituais e normativas (carga horária mínima, referências curriculares).
→ Verifica conceitos contra o livro-texto adotado; verifica normas contra o PPC vigente.
→ Aprova com 2 correções menores; documenta o processo para o portfólio pedagógico da escola.

**Cenário 6 — Verificação de Texto com IA pelos Estudantes (História, 1.º ano EM, escola estadual, AIAS 2 — Planejamento Assistido por IA)**
Docente propõe atividade invertida: cada dupla usa IA para gerar um resumo de 300 palavras sobre a abolição da escravatura no Brasil. Antes de entregar, a dupla aplica CoVe simplificado — lista 5 afirmações do resumo e verifica cada uma em livro didático e em fonte confiável (portal IBGE Educa, Brasil Escola supervisionado ou acervo da biblioteca).
Objetivo pedagógico duplo: aprender o conteúdo histórico e desenvolver letramento crítico sobre outputs de IA.
Produto esperado: resumo revisado + tabela de verificação (afirmação / fonte consultada / resultado: correto, corrigido ou removido). Docente aplica CoVe amostral em 20% das tabelas entregues para calibrar a qualidade das verificações dos estudantes.

## Limitações
- CoVe não substitui o domínio do conteúdo pelo docente: se o verificador não conhece a área, não detecta erros nas verificações
- Domínios em atualização rápida (pesquisa recente, legislação vigente) exigem consulta a fontes externas — o conhecimento interno do docente pode estar desatualizado
- Verificação completa tem custo de tempo: reservar para materiais de alto impacto; usar verificação amostral para materiais formativos
- CoVe não detecta problemas de adequação pedagógica (se o conteúdo é certo, mas inadequado para o nível dos alunos) — esse julgamento permanece com o docente

## Dependências
- `ia-educacao-supervisao-humana` — fundamentos do princípio de supervisão docente sobre IA e protocolos por nível AIAS
- `ia-educacao-avaliacao` — contexto de uso de CoVe para questões de prova e rubricas
- `ia-educacao-integridade-academica` — verificação como mecanismo de integridade institucional
- `aias-consultant` — definição do nível AIAS do material gerado e comunicação de incertezas ao estudante

## Referências
- DHULIAWALA, S. et al. Chain-of-Verification Reduces Hallucination in Large Language Models. arXiv:2309.11495, 2023. Disponível em: https://arxiv.org/abs/2309.11495. Acesso em: 30 jun. 2026.
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026. — Seções 3.4 (Supervisão Humana) e 4.3 (Uso em Avaliação)
- MOLLICK, E. R.; MOLLICK, L. Instructors as Innovators: a Future-focused Approach to New AI Learning Opportunities, With Prompts. The Wharton School Research Paper, 2024.
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024.
