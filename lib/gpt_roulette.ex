defmodule GptRoulette do
  @moduledoc """
  Sigil CHATGPT library for interacting with the OpenAI GPT-3 API.
  """

  defmacro sigil_CHATGPT({:<<>>, _meta, [prompt]}, _extra) do
    compile_suggestion(prompt)
    |> Code.string_to_quoted!()
  end

  defp compile_suggestion(prompt) do
    llm =
      LangChain.ChatModels.ChatOpenAI.new!(%{
        stream: false,
        model: "gpt-4"
      })

    messages = [
      LangChain.Message.new_system!("""
        Please return only plaintext Elixir code. Omit any markdown syntax. Remove any markdown syntax. The code should compile on its own.

        You are a computer programmer, typing Elixir Code into your text editor. The module has already been defined. The next message will contain a plain text description of the function to be defined. Please return _only_ the text that you will enter into your program.
      """),
      LangChain.Message.new_user!(prompt)
    ]

    chain =
      LangChain.Chains.LLMChain.new!(%{llm: llm, verbose: false})
      |> LangChain.Chains.LLMChain.add_messages(messages)

    {:ok, _chain, %{content: elixir_code}} =
      chain |> LangChain.Chains.LLMChain.run()

    case elixir_code do
      "```elixir" <> rest ->
        String.replace_trailing(rest, "```", "")

      code ->
        code
    end
  end
end
