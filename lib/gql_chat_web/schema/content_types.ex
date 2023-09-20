defmodule GqlChatWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :message do
    field :id, :id
    field :body, :string
    field :author, :user
  end
end
