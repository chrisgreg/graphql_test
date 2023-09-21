# GqlChat

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Handled calls

### Fetch conversations for user_id
```gql
query{
  conversations(userId: 1) {
    id
    user_1{
      username
    }
    user_2{
      username
    }
  }
}
```

### Fetch all users
```gql
query{
 	users{
    id
    username
  }
}
```

### Fetch all conversations for a user
```gql
query{
  conversations(userId: 1) {
    id
    user_1{
      username
    }
    user_2{
      username
    }
  }
}
```

### Create new conversation
```gql
mutation{
  createConversation(user_1_id: 1, user_2_id: 2) {
    id
  }
}
```

### Create new message for conversation for user
```gql
mutation {
  createMessage(user_id: 1, conversation_id: 1, body: "This is new!"){
    id
  }
}
```

## Known issues
* Graphiql wants to use camel case for mutations but they won't work if I don't use snake case...
* No auth or checking so you can create a message for any conversation even if you're not part of it