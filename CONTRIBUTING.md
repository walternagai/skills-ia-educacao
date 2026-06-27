# Como Contribuir

Este repositório é um acervo institucional da UNIFEI. Contribuições são bem-vindas por meio de pull requests no GitHub.

## Criando uma nova skill

### 1. Estrutura obrigatória

Crie o diretório e o arquivo:

```
skills/<slug-da-skill>/SKILL.md
```

O `SKILL.md` deve seguir exatamente este template:

```markdown
---
name: <slug-da-skill>
category: <categoria>
model: claude
version: 1.0
description: >
  <Uma ou duas frases que descrevem quando acionar esta skill.
  Inclua termos e frases que o usuário digitaria para ativá-la.>
---

# Título da Skill

## Princípios
- <posicionamento ético-pedagógico em bullets>

## Quando usar
- <gatilhos de acionamento em bullets>

## Workflow
1. **Passo 1**: descrição
2. **Passo 2**: descrição

## Formato de Saída
- <tipos de artefatos que a skill produz>

## Exemplos
- **Cenário 1**: descrição do cenário e do que a skill produz.

## Limitações
- <o que esta skill não cobre>

## Dependências
- `<slug-de-outra-skill>` — motivo da dependência

## Referências
- AUTOR, A. Título. Local: Editora, Ano.
```

### 2. Convenções

- **Idioma**: Português do Brasil em todo o conteúdo
- **Slug**: kebab-case; skills do domínio IA-Educação usam o prefixo `ia-educacao-` (ex: `ia-educacao-avaliacao`)
- **Categoria**: use uma das existentes (`niveis-ensino`, `formacao-docente`, `etica-governanca`, `inclusao-equidade`, `ferramentas-praticas`) ou proponha uma nova no PR
- **Dependências**: o valor em `Dependências` deve corresponder exatamente ao campo `name` no frontmatter da skill referenciada
- **Referências**: formato ABNT
- **Escala AIAS**: qualquer referência aos 5 níveis deve usar os nomes e números definidos em `CLAUDE.md`; não altere os nomes sem revisar todas as skills que os referenciam

### 3. Checklist antes do PR

- [ ] Frontmatter YAML válido (sem tabulações, indentação correta)
- [ ] Todos os campos obrigatórios presentes (`name`, `category`, `model`, `version`, `description`)
- [ ] Todas as seções Markdown presentes (Princípios → Referências)
- [ ] Slugs em `Dependências` verificados contra skills existentes
- [ ] Referências em formato ABNT
- [ ] Skill testada localmente: `npx skills add ./skills/<slug>` sem erro

## Editando uma skill existente

- Atualize o campo `version` no frontmatter (incremento de minor: `1.2` → `1.3`)
- Mantenha a consistência com as demais skills que dependem desta
- Se remover ou renomear um campo `name`, atualize todas as skills que o referenciam em `Dependências`

## Adicionando PDFs normativos

Novos documentos de referência devem ser colocados em `raw-pdfs/` (ignorado pelo git). Documente a fonte no campo `Referências` da(s) skill(s) relevante(s).

## Dúvidas

Abra uma _issue_ no GitHub descrevendo a skill que deseja criar ou a melhoria que propõe.
