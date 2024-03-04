> This place is a message... and part of a system of messages... pay attention to it!
> 
> Sending this message was important to us. We considered ourselves to be a powerful culture.
> 
> This place is not a place of honor... no highly esteemed deed is commemorated here... nothing valued is here.
> 
> What is here was dangerous and repulsive to us. This message is a warning about danger.
> 
> The danger is still present, in your time, as it was in ours. 

# Usage

```elixir
def MyModule do
  import GptRoulette

  ~CHATGPT"""
  a function "add": adds two numbers together
  """
end
```

The above code will result in the function `MyModule.add(a, b)` being defined (maybe!)

# Configuration

GptRoulette depends on LangChain, which expects an api key for OpenAI.

```elixir
config :langchain, :openai_key, System.fetch_env!("OPENAI_API_KEY")
```

# Warning

Do NOT use this library in production.

Why not?

- You can't see the code it generates.
- Your code will change (and potentially break) with every compilation.
- It will break your build if ChatGPT returns invalid Elixir code.
