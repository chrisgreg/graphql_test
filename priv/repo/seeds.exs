# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GqlChat.Repo.insert!(%GqlChat.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GqlChat.Repo
alias GqlChat.Chat.Message
alias GqlChat.Accounts.User

user_1 = %User{username: "Chris"} |> Repo.insert!()
user_2 = %User{username: "Ken"} |> Repo.insert!()

%Message{body: "First message", user_id: user_1.id} |> Repo.insert!()
%Message{body: "Second message", user_id: user_2.id} |> Repo.insert!()
%Message{body: "Third message", user_id: user_1.id} |> Repo.insert!()
%Message{body: "Fourth message", user_id: user_2.id} |> Repo.insert!()
