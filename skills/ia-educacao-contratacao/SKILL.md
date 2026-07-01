---
name: ia-educacao-contratacao
category: ferramentas-praticas
model: claude
version: 1.5
description: >
  Especialista em estabelecer critérios técnicos, pedagógicos, éticos e legais para contratação e auditoria de plataformas educacionais que incorporam IA. Use quando gestores públicos ou institucionais precisarem selecionar, contratar e auditar soluções de IA para educação. Acione para: "contratação de plataformas educacionais com IA", "licitação de IA para educação", "auditoria de fornecedores de IA educacional", "critérios para seleção de EdTech", "cláusulas contratuais de proteção de dados", "avaliação de plataformas educacionais com IA".
---

# Critérios para Contratação e Auditoria de Plataformas Educacionais com IA

## Princípios
- A contratação deve ser orientada por critérios pedagógicos, não apenas técnicos ou econômicos
- O fornecedor deve demonstrar conformidade com LGPD, ECA Digital e diretrizes do MEC
- A instituição mantém controle sobre os dados — o fornecedor é operador, não controlador
- A auditoria contínua é condição para garantir conformidade e qualidade ao longo do tempo

## Quando usar
- Processos de licitação e contratação de plataformas educacionais com IA
- Auditoria de conformidade de fornecedores com LGPD e diretrizes do MEC
- Avaliação de cláusulas contratuais sobre dados, propriedade intelectual e responsabilidade
- Verificação de transparência e explicabilidade de sistemas contratados
- Renovação ou rescisão de contratos de plataformas educacionais

## Workflow
1. **Definir critérios pedagógicos**: alinhamento curricular, evidências de impacto educacional, adequação etária, acessibilidade, usabilidade pedagógica
2. **Definir critérios técnicos**: interoperabilidade com sistemas existentes, segurança da informação, escalabilidade, disponibilidade, suporte técnico
3. **Definir critérios éticos e legais**: conformidade com LGPD, ECA Digital, transparência, explicabilidade, não discriminação, supervisão humana; quando a plataforma for usada em avaliações dos Níveis 3, 4 ou 5 da escala AIAS, exigir contratualmente: (a) não uso de dados dos estudantes para treinar modelos de terceiros; (b) política de retenção de conversas; (c) transparência sobre a versão e atualização do modelo utilizado; para contratações públicas, aplicar a **Lei 14.133/2021** (nova Lei de Licitações e Contratos Administrativos) — especificar critérios éticos e pedagógicos no edital; o Art. 11 permite inclusão de critérios de sustentabilidade que abrangem proteção de dados e conformidade com LGPD
4. **Exigir documentação**: política de privacidade e proteção de dados, avaliação de impacto algorítmico, termos de uso, relatório de transparência, certificações de segurança
5. **Estabelecer cláusulas contratuais**: responsabilidade por incidentes, propriedade intelectual, confidencialidade, portabilidade de dados, cláusula de saída, proibição de uso secundário de dados
6. **Implementar auditoria contínua**: conformidade legal, desempenho pedagógico, equidade de impacto, satisfação de usuários, atualizações e mudanças no sistema

## Formato de Saída
- Template de RFP (Request for Proposal) para plataformas educacionais com IA
- Scorecard de avaliação de fornecedores com pesos e critérios
- Minuta de cláusulas contratuais de proteção de dados
- **Checklist de due diligence ética para fornecedores de IA educacional**: (1) política de privacidade em português com linguagem clara; (2) localização dos servidores (data residency — dados de estudantes brasileiros armazenados no Brasil ou em país com proteção equivalente); (3) plano de saída/portabilidade de dados ao término do contrato; (4) auditabilidade do algoritmo (acesso a logs e critérios de decisão); (5) conformidade LGPD declarada com indicação do Encarregado de Dados (DPO); (6) compromisso contratual de não usar dados de estudantes para treinar modelos de terceiros
- Checklist de due diligence para contratação
- Protocolo de auditoria periódica de conformidade
- Matriz de riscos contratuais

## Exemplos
- **Cenário 1**: Secretaria de Educação lança licitação para plataforma adaptativa de matemática. RFP exige: evidências de impacto, certificação LGPD, transparência algorítmica, API para portabilidade de dados, cláusula de não uso de dados de alunos para treinamento.
- **Cenário 2**: Auditoria descobre que fornecedor usou dados de estudantes para treinar modelos sem consentimento. Contrato prevê rescisão imediata e multa. Instituição aciona cláusula de saída e migra dados.

## Limitações
- Não substitui assessoria jurídica especializada em licitações e contratos
- A qualidade da auditoria depende do acesso a informações do fornecedor
- Pequenas instituições podem ter poder de negociação limitado

## Dependências
- `ia-educacao-governanca-dados` — para requisitos de proteção de dados
- `ia-educacao-impacto-algoritmico` — para avaliação de riscos
- `ia-educacao-transparencia-explicabilidade` — para exigências de documentação

## Referências
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, 2026. — Desafio 8, Seção 9.2, 10.1
- CIEB. Manual de proteção de dados pessoais para gestores e gestoras públicas educacionais. São Paulo: CIEB, 2020.
- UNESCO. Global education monitoring report 2023: technology in education: a tool on whose terms? Paris: UNESCO, 2023.
- BRASIL. Lei nº 13.709, de 14 de agosto de 2018 (LGPD).
- BRASIL. Lei nº 15.211, de 22 de agosto de 2024 (ECA Digital).
- BRASIL. Lei nº 14.133, de 1º de abril de 2021 — Lei de Licitações e Contratos Administrativos.
- COLONNA, L. Artificial Intelligence in Education (AIED): Towards More Effective Regulation. European Journal of Risk Regulation, 2025.
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024.

- OEdvig. Observatório Educação Vigiada: Mapeamento da plataformização da educação pública superior na África e na América Latina, 2024.
