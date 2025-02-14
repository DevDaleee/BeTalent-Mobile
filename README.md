# BeTalent App

Uma aplicação Flutter para gestão e visualização de funcionários. Este app fornece uma interface limpa e intuitiva para visualizar e pesquisar informações de funcionários em plataformas iOS e Android.

## 🚀 Funcionalidades

- Visualização da lista de funcionários com detalhes expansíveis
- Funcionalidade de busca em tempo real em múltiplos campos (nome, cargo, telefone)
- Tratamento específico de endpoints da API por plataforma
- Design responsivo com implementação de tema personalizado
- Exibição de imagem de perfil com avatares circulares
- Formatação de números de telefone e datas
- Sistema de badge para notificações
- Gerenciamento de estados de carregamento

## 📦 Estrutura do Projeto

```
lib/
├── app_widget.dart
├── main.dart
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   └── theme.dart
│   └── utils/
│       └── formatter.dart
├── data/
│   ├── models/
│   │   └── employers.dart
│   └── repositories/
│       └── employes_repository.dart
└── features/
    ├── components/
    │   ├── employe_view.dart
    │   └── employees_list.dart
    ├── view/
    │   └── home_screen.dart
    └── viewmodel/
        └── employees_view_model.dart
```

## 🎨 Tema

A aplicação utiliza um tema personalizado definido em `theme.dart` com a seguinte paleta de cores:

- Azul Primário: `#0029FF`
- Azul Claro: `#E5E9FF`
- Preto Neutro: `#1C1C1C`
- Variantes de Cinza: 
  - Cinza 20: `#B2B2B2`
  - Cinza 10: `#E5E5E5`
  - Cinza 05: `#F2F2F2`
  - Cinza 00: `#FAFAFA`
- Branco Neutro: `#FFFFFF`

## 🔧 Detalhes Técnicos

### Integração com API

O app usa diferentes URLs base para iOS e Android:
- iOS: `http://localhost:3000/`
- Android: `http://10.0.2.2:3000/`

### Modelo de Dados

O `EmployersModel` inclui os seguintes campos:
- `id`: Identificador único
- `name`: Nome do funcionário
- `role`: Cargo/função
- `addmissionDate`: Data de admissão formatada
- `phone`: Número de telefone formatado
- `profileImageUrl`: URL para imagem de perfil

### Utilitários de Formatação

O app inclui utilitários de formatação para:
- Números de telefone: Formato `+XX (XX) XXXXX-XXXX`
- Datas: Formato `dd/MM/yyyy`

## 🏗️ Arquitetura

O projeto segue um padrão de arquitetura limpa com:

1. **Camada de Dados**
   - Modelos para representação de dados
   - Padrão Repository para busca de dados
   - Tratamento de integração com API

2. **Camada de Apresentação**
   - ViewModel para lógica de negócio
   - Componentes para elementos de UI reutilizáveis
   - Telas para implementação da view principal

3. **Core**
   - Constantes para configuração global
   - Utilitários para funcionalidades comuns
   - Definição de tema

## 📱 Componentes de UI

### HomeScreen
- Tela principal com app bar contendo:
  - Avatar do usuário com iniciais
  - Badge de notificação mostrando contagem
- Lista de funcionários com funcionalidade de busca

### EmployeesList
- Lista pesquisável de funcionários
- Cabeçalhos de coluna para foto e nome
- Cards expansíveis de funcionários

### EmployeView
- Card expansível mostrando:
  - Imagem de perfil
  - Nome
  - Visualização expandida com:
    - Cargo
    - Data de admissão
    - Telefone

## 🚦 Gerenciamento de Estado

O app utiliza:
- `StatefulWidget` para gerenciamento de estado local
- `FutureBuilder` para carregamento assíncrono de dados
- `TextEditingController` para funcionalidade de busca

## 🔍 Funcionalidade de Busca

A funcionalidade de busca:
- Filtra em tempo real conforme o usuário digita
- Pesquisa em múltiplos campos:
  - Nome
  - Cargo
  - Telefone
- Atualiza a lista automaticamente
- Trata busca sem distinguir maiúsculas/minúsculas

## ⚡ Considerações de Performance

- Usa construtores `const` onde possível
- Implementa `dispose()` para limpeza de controllers
- Utiliza `NeverScrollableScrollPhysics` para scrolling aninhado
- Renderização eficiente de lista com `ListView.builder`

## 📱 Tratamento Específico por Plataforma

O app detecta automaticamente a plataforma (iOS/Android) e:
- Usa o endpoint apropriado da API
- Mantém UI consistente entre plataformas
- Trata requisitos específicos de rede por plataforma

## 🎯 Tratamento de Erros

O app inclui tratamento de erros para:
- Requisições de rede com tratamento de DioException
- Estados de carregamento de dados
- Dados inválidos ou ausentes
- Detecção de plataforma

## 🔧 Dependências

- `dio`: Para requisições HTTP
- `intl`: Para formatação de data e números
- `flutter_native_splash`: Para tratamento de splash screen
- Widgets core do material design Flutter

## 💫 Começando

1. Certifique-se que o Flutter está instalado e configurado
2. Clone o repositório
3. Execute `flutter pub get` para instalar dependências
4. Certifique-se que seu servidor API está rodando
5. Execute o app usando `flutter run`

## 🤝 Contribuindo

Ao contribuir com este projeto:
1. Siga a estrutura de código existente
2. Mantenha formatação consistente
3. Adicione documentação apropriada
4. Teste em iOS e Android
