defmodule GqlChat.Repo do
  use Ecto.Repo,
    otp_app: :gql_chat,
    adapter: Ecto.Adapters.Postgres
end
