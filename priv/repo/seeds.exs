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

connor = %User{username: "Connor"} |> Repo.insert!()
rohan = %User{username: "Rohan"} |> Repo.insert!()
ken = %User{username: "Ken"} |> Repo.insert!()
sara = %User{username: "Sara"} |> Repo.insert!()

conor_rohan = GqlChat.Conversations.new_conversation(%{user_1_id: connor.id, user_2_id: rohan.id})
rohan_ken = GqlChat.Conversations.new_conversation(%{user_1_id: rohan.id, user_2_id: ken.id})
ken_sara = GqlChat.Conversations.new_conversation(%{user_1_id: ken.id, user_2_id: sara.id})

%Message{body: "Whoa, I love Svelte!", user_id: connor.id, conversation_id: conor_rohan.id}
|> Repo.insert!()

%Message{body: "React 4eva <3", user_id: rohan.id, conversation_id: conor_rohan.id}
|> Repo.insert!()

%Message{body: "Design is the best", user_id: ken.id, conversation_id: ken_sara.id}
|> Repo.insert!()

%Message{body: "I love colours and mayonaise", user_id: sara.id, conversation_id: ken_sara.id}
|> Repo.insert!()

%Message{body: "Moar accessibility!", user_id: ken.id, conversation_id: rohan_ken.id}
|> Repo.insert!()

%Message{body: "😭", user_id: rohan.id, conversation_id: rohan_ken.id}
|> Repo.insert!()
