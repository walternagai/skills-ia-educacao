# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Sobre o repositório

Este repositório é um **acervo documental e de skills** para orientar a integração responsável de Inteligência Artificial na Educação, com foco na UNIFEI (Universidade Federal de Itajubá) e alinhado ao Referencial do MEC (2026).

Não há código-fonte, testes ou build system. O conteúdo é composto por:

- **PDFs normativos** — Normas de Graduação da UNIFEI (Resoluções CEPEAd, INs PRG), Norma Disciplinar, Regimentos, PPC do Bacharelado em IA, Referencial MEC para IA na Educação, artigos acadêmicos sobre AIAS
- **Skills Claude** (`skills/*/SKILL.md`) — 36 skills temáticas em formato YAML+Markdown para uso no Claude Code; o conteúdo do Guia AIAS-UNIFEI e da Rubrica TCC-BIA foi distribuído para as skills relevantes e os arquivos Markdown originais foram removidos

## Arquitetura dos documentos

### Skills (`skills/*/SKILL.md`)

Cada skill tem frontmatter YAML (`name`, `category`, `model`, `version`, `description`) seguido de seções Markdown fixas:
- **Princípios** — posicionamento ético-pedagógico
- **Quando usar** — gatilhos de acionamento
- **Workflow** — passos numerados de raciocínio
- **Formato de Saída** — tipos de artefatos que a skill produz
- **Exemplos** — cenários concretos
- **Limitações** — o que a skill não cobre
- **Dependências** — referências a outras skills por slug (ex: `ia-educacao-etica`)
- **Referências** — bibliografias em formato ABNT

### Categorias de skills

| Categoria | Skills |
|-----------|--------|
| `niveis-ensino` | infantil, basica, ensino-medio, profissional-tecnologica, superior |
| `formacao-docente` | fundamentos, formacao-inicial-docente, planejamento-didatico, planejamento-reverso, aprendizagem-ativa, pensamento-critico, bloom |
| `etica-governanca` | etica, governanca-dados, supervisao-humana, transparencia-explicabilidade, vieses, impacto-algoritmico, seguranca-digital, integridade-academica |
| `inclusao-equidade` | acessibilidade-inclusao, dua, equidade-digital, letramento-dados, permanencia |
| `ferramentas-praticas` | avaliacao, rascunho, verificacao, personalizacao, sti, ia-desplugada, sandbox, gestao, ecossistema-inovacao, contratacao |

## Uso das skills no Claude Code

As skills deste repositório são **skills locais** do Claude Code. Para instalá-las no ambiente de um usuário:

```bash
# Instalar uma skill específica (a partir do diretório raiz)
npx skills add ./skills/ia-educacao-avaliacao

# Instalar todas as skills de uma vez
for d in skills/*/; do npx skills add "./$d"; done
```

Para listar as skills instaladas: `/skills` dentro do Claude Code.  
Cada skill é invocada pelo usuário com `/ia-educacao-<sufixo>` (ex: `/ia-educacao-avaliacao`), com uma exceção: a skill `aias-consultant` é invocada como `/aias-consultant` (sem o prefixo `ia-educacao-`).

O campo `name` no frontmatter da skill é o identificador canônico — é esse valor que deve ser usado em `Dependências` de outras skills.

## A Escala AIAS e seus 5 níveis

A escala **AIAS (AI Assessment Scale)** — adaptada ao contexto UNIFEI — classifica o nível de uso de IA em avaliações acadêmicas. A escala é **não hierárquica** (nenhum nível é superior a outro):

| Nível | Nome canônico | IA permitida | Produto final |
|-------|---------------|-------------|---------------|
| 1 | Sem IA | Nenhuma | Totalmente do estudante |
| 2 | Planejamento Assistido por IA | Ideação e estruturação | Do estudante; IA apenas no processo |
| 3 | Colaboração com IA | Elaboração e refinamento | Do estudante com auxílio de IA |
| 4 | IA Integral | Uso estratégico e abrangente | Dirigido pelo estudante com IA |
| 5 | Exploração de IA | Co-criação e inovação | Co-autoria estudante + IA |

Qualquer referência a esses níveis no repositório usa exatamente esses nomes e números — inclusive nos campos `Workflow` e `Formato de Saída` das skills.

## Referências normativas centrais

Os documentos e skills deste repositório derivam autoridade de:
- **Referencial MEC (2026)** — `REFERENCIAL PARA DESENVOLVIMENTO E USO RESPONSÁVEIS DE INTELIGÊNCIA ARTIFICIAL NA EDUCAÇÃO-pt.pdf`
- **Resolução CEPEAd nº 17/2025** — Norma de Graduação da UNIFEI
- **IN PRG nº 01/2025** — Diretrizes para PPC
- **IN PRG nº 02/2025** — Diretrizes para TCC
- **PPC BIA (maio/2026)** — `ppc_bia_maio_2026.pdf`

## Convenções de edição

- Idioma: **Português do Brasil** em todos os documentos
- Referências bibliográficas: formato **ABNT**
- A escala AIAS tem 5 níveis fixos com os nomes canônicos da tabela acima; não adicionar, remover ou renomear níveis sem revisar todas as skills que os referenciam
- Skills novas devem seguir a estrutura de frontmatter e seções das existentes; o slug em `Dependências` deve corresponder exatamente ao campo `name` da skill referenciada
- A seção `Dependências` de cada skill deve referenciar **somente skills existentes dentro de `skills/`** deste repositório — nunca skills instaladas localmente no ambiente do usuário (ex: `bloom-taxonomy-educator`, `backward-design-stem`, `dua-educator`)
- O campo `name` (slug) das skills deve estar em **Português do Brasil**, ser curto e significativo (ex: `ia-educacao-rascunho`, não `ia-educacao-chain-of-draft`); a descrição no frontmatter e todo o conteúdo interno da skill também devem estar em **Português do Brasil**
- Ao editar uma skill existente, incremente o campo `version` no frontmatter (ex: `1.2` → `1.3`)
- O diretório `raw-pdfs/` está no `.gitignore` — os PDFs normativos não são versionados e precisam ser obtidos diretamente das fontes institucionais
