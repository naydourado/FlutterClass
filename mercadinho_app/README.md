# Mercadinho App

Aplicativo de mercado desenvolvido em Flutter, com login de usuário, listagem de produtos, carrinho de compras e gestão de produtos para administradores.

## Funcionalidades

- **Login**: autenticação de usuário via API, com identificação de administradores.
- **Home**: listagem de produtos em grade, com opção de adicionar ao carrinho.
- **Carrinho**: controle de quantidade por produto, cálculo do total da compra e envio do pedido.
- **Perfil**: exibição e alteração do email do usuário, além de logout.
- **Gestão** (somente administradores): cadastro, listagem e exclusão de produtos.

## Tecnologias

- [Flutter](https://flutter.dev/)
- [http](https://pub.dev/packages/http) para consumo da API
- [google_fonts](https://pub.dev/packages/google_fonts) (fonte Poppins)

## API

O app consome a API disponível em `https://api-mercadinho-qnkj.onrender.com`, com os seguintes recursos: `/usuarios`, `/produtos` e `/pedidos`.

## Como executar

```
flutter pub get
flutter run
```
