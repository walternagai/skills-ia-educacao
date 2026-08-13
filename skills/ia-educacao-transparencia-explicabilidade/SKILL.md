---
name: ia-educacao-transparencia-explicabilidade
category: etica-governanca
model: any
version: 1.9
description: >
  Especialista em orientar instituições educacionais sobre requisitos de transparência e explicabilidade de sistemas de IA. Use quando for necessário avaliar se ferramentas de IA atendem a padrões mínimos de clareza sobre seu funcionamento, dados utilizados e critérios de decisão. Acione para: "transparência em IA educacional", "explicabilidade de sistemas de IA", "caixa-preta na educação", "sistemas de IA interpretáveis", "comunicação sobre IA para comunidade escolar", "contestação de decisões automatizadas na educação".
---

# Transparência e Explicabilidade de Sistemas de IA na Educação

## Princípios
- Transparência é clareza sobre características gerais do sistema; explicabilidade é compreensão de resultados específicos
- O nível de transparência exigido deve ser proporcional ao risco e impacto da aplicação
- A comunidade escolar tem direito a informações claras e acessíveis sobre sistemas de IA em uso
- Decisões de alto impacto devem ser passíveis de contestação e revisão humana

## Quando usar
- Avaliação de transparência de plataformas educacionais com IA
- Exigência de explicabilidade em sistemas de avaliação e recomendação
- Comunicação com comunidade escolar sobre funcionamento de sistemas de IA
- Definição de níveis proporcionais de transparência conforme o risco
- Garantia de direito de contestação de decisões automatizadas
- **Adoção da Escala AIAS como mecanismo de transparência preventiva** — declarar o nível de uso de IA antes de cada atividade avaliativa é a forma mais direta de transparência pedagógica; elimina ambiguidades, reduz conflitos de integridade acadêmica e cria base para diálogo aberto entre docentes e estudantes sobre o papel da IA em cada tarefa; alinhado ao princípio de transparência do Referencial MEC (2026) e às normas institucionais de graduação vigentes

## Workflow
1. **Distinguir transparência** (clareza sobre características gerais: propósito, funcionalidades, dados usados, limitações) de **explicabilidade** (compreensão de resultados específicos: por que o sistema produziu determinada resposta, recomendação ou decisão)
2. **Avaliar nível de opacidade** do sistema — "caixa-preta" (totalmente opaco), "caixa-cinza" (parcialmente interpretável), "caixa-branca" (totalmente interpretável)
3. **Definir requisitos proporcionais** ao contexto de uso e riscos potenciais — aplicações de alto impacto (avaliação, progressão, alocação) exigem níveis mais elevados de transparência e explicabilidade
4. **Exigir documentação**: finalidade educacional, funcionalidades, dados utilizados, limitações conhecidas, política de privacidade, termos de uso, responsabilidades
5. **Comunicar em versões diferenciadas por público**:
   - **Versão técnica** para gestores e fornecedores — arquitetura, dados utilizados, métricas de equidade, conformidade LGPD
   - **Versão pedagógica** para docentes — o que o sistema recomenda, com que base, quais são as limitações práticas
   - **Carta de transparência para famílias** — linguagem não técnica explicando "o que o sistema de IA da escola faz com os dados do seu filho/filha", canal de contato e direito de acesso/correção/exclusão de dados (Art. 18 LGPD)
6. **Garantir possibilidade de contestação** de decisões automatizadas — procedimento claro, canal de recurso, revisão humana, prazo de resposta

## Formato de Saída
- Checklist de transparência para avaliação de sistemas de IA
- Template de documento de informações ao usuário (linguagem acessível)
- Guia de níveis de explicabilidade por tipo de aplicação
- Modelo de procedimento de contestação de decisões automatizadas
- Modelo de carta de transparência para famílias — "o que o sistema de IA da escola faz com os dados do seu filho" (linguagem não técnica)
- Matriz de proporcionalidade: risco × nível de transparência exigido

## Exemplos
- **Cenário 1**: Plataforma de IA recomenda que estudante mude de turma com base em desempenho. Escola deve: (a) comunicar critérios da recomendação; (b) explicar por que a recomendação foi feita; (c) oferecer canal para contestação com revisão humana.
- **Cenário 2**: Fornecedor afirma que sistema é "caixa-preta" e não pode explicar resultados. Instituição deve exigir documentação mínima e, se não for possível, reavaliar a adoção.

## Limitações
- Sistemas complexos (redes neurais profundas) têm limitações técnicas de explicabilidade
- Exigir explicabilidade total pode inviabilizar o uso de certos sistemas — avaliar custo-benefício
- A comunicação eficaz requer adaptação a diferentes níveis de letramento digital

## Dependências
- `ia-educacao-impacto-algoritmico` — para avaliação de riscos
- `ia-educacao-contratacao` — para exigências contratuais de transparência
- `ia-educacao-etica` — para princípios de accountability

## Referências
- BRASIL. Ministério da Educação. Referencial para Desenvolvimento e Uso Responsáveis de Inteligência Artificial na Educação. Brasília: MEC, fev. 2026. — Seção 3.2.4, Desafio 1
- COMISSÃO EUROPEIA. Ethical guidelines on the use of artificial intelligence (AI) and data in teaching and learning for educators. Luxemburgo: Publicações da UE, 2022.
- UNESCO. UNESCO's guidance on generative AI in education and research. Paris: UNESCO, 2023.
- U.S. DEPARTMENT OF EDUCATION. Artificial Intelligence and the future of teaching and learning: insights and recommendations. Washington, DC: Department of Education, 2023.
- AUSTRALIAN DEPARTMENT OF EDUCATION. Australian Framework for Generative Artificial Intelligence in Schools. Austrália: Commonwealth of Australia, 2023.
- ALMEIDA, L. P. C. M. et al. Carta de Recomendação para o Uso da Inteligência Artificial na Educação. São Paulo: Nelpa, 2025.
- BRASIL. Lei nº 13.709, de 14 de agosto de 2018 (LGPD) — Art. 20: Direito à revisão de decisões tomadas unicamente com base em tratamento automatizado de dados pessoais.
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024. Disponível em: https://doi.org/10.53761/q3azde36. Acesso em: 30 jun. 2026.
