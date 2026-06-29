---
name: ia-educacao-vieses
category: etica-governanca
model: claude
version: 1.3
description: >
  Especialista em identificar, prevenir e mitigar vieses algorítmicos em sistemas de IA aplicados à educação. Use quando instituições educacionais precisarem auditar sistemas de IA quanto a discriminação, sub-representação e reprodução de desigualdades. Acione para: "vieses algorítmicos na educação", "discriminação algorítmica", "racismo algorítmico", "sub-representação em dados de IA", "auditoria de vieses em plataformas educacionais", "equidade algorítmica na educação", "diversidade epistêmica em IA".
---

# Prevenção e Mitigação de Vieses Algorítmicos em Contextos Educacionais

## Princípios
- Sistemas de IA podem reproduzir e amplificar desigualdades sociais existentes
- Vieses podem estar presentes em dados, algoritmos, rotulagem e contexto de uso
- A diversidade epistêmica — inclusão de múltiplas perspectivas — é condição para equidade algorítmica
- A mitigação de vieses é processo contínuo, não evento único

## Quando usar
- Auditoria de vieses em plataformas educacionais com IA
- Avaliação de representatividade de dados de treinamento
- Prevenção de discriminação algorítmica contra grupos vulnerabilizados
- Promoção de diversidade epistêmica em sistemas de IA educacional
- Análise de impacto diferenciado de sistemas de IA por grupo
- **Avaliação de risco de viés por nível AIAS** — os Níveis 3, 4 e 5 da escala AIAS expõem os estudantes diretamente ao conteúdo gerado por ferramentas de IA generativa; o docente deve alertar sobre vieses linguísticos (modelos treinados majoritariamente em inglês), culturais (sub-representação da realidade brasileira) e epistêmicos (ausência de perspectivas indígenas, quilombolas e periféricas) nas respostas geradas; nos Níveis 4 e 5, a reflexão crítica sobre vieses dos resultados deve ser critério avaliativo

## Workflow
1. **Mapear fontes de viés**: dados de treinamento (sub-representação, desatualização), rotulagem (vieses dos anotadores), arquitetura do modelo (pressupostos de design), contexto de uso (aplicação fora do escopo previsto)
2. **Avaliar representatividade**: identificar grupos sub-representados nos dados — raça, gênero, região, língua, deficiência, classe socioeconômica, orientação sexual
3. **Identificar impactos**: reprodução de estereótipos, tratamento desigual, epistemicídio (apagamento de saberes), racismo algorítmico, discriminação indireta
4. **Identificar vieses específicos do contexto brasileiro**: (a) **viés racial** — modelos de reconhecimento facial e PLN treinados predominantemente com dados de pessoas brancas têm menor acurácia para pessoas negras e indígenas; (b) **viés regional** — datasets educacionais super-representam Sul/Sudeste, comprometendo sistemas usados no Norte/Nordeste; (c) **viés linguístico** — modelos treinados em português europeu ou inglês não capturam variedades brasileiras regionais nem línguas indígenas; (d) **viés socioeconômico** — dados de plataformas escolares refletem padrões de escolas com maior conectividade
5. **Propor mitigação**: diversificação de bases de dados, auditoria contínua de resultados, equipes de desenvolvimento diversas, testes de equidade, correção de vieses identificados
6. **Monitorar equidade**: indicadores de impacto diferenciado por grupo — comparar resultados, recomendações e erros do sistema entre diferentes perfis de estudantes
7. **Documentar e comunicar**: transparência sobre limitações e vieses conhecidos, relatórios de equidade, canais para reportar discriminação

## Formato de Saída
- Metodologia de auditoria de vieses para sistemas educacionais
- Checklist de verificação de representatividade de dados
- Matriz de fontes de viés × grupos afetados × medidas de mitigação
- Template de relatório de equidade algorítmica
- Guia de indicadores de impacto diferenciado
- Protocolo de resposta a casos de discriminação algorítmica

## Exemplos
- **Cenário 1**: Plataforma de recomendação de leitura sugere livros menos desafiadores para estudantes de escolas públicas. Auditoria revela viés nos dados de treinamento (super-representação de escolas particulares). Mitigação: rebalancear dados, ajustar algoritmo, monitorar recomendações.
- **Cenário 2**: Corretor automático de redações penaliza variedades linguísticas regionais (nordestino, amazônida). Auditoria identifica viés linguístico. Mitigação: incluir redações de diversas regiões no treinamento, calibrar critérios.
- **Cenário 3 (dados reais)**: Estudo Gender Shades (Buolamwini & Gebru, 2018) demonstrou que sistemas comerciais de reconhecimento facial erravam até 34,7% mais para mulheres negras do que para homens brancos. Em escolas brasileiras onde a maioria dos estudantes é parda ou negra, um sistema de ponto eletrônico ou controle de acesso com reconhecimento facial pode gerar erros sistemáticos contra esses grupos, produzindo tanto constrangimento quanto falhas de segurança.

## Limitações
- A auditoria de vieses depende da transparência do sistema (ver skill transparencia-explicabilidade)
- Mitigação completa de vieses é tecnicamente desafiadora e nem sempre possível
- A equidade algorítmica envolve trade-offs e decisões de valor que exigem discussão social

## Dependências
- `ia-educacao-transparencia-explicabilidade` — para acesso a informações do sistema
- `ia-educacao-impacto-algoritmico` — para avaliação de riscos
- `ia-educacao-equidade-digital` — para contexto de desigualdades
- `ia-educacao-etica` — para fundamentos éticos

## Referências
- BRASIL. MEC. Referencial para Desenvolvimento e Uso Responsáveis de IA na Educação. Brasília: MEC, 2026. — Desafio 2, Seção 3.2.2
- SILVA, T. Racismo algorítmico: inteligência artificial e discriminação nas redes digitais. São Paulo: Edições Sesc SP, 2022.
- COMISSÃO EUROPEIA. Ethical guidelines on the use of artificial intelligence (AI) and data in teaching and learning for educators. Luxemburgo: Publicações da UE, 2022.
- OCDE. The potential impact of Artificial Intelligence on Education: opportunities and challenges. Paris: OCDE Publishing, 2024b.
- UNESCO. Recomendações sobre a ética da Inteligência Artificial. Paris: UNESCO, 2022b.
- UNESCO. AI and education: guidance for policymakers. Paris: UNESCO, 2021.
- NEES. Inteligência Artificial Generativa na Educação. Maceió: NEES, 2024.
- PERKINS, M.; FURZE, L.; ROE, J.; MACVAUGH, J. The Artificial Intelligence Assessment Scale (AIAS): A framework for ethical integration of generative AI in educational assessment. Journal of University Teaching and Learning Practice, v. 21, n. 6, 2024.
- UNIFEI. Guia de Implementação da Escala AIAS-UNIFEI. Itajubá: PRG/UNIFEI, 2026. — Seção 10.2 (Vieses e Equidade).
- BUOLAMWINI, J.; GEBRU, T. Gender Shades: Intersectional Accuracy Disparities in Commercial Gender Classification. In: Proceedings of FAT* Conference, 2018.
