# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Sobre o repositório

Este repositório é um **acervo documental e de skills** para orientar a integração responsável de Inteligência Artificial na Educação, com foco na UNIFEI (Universidade Federal de Itajubá) e alinhado ao Referencial do MEC (2026).

Não há código-fonte, testes ou build system. O conteúdo é composto por:

- **PDFs normativos** — Normas de Graduação da UNIFEI (Resoluções CEPEAd, INs PRG), Norma Disciplinar, Regimentos, PPC do Bacharelado em IA, Referencial MEC para IA na Educação, artigos acadêmicos sobre AIAS
- **Documentos Markdown** — `guia-aias-unifei.md` e `rubrica-tcc-bia.md` são os dois artefatos editáveis principais
- **Skills Claude** (`skills/*/SKILL.md`) — 30 skills temáticas em formato YAML+Markdown para uso no Claude Code

## Arquitetura dos documentos

### Documentos Markdown editáveis

| Arquivo | Propósito |
|---------|-----------|
| `guia-aias-unifei.md` | Guia completo da Escala AIAS adaptada à UNIFEI (5 níveis de uso de IA em avaliações) |
| `rubrica-tcc-bia.md` | Rubrica institucional de avaliação de TCC1 e TCC2 do Bacharelado em IA |

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
| `formacao-docente` | fundamentos, formacao-inicial-docente, planejamento-didatico, aprendizagem-ativa, pensamento-critico |
| `etica-governanca` | etica, governanca-dados, supervisao-humana, transparencia-explicabilidade, vieses, impacto-algoritmico, seguranca-digital, integridade-academica |
| `inclusao-equidade` | acessibilidade-inclusao, equidade-digital, letramento-dados, permanencia |
| `ferramentas-praticas` | avaliacao, personalizacao, sti, ia-desplugada, sandbox, gestao, ecossistema-inovacao, contratacao |

## Uso das skills no Claude Code

As skills deste repositório são **skills locais** do Claude Code. Para instalá-las no ambiente de um usuário:

```bash
# A partir do diretório raiz deste repositório
npx skills add ./skills/<slug-da-skill>

# Exemplo
npx skills add ./skills/ia-educacao-avaliacao
```

Para listar as skills instaladas: `/skills` dentro do Claude Code.  
Cada skill é invocada pelo usuário com `/ia-educacao-<sufixo>` (ex: `/ia-educacao-avaliacao`).

O campo `name` no frontmatter da skill é o identificador canônico — é esse valor que deve ser usado em `Dependências` de outras skills.

## A Escala AIAS e seus 5 níveis

A escala **AIAS (AI Assessment Scale)** — adaptada ao contexto UNIFEI — classifica o nível de uso de IA em avaliações acadêmicas:

| Nível | Nome | Descrição resumida |
|-------|------|--------------------|
| 1 | Sem IA | Nenhum uso de IA permitido |
| 2 | Planejamento | IA apenas para organizar ideias, sem gerar conteúdo avaliativo |
| 3 | Colaboração | IA como ferramenta auxiliar com revisão crítica do estudante |
| 4 | IA Integral | IA gera conteúdo substancial; estudante dirige e valida |
| 5 | Exploração de IA | IA é o objeto de estudo; foco na análise crítica do sistema |

Qualquer referência a esses níveis no repositório usa exatamente esses nomes e números.

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
- A escala AIAS tem 5 níveis fixos (Sem IA → Planejamento → Colaboração → IA Integral → Exploração de IA); não adicionar ou remover níveis sem revisar todos os documentos que os referenciam
- Pesos das rubricas TCC1 e TCC2 são calibrados e devem somar 100%; alterar um peso exige rebalancear os demais
- Skills novas devem seguir a estrutura de frontmatter e seções das existentes; o slug em `Dependências` deve corresponder exatamente ao campo `name` da skill referenciada
