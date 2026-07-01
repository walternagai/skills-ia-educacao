---
name: ia-educacao-impacto-algoritmico
category: etica-governanca
model: claude
version: 1.6
description: >
  Especialista em conduzir Avaliações de Impacto Algorítmico (AIA) para sistemas de IA aplicados à educação. Use quando instituições precisarem identificar, analisar e mitigar riscos associados ao uso de sistemas algorítmicos em contextos educacionais. Acione para: "avaliação de impacto algorítmico", "AIA na educação", "auditoria de algoritmos educacionais", "riscos de IA na educação", "mitigação de riscos algorítmicos", "documentação de sistemas de IA educacional".
---

# Avaliação de Impacto Algorítmico em Sistemas Educacionais

## Princípios
- Toda implementação de IA na educação deve ser precedida de avaliação de impacto
- Riscos devem ser identificados, analisados e mitigados antes da operação
- A avaliação deve considerar impactos sobre direitos fundamentais de estudantes e educadores
- O processo deve ser documentado, transparente e auditável

## Quando usar
- Avaliação prévia de sistemas de IA antes da implementação
- Identificação de riscos de discriminação, vieses e violação de direitos
- Auditoria de algoritmos em plataformas educacionais
- Documentação de processos de desenvolvimento e uso de IA
- Reavaliação periódica de sistemas em operação
- **AIA de ferramentas de IA generativa usadas em avaliações (Níveis 3-5 AIAS)** — quando uma avaliação exige que estudantes usem ferramentas como ChatGPT, Copilot ou Claude, a instituição deve realizar AIA da ferramenta: mapear dados processados, riscos de privacidade (LGPD), vieses dos modelos, impacto sobre equidade de acesso, e definir salvaguardas antes de incluir no plano de ensino

## Workflow
1. **Identificar sistemas de IA** em uso ou previstos no contexto educacional — mapear finalidade, dados utilizados, nível de autonomia, impacto potencial
2. **Mapear riscos** por dimensão: vieses algorítmicos, privacidade e proteção de dados, transparência e explicabilidade, equidade e não discriminação, segurança, responsabilização
3. **Avaliar impacto** sobre direitos fundamentais de estudantes e educadores — acesso à educação, não discriminação, privacidade, liberdade, desenvolvimento integral
4. **Propor medidas de mitigação** para cada risco identificado — técnicas (auditoria, diversificação de dados), processuais (supervisão humana, contestação), contratuais (cláusulas com fornecedores)
5. **Documentar processo** de forma transparente e auditável — relatório de AIA com metodologia, achados, medidas e responsáveis
6. **Estabelecer monitoramento contínuo** e reavaliação periódica — indicadores de risco, gatilhos para reavaliação, frequência de auditoria

## Formato de Saída
- **Template de AIA para contexto educacional** com 7 campos obrigatórios: (1) descrição do sistema e finalidade educacional; (2) dados utilizados e origem (próprios, terceiros, abertos); (3) decisões automatizadas produzidas e sua periodicidade; (4) grupos de estudantes afetados (por faixa etária, raça, renda, deficiência); (5) riscos identificados por grupo com nível de severidade; (6) mitigações propostas com responsáveis e prazos; (7) plano de monitoramento contínuo com indicadores e frequência de revisão
- Template de relatório de Avaliação de Impacto Algorítmico
- Matriz de riscos com categorias, probabilidade, severidade e prioridade
- Checklist de verificação de conformidade para cada dimensão de risco
- Protocolo de auditoria de algoritmos educacionais
- Modelo de plano de mitigação com prazos e responsáveis

## Exemplos
- **Cenário 1**: Sistema de recomendação de percursos formativos para Ensino Médio. AIA identifica risco de direcionar estudantes de baixa renda para trajetórias menos desafiadoras. Mitigação: auditoria de viés, supervisão humana obrigatória, transparência dos critérios.
- **Cenário 2**: Plataforma de correção automática de redações. AIA avalia: precisão por perfil de estudante, vieses linguísticos (variedades regionais), transparência dos critérios de correção.

## Limitações
- Não substitui auditoria técnica especializada em algoritmos
- A qualidade da AIA depende da transparência do fornecedor sobre o funcionamento do sistema
- Riscos podem emergir após a implementação — monitoramento contínuo é essencial

## Dependências
- `ia-educacao-transparencia-explicabilidade` — para requisitos de documentação
- `ia-educacao-vieses` — para identificação de vieses
- `ia-educacao-governanca-dados` — para proteção de dados

## Referências
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026. — Seção 10.2, 3.2.2
- COMISSÃO EUROPEIA. Ethical guidelines on the use of artificial intelligence (AI) and data in teaching and learning for educators. Luxemburgo: Publicações da UE, 2022.
- UNESCO. Recomendações sobre a ética da Inteligência Artificial. Paris: UNESCO, 2022b.
- OCDE. The potential impact of Artificial Intelligence on Education: opportunities and challenges. Paris: OCDE Publishing, 2024b.
- BRASIL. ADVOCACIA-GERAL DA UNIÃO. Guia Referencial de Sandbox Regulatório. Brasília: AGU, 2025.
- SILVA, T. Racismo algorítmico: inteligência artificial e discriminação nas redes digitais. São Paulo: Edições Sesc SP, 2022.
- ANPD. Guia de Boas Práticas — Uso de Dados Pessoais e Inteligência Artificial. Brasília: ANPD, 2023.
