# Random User App

Random User App, trata-se um Aplicativo feito em Flutter que consome a API pública [Random User API](https://randomuser.me/).
E tem como objetivo exibir informações de usuários aleatórios. Permitindo salvar usuários localmente usando Hive e gerenciar os dados persistidos.
---
## Tecnologias e Pacotes Usados

- Flutter & Dart – desenvolvimento mobile multiplataforma.
- MobX – gerenciamento de estado reativo (MVVM).
- Hive – persistência local.
- http – para consumo da API.
- build_runner – geração de código (MobX).
- observer – para atualizar a UI automaticamente com MobX.
---
## Funcionalidades

### Tela Inicial
- Faz requisições à API para obter usuários aleatórios.
- A cada 5 segundos, uma nova pessoa é carregada e adicionada à lista usando Ticker.
- Cada item da lista é clicável e leva à tela de detalhes.
- Possui botão com ícone de database que redireciona para os usuários persistidos.
- Possui um botão que apaga todo o banco de dados HIVE.

### Tela de Detalhes
- Exibe todas as informações do usuário selecionado, organizadas por grupos.
- Possui botão para salvar ou remover o usuário nos persistidos.

### Tela de Usuários Persistidos
- Exibe todos os usuários salvos localmente.
- Permite acessar detalhes de cada usuário.
- Permite remover usuários diretamente da lista persistida.

---

## Como Rodar

### Pré-requisitos
- Flutter >= 3.x
- Dart >= 3.x
- Android Studio ou VS Code com suporte a Flutter
- JDK 17 (para compilação Android)

### Passos
1. Clone o repositório:
 - git clone <https://github.com/EduardoGhost/random_user_app>
