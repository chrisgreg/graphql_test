# GqlChat

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Run `mix ecto.create` to create DB
  * Run `mix ecto.reset` to seed database
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

## Example Usage

Visit: https://localhost:4000/api/graphiql

Try the following:
```
query{
  users(id: 1){
    username,
    messages{
      body
    }
  }
}
```
