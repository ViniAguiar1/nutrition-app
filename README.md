# Coelho App

Coelho App é um aplicativo desenvolvido para ajudar usuários a organizar sua alimentação, treinos e acompanhamento nutricional. Com uma interface moderna e intuitiva, o app oferece funcionalidades personalizadas para alcançar objetivos de saúde e bem-estar.

## Funcionalidades

- **Onboarding**: Apresentação inicial com informações sobre o app e seus benefícios.
- **Login e Cadastro**: Tela de login com suporte para recuperação de senha e informações para novos usuários.
- **Perfil do Usuário**: Gerencie informações pessoais, configurações e preferências.
- **Configurações**:
  - Alterar senha.
  - Gerenciar notificações.
  - Acessar ajuda e informações sobre o app.
- **Home**:
  - Acesso rápido a funcionalidades como materiais, receitas, chat e prescrições.
  - Plano alimentar semanal com visualização detalhada.
  - Horários pré-agendados com opções de aceitar, desmarcar ou visualizar mais detalhes.
- **Saiba Mais**: Informações sobre Matheus Coelho, a clínica Davirakã e os serviços oferecidos.
- **Outras Funcionalidades**:
  - Materiais educativos.
  - Receitas personalizadas.
  - Chat para suporte e comunicação.
  - Prescrições médicas e nutricionais.

## Paleta de Cores

- **Primária**: `#402819` (Marrom escuro).
- **Secundária**: `#dfccb2` (Bege claro).

## Estrutura do Projeto

O projeto segue uma estrutura modular, com cada funcionalidade implementada em uma tela separada:

- **Onboarding**: `lib/screens/onboarding.dart`
- **Login**: `lib/screens/login.dart`
- **Perfil**: `lib/screens/profile.dart`
- **Home**: `lib/screens/home.dart`
- **Configurações**:
  - Alterar Senha: `lib/screens/change_password.dart`
  - Notificações: `lib/screens/notifications.dart`
  - Ajuda: `lib/screens/help.dart`
  - Sobre o App: `lib/screens/about.dart`
- **Saiba Mais**: `lib/screens/saiba_mais.dart`

## Como Executar

1. Certifique-se de ter o Flutter instalado. Para mais informações, consulte a [documentação oficial do Flutter](https://docs.flutter.dev/get-started/install).
2. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/coelhoapp.git
   ```
3. Navegue até o diretório do projeto:
   ```bash
   cd coelhoapp
   ```
4. Instale as dependências:
   ```bash
   flutter pub get
   ```
5. Execute o aplicativo:
   ```bash
   flutter run
   ```

## Estrutura de Navegação

O app utiliza o `MaterialApp` para gerenciar as rotas. As rotas registradas incluem:

- `/onboarding`: Tela inicial de apresentação.
- `/login`: Tela de login.
- `/client-panel`: Painel principal do cliente.
- `/materiais`: Tela de materiais educativos.
- `/receitas`: Tela de receitas personalizadas.
- `/chat`: Tela de chat.
- `/prescricoes`: Tela de prescrições.
- `/weekly-meal-plan`: Tela de plano alimentar semanal.
- `/saiba-mais`: Tela de informações sobre Matheus Coelho e a clínica Davirakã.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

## Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.

## Contato

Para dúvidas ou suporte, entre em contato:

- **E-mail**: suporte@coelhoapp.com
- **Telefone**: +55 11 99999-9999
