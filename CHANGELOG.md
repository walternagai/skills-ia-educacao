# Changelog

Todas as mudanças relevantes neste repositório são registradas aqui.
Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/).

---

## [0.5.0] — 2026-06-29

### Modificado
- **Categorias padronizadas em 23 skills**: eliminadas as categorias não canônicas `etica-transversal`, `gestao-governanca` e `pratica-pedagogica`; todas as skills agora seguem exatamente as 5 categorias definidas no `CLAUDE.md`
- **Qualidade de 23 skills v1.0**:
  - `ia-educacao-avaliacao-grupo`: integração da Escala AIAS ao workflow de peer assessment (nova seção 7 com tabela AIAS×dimensões); dependência `aias-consultant` adicionada
  - `ia-educacao-bloom`: data de acesso adicionada à referência CHURCHES (2008)
  - `ia-educacao-interdisciplinaridade`: referência BOIX MANSILLA & GARDNER (2003) corrigida para formato ABNT de artigo em periódico
  - 20 skills: cenário de Ensino Médio ou EPT adicionado à seção `Exemplos`, com nível AIAS declarado e contexto brasileiro explícito (ENEM, BNCC, instituições federais/estaduais)
- **Grafo de dependências**: 7 skills sem nenhuma referência inbound conectadas ao ecossistema (`simulacao` ← `tbl`; `visualizacao-dados` ← `letramento-dados`; `estudo-de-caso` ← `facilitacao`; `aprendizagem-ativa` ← `planejamento-didatico`; `interdisciplinaridade` ← `pbl`; `aprendizagem-servico` ← `superior`; `permanencia` ← `gestao`)
- `CLAUDE.md`: propriedade cumulativa da escala AIAS documentada; nota sobre `aias-consultant` (categoria `ferramentas-praticas`, nomenclatura distinta); seção "Verificação de integridade" com comandos de auditoria do grafo

---

## [0.3.1] — 2026-06-29

### Adicionado
- `ia-educacao-rascunho`: raciocínio conciso (Chain of Draft) — geração de rascunhos intermediários mínimos para atividades, prompts de IA e feedback formativo; técnica para evitar over-elaboration
- `ia-educacao-verificacao`: Chain of Verification (CoVe) para docentes validarem materiais, questões de prova, planos de aula e feedbacks gerados com IA antes do uso em sala; protocolo Factored CoVe com tabela de confiabilidade
- `ia-educacao-bloom`: Taxonomia Revisada de Bloom (Anderson & Krathwohl, 2001) + Digital Bloom (Churches, 2008): matriz bidimensional (processo cognitivo × tipo de conhecimento), verbos digitais por nível e alinhamento com AIAS
- `ia-educacao-dua`: Desenho Universal para a Aprendizagem — três princípios (representação, ação/expressão, engajamento) por nível de ensino e por perfil de aprendiz, integrado aos níveis AIAS

### Modificado
- `ia-educacao-rascunho`: renomeada de `ia-educacao-chain-of-draft` para seguir a convenção de nomenclatura em Português do Brasil

---

## [0.4.0] — 2026-06-29

### Adicionado
- `ia-educacao-planejamento-reverso`: Backward Design / Understanding by Design (UbD) — três estágios (resultados → evidências → experiências), integração AIAS no Estágio 2, alinhamento com WHERETO
- `ia-educacao-rubrica`: design de rubricas analíticas, holísticas e single-point alinhadas a Bloom, AIAS e DUA; tabela de descritores por nível AIAS para o critério de uso de IA
- `ia-educacao-feedback`: feedback formativo com IA em escala (Feed Up/Back/Forward); feedback por pares (SPARK/WebPA) e autoavaliação
- `ia-educacao-metacognicao`: aprendizagem autorregulada, diários, wrappers, portfólios reflexivos e uso intencional de IA; tabela AIAS × pergunta metacognitiva
- **11 skills de metodologias ativas para Ensino Superior** (`formacao-docente`): `pbl`, `sala-invertida`, `simulacao`, `estudo-de-caso`, `peer-instruction`, `tbl`, `aprendizagem-servico`, `debate`, `facilitacao`, `design-problema`, `avaliacao-grupo`
- **4 skills para lacunas STHEM** (`ferramentas-praticas`): `pesquisa`, `escrita`, `visualizacao-dados`, `interdisciplinaridade`

### Modificado
- `CLAUDE.md`: seção `Dependências` passa a proibir referências a skills fora deste repositório (ex: `bloom-taxonomy-educator`, `backward-design-stem`)

---

## [0.3.0] — 2026-06-27

### Adicionado
- `README.md` com visão geral, tabela da Escala AIAS-UNIFEI e listagem completa das 31 skills
- `CONTRIBUTING.md` com template de skill e checklist de PR
- `CHANGELOG.md` (este arquivo)
- `.gitignore` excluindo `raw-pdfs/`

### Modificado
- **26 skills atualizadas** com contexto da Escala AIAS-UNIFEI (Perkins et al. 2024/2025):
  conteúdo adicionado nas seções "Quando usar" e/ou "Workflow" com conexão ao nível
  AIAS pertinente; referências Perkins 2024, Perkins 2025 e Guia AIAS-UNIFEI inseridas
  em cada skill atualizada
- `CLAUDE.md`: referências a `guia-aias-unifei.md` e `rubrica-tcc-bia.md` removidas;
  contagem de skills corrigida para 31; nota sobre distribuição do conteúdo

### Removido
- `guia-aias-unifei.md` — conteúdo distribuído para as skills relevantes
- `rubrica-tcc-bia.md` e `rubrica-tcc-bia.xlsx` — conteúdo distribuído para as skills relevantes

---

## [0.2.0] — 2026-06-27

### Adicionado
- Skill `aias-consultant`: consultora especialista na Escala AIAS-UNIFEI para orientar
  docentes no diagnóstico de nível, redesenho de atividades, geração de enunciados e rubricas

### Modificado
- `CLAUDE.md`: corrigido caminho `SKILLS/` → `skills/`; adicionada seção "Uso das skills
  no Claude Code" com comandos `npx skills add`; adicionada tabela AIAS com 5 níveis

---

## [0.1.0] — 2026-06-27

### Adicionado
- Commit inicial do acervo: 30 skills temáticas (`ia-educacao-*`), `guia-aias-unifei.md`,
  `rubrica-tcc-bia.md`, `rubrica-tcc-bia.xlsx`, `CLAUDE.md`
- Repositório privado criado em `github.com/walternagai/skills-ia-educacao`
