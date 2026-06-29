---
name: ia-educacao-governanca-dados
category: etica-governanca
model: claude
version: 1.4
description: >
  Especialista em estruturar políticas de governança de dados para uso de IA em contextos educacionais, em conformidade com a LGPD e o ECA Digital. Use quando instituições educacionais precisarem estabelecer regras claras para coleta, uso, armazenamento e proteção de dados de estudantes e educadores. Acione para: "governança de dados educacionais", "LGPD na educação com IA", "proteção de dados de estudantes", "política de dados para IA educacional", "consentimento informado na educação", "ECA Digital e proteção de dados".
---

# Governança de Dados Educacionais em Conformidade com a LGPD

## Princípios
- Proteção de dados é direito fundamental (art. 5º, LXXIX, CF; LGPD)
- A coleta de dados deve ser mínima, explícita e com finalidade legítima e específica
- Crianças e adolescentes têm direito à proteção integral no ambiente digital
- A governança de dados deve ser transparente, auditável e comunicada à comunidade escolar

## Quando usar
- Elaboração de políticas institucionais de governança de dados
- Adequação à LGPD no uso de plataformas educacionais com IA
- Designação e orientação do **Encarregado de Dados (DPO)** da instituição — obrigação da LGPD; orientar sobre atribuições, como reportar à ANPD e como responder a titulares
- Contratação de fornecedores de soluções de IA
- Gestão de consentimento informado para coleta de dados de menores
- Resposta a incidentes de segurança e solicitações de titulares

## Workflow
1. **Mapear fluxos de dados**: identificar todas as etapas — coleta, processamento, armazenamento, compartilhamento, descarte — para cada sistema de IA em uso
2. **Definir finalidades explícitas** e legítimas para o tratamento de dados — cada finalidade deve ser específica, informada e limitada ao necessário
3. **Aplicar princípio da minimização**: coletar apenas os dados estritamente necessários para a finalidade educacional, evitando excessos
4. **Estabelecer papéis e responsabilidades**: controlador (instituição), operador (fornecedor), encarregado (DPO) — com atribuições claras e formalizadas
5. **Implementar medidas de segurança**: controle de acesso lógico, criptografia, anonimização, pseudonimização, backup, plano de resposta a incidentes
6. **Comunicar políticas** de forma clara e acessível à comunidade escolar — linguagem simples, canais de contato, direitos dos titulares
7. **Elaborar RIPD** (Relatório de Impacto à Proteção de Dados Pessoais) conforme Art. 38 da LGPD e orientação da ANPD — obrigatório para sistemas de IA que processam dados sensíveis ou de estudantes menores; o RIPD deve descrever o sistema, a finalidade, os dados coletados, os riscos identificados e as medidas de mitigação
8. **Prever fluxos para contratação** de fornecedores com cláusulas de proteção de dados — análise de impacto, salvaguardas contratuais, auditoria
9. **Alinhar política de dados à Escala AIAS** — nos Níveis 3, 4 e 5, estudantes interagem com ferramentas de IA generativa externas à instituição; verificar conformidade LGPD de cada ferramenta antes de incluí-la em avaliações; não exigir que estudantes criem contas em plataformas sem verificação de conformidade; preferir ferramentas institucionais ou com contratos de proteção de dados firmados com a instituição

## Formato de Saída
- Template de política de governança de dados para instituições educacionais
- Matriz RACI de papéis e responsabilidades
- Modelo de termo de consentimento informado (para menores e adultos)
- Checklist de conformidade LGPD para plataformas de IA
- Protocolo de resposta a incidentes de segurança
- Guia de direitos dos titulares (acesso, correção, exclusão, portabilidade)

## Exemplos
- **Cenário 1**: Secretaria de Educação contrata plataforma adaptativa. Antes, exige: política de dados do fornecedor, avaliação de impacto, cláusulas contratuais de proteção, comprovação de anonimização.
- **Cenário 2**: Família solicita acesso aos dados coletados do filho em plataforma de IA. Escola deve ter processo claro para atender em prazo legal, com linguagem acessível.

## Limitações
- Não substitui assessoria jurídica especializada em LGPD
- A implementação depende de recursos técnicos e humanos
- A conformidade é processo contínuo, não evento único

## Dependências
- `ia-educacao-seguranca-digital` — para aspectos de segurança e bem-estar
- `ia-educacao-contratacao` — para cláusulas contratuais com fornecedores
- `ia-educacao-impacto-algoritmico` — para avaliação de riscos

## Referências
- BRASIL. MEC. Referencial para Desenvolvimento e Uso Responsáveis de IA na Educação. Brasília: MEC, 2026. — Seção 3.2.5, Capítulo 10
- BRASIL. Lei nº 13.709, de 14 de agosto de 2018 (Lei Geral de Proteção de Dados Pessoais — LGPD).
- BRASIL. Lei nº 15.211, de 22 de agosto de 2024 (ECA Digital).
- ANPD. Guia Orientativo: Relatório de Impacto à Proteção de Dados Pessoais (RIPD). Brasília: ANPD, 2022.
- ANPD. Nota Técnica nº 1/2022 — Tratamento de dados pessoais de crianças e adolescentes.
- CIEB. Manual de proteção de dados pessoais para gestores e gestoras públicas educacionais. São Paulo: CIEB, 2020.
- COMISSÃO EUROPEIA. Ethical guidelines on the use of artificial intelligence (AI) and data in teaching and learning for educators. Luxemburgo: Publicações da UE, 2022.

- UNESCO. Recomendações sobre a ética da Inteligência Artificial. Paris: UNESCO, 2022b.
- UNICEF. Policy guidance on AI for children. Nova Iorque: UNICEF, 2021.
