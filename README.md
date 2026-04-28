# 1. Introdução

## 1.1 Propósito

Este documento especifica os requisitos para o desenvolvimento de um aplicativo
Flutter para controle de hábitos sustentáveis, permitindo que usuários
acompanhem ações ecológicas do dia a dia, como economia de água, separação de
resíduos, uso de transporte sustentável e consumo consciente.

## 1.2 Escopo

O aplicativo permitirá registrar ações ecológicas, acompanhar metas semanais e
visualizar um resumo do impacto positivo gerado pelo usuário. O sistema não
abrange gestão ambiental corporativa nem requer conexão com internet.

## 1.3 Definições

| Termo | Definição |
|---|---|
| Hábito sustentável | Ação ecológica registrada pelo usuário no aplicativo |
| Provider | Pacote Flutter para gerenciamento de estado global |
| Dashboard | Tela de resumo visual com métricas e progresso do usuário |
| Meta semanal | Objetivo de quantidade de hábitos a serem concluídos na semana |

## 1.4 Referências

- ISO/IEC/IEEE 29148:2018 — Systems and software engineering: Requirements engineering
- Flutter Documentation: https://docs.flutter.dev
- Pacote Provider: https://pub.dev/packages/provider

## 1.5 Visão Geral

Este documento está organizado em três seções. A Seção 1 apresenta o contexto
e propósito do projeto. A Seção 2 descreve o produto de forma geral. A Seção 3
especifica os requisitos funcionais e não funcionais.

---

# 2. Descrição Geral

## 2.1 Perspectiva do Produto

O aplicativo é um sistema móvel independente desenvolvido em Flutter para
Android 8.0+. O gerenciamento de estado é feito com o pacote Provider, sem
necessidade de conexão com internet ou backend externo.

## 2.2 Funções do Produto

- Apresentação do aplicativo na tela inicial
- Registro e acompanhamento de hábitos sustentáveis pendentes e concluídos
- Visualização de métricas e progresso no Dashboard
- Configuração de preferências do usuário

## 2.3 Características dos Usuários

Usuário comum com familiaridade básica com smartphones, sem conhecimento
técnico em tecnologia ambiental.

## 2.4 Restrições

- O aplicativo deve funcionar em Android 8.0+
- Não requer conexão com internet
- O gerenciamento de estado deve ser feito exclusivamente com o Provider
- O tempo de resposta das telas não deve ultrapassar 2 segundos

## 2.5 Suposições e Dependências

- O usuário possui smartphone Android
- O pacote Provider estará disponível via pub.dev

---

# 3. Requisitos Específicos

## 3.1 Requisitos Funcionais (RF)

### Tela Inicial

| ID | Descrição | Prioridade |
|---|---|---|
| RF-001 | O sistema deve exibir o nome do aplicativo na tela inicial | Alta |
| RF-002 | O sistema deve exibir uma breve descrição da proposta do app | Média |
| RF-003 | A tela inicial deve conter uma imagem ou ícone relacionado à sustentabilidade | Alta |
| RF-004 | A tela inicial deve conter um botão para acessar a aplicação | Alta |
| RF-005 | O sistema deve permitir uma simulação de login simples (opcional) | Baixa |

### Tela de Hábitos Sustentáveis

| ID | Descrição | Prioridade |
|---|---|---|
| RF-006 | A AppBar deve exibir o título do aplicativo, ícone de notificações e indicador de progresso | Alta |
| RF-007 | O Drawer deve conter links para: Dashboard, Hábitos, Configurações e Ajuda | Alta |
| RF-008 | O BottomNavigationBar deve conter ao menos 3 opções: Dashboard, Hábitos e Inicio | Alta |
| RF-009 | A troca de tela pelo BottomNavigationBar deve ser controlada via Provider | Alta |
| RF-010 | A aba Pendentes deve exibir em ListView os hábitos ainda não realizados | Média |
| RF-011 | Cada hábito pendente deve possuir um botão para marcar como concluído | Alta |
| RF-012 | Ao marcar como concluído, o hábito deve ser movido para a lista de Concluídos via Provider | Alta |

---

## 3.2 Requisitos Não Funcionais (RNF)

### Organização e Código

| ID | Descrição | Categoria | Prioridade |
|---|---|---|---|
| RNF-001 | O projeto deve ser organizado em pastas separadas para telas, widgets, models e providers | Manutenibilidade | Alta |
| RNF-002 | O código deve conter nomes claros para classes, variáveis e métodos | Manutenibilidade | Alta |
| RNF-003 | O código deve conter comentários explicativos nos principais trechos | Manutenibilidade | Média |

### Gerenciamento de Estado

| ID | Descrição | Categoria | Prioridade |
|---|---|---|---|
| RNF-005 | O pacote Provider deve ser utilizado para gerenciamento de estado global | Arquitetura | Alta |
| RNF-006 | O Provider deve armazenar e controlar: lista de hábitos pendentes, lista de hábitos concluídos, tela selecionada no BottomNavigationBar e dados do Dashboard | Arquitetura | Alta |
| RNF-007 | O tema claro/escuro deve ser controlado via Provider (opcional) | Arquitetura | Baixa |

# 4. Ademais

Link para o protótipo de média fidelidade no figma: https://www.figma.com/design/BFGWr9HBL0ezb9KSczAy0s/EcoTrack?node-id=0-1&p=f&t=d7WGeuuxEgThOjn9-0
