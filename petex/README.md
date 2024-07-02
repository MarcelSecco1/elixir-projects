# Petex

Este é um projeto de exemplo chamado **Petex** que utiliza o Ecto para manipulação de banco de dados PostgreSQL com Docker. O objetivo deste projeto é demonstrar como configurar e usar Ecto em uma aplicação Elixir/Phoenix para interagir com um banco de dados PostgreSQL.

## Pré-requisitos

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Elixir](https://elixir-lang.org/install.html)
- [Phoenix Framework](https://hexdocs.pm/phoenix/installation.html)

## Configuração

### Inicie o container:

```
  docker compose up -d
```

### Configure o Ecto em `config/dev.exs`

```
config :petex, Petex.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "petex_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

```

### Instalar as Dependências do Mix

```sh
mix deps.get
```

## Licença

Este projeto está licenciado sob os termos da licença MIT. Veja o arquivo LICENSE para mais detalhes.


