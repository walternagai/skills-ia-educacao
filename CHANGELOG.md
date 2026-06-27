# Changelog

Todas as mudanças relevantes neste repositório são registradas aqui.
Formato baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/).

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
