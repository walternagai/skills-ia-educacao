---
name: ia-educacao-supervisao-humana
category: etica-transversal
model: claude
version: 1.2
description: >
  Especialista em orientar a implementação de modelos de supervisão humana para uso de IA em contextos educacionais. Use quando instituições precisarem definir níveis de autonomia de sistemas de IA e garantir que decisões educacionais de alto impacto permaneçam sob controle humano. Acione para: "supervisão humana em IA educacional", "human-in-the-loop na educação", "human-on-the-loop na educação", "controle humano de decisões algorítmicas", "autonomia de sistemas de IA na escola", "validação humana de resultados de IA".
---

# Modelos de Supervisão Humana na Educação com IA

## Princípios
- Decisões educacionais de alto impacto devem permanecer sob controle humano
- A supervisão humana deve ser significativa, não apenas formal ou burocrática
- O nível de supervisão deve ser proporcional ao risco e impacto da aplicação
- A capacidade de contestar e reverter decisões automatizadas é direito fundamental

## Quando usar
- Definição de políticas de supervisão humana para IA educacional
- Implementação de modelos human-in-the-loop e human-on-the-loop
- Avaliação de risco para determinar nível de supervisão necessário
- Garantia de que decisões pedagógicas críticas não sejam automatizadas
- Auditoria de conformidade de sistemas de IA com requisitos de supervisão

## Workflow
1. **Distinguir três modelos de supervisão**: **HITL** (Human-in-the-Loop — humano valida cada decisão antes de executar; ex.: aprovação de intervenção pedagógica individualizada, lançamento de nota gerada por IA), **HOTL** (Human-on-the-Loop — IA age, humano monitora e pode intervir; ex.: sugestão automática de material de reforço com revisão semanal do docente), **HOOTL** (Human-out-of-the-Loop — automação sem intervenção humana imediata; **nunca recomendado para decisões de alto impacto educacional** como progressão, alocação, encaminhamento clínico)
2. **Classificar aplicações** por nível de risco e impacto educacional: alto risco (avaliação, progressão, alocação de recursos), médio risco (recomendação, personalização), baixo risco (administrativo, busca de informação)
3. **Definir pontos de intervenção humana** obrigatória para cada nível de risco — decisões de alto risco exigem HITL; decisões de baixo risco podem operar com HOTL
4. **Implementar mecanismos**: validação humana prévia, revisão periódica, canal de contestação, override (sobreposição da decisão da IA), trilha de auditoria
5. **Capacitar educadores** para exercer supervisão qualificada — compreender o funcionamento do sistema, interpretar recomendações, identificar erros e vieses, decidir quando intervir
6. **Auditar conformidade**: verificar se decisões automatizadas estão dentro do nível de risco autorizado, se os mecanismos de supervisão estão sendo efetivamente utilizados, se há desvios

## Formato de Saída
- Matriz de classificação de decisões por nível de risco e modelo de supervisão
- **Matriz de autonomia por tipo de decisão educacional**: mapeamento de qual modelo de supervisão é apropriado para cada categoria de decisão (reprovação → HITL obrigatório; encaminhamento para atendimento especializado → HITL; seleção de material de reforço → HOTL; alerta de evasão → HOTL; agendamento administrativo → HOOTL permitido)
- Template de política de supervisão humana para IA educacional
- Protocolo de intervenção e contestação de decisões automatizadas
- Checklist de verificação de conformidade de supervisão
- Guia de capacitação de educadores para supervisão de IA
- Fluxograma decisório: "Esta decisão pode ser automatizada?"

## Exemplos
- **HITL (alto risco)**: Sistema de IA sugere nota para redação. Professor deve validar antes do lançamento. Pode aceitar, ajustar ou rejeitar. Todas as decisões são registradas.
- **HOTL (médio risco)**: Chatbot educacional interage com estudantes, oferece explicações e exercícios. Professor monitora conversas periodicamente e intervém quando identifica problemas.

## Limitações
- A supervisão humana pode ser comprometida por sobrecarga de trabalho ou falta de capacitação
- Sistemas complexos podem dificultar a identificação de erros pelo supervisor humano
- O modelo de supervisão precisa ser calibrado para cada contexto — não há solução única

## Dependências
- `ia-educacao-transparencia-explicabilidade` — para que o supervisor entenda o sistema
- `ia-educacao-impacto-algoritmico` — para classificação de riscos
- `ia-educacao-etica` — para princípios de accountability
- `ia-educacao-gestao` — para implementação institucional

## Referências
- BRASIL. MEC. Referencial para Desenvolvimento e Uso Responsáveis de IA na Educação. Brasília: MEC, 2026. — Seção 3.2, 3.2.3
- COMISSÃO EUROPEIA. Ethical guidelines on the use of artificial intelligence (AI) and data in teaching and learning for educators. Luxemburgo: Publicações da UE, 2022.
- U.S. DEPARTMENT OF EDUCATION. Artificial Intelligence and the future of teaching and learning: insights and recommendations. Washington, DC: Department of Education, 2023.
- BANCO MUNDIAL. AI revolution in education: what you need to know. Washington, DC: World Bank Publications, 2024.
- UNESCO. AI and education: guidance for policymakers. Paris: UNESCO, 2021.
- AUSTRALIAN DEPARTMENT OF EDUCATION. Australian Framework for Generative Artificial Intelligence in Schools. Austrália: Commonwealth of Australia, 2023.
- FENG, T. H. et al. From automation to cognition: redefining the roles of educators and generative AI in computing education. In: ACE Conference, 2025.
- SHNEIDERMAN, B. Human-Centered AI. Oxford: Oxford University Press, 2022.
