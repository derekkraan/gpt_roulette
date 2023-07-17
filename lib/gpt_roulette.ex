defmodule GptRoulette do
  @moduledoc """
  Sigil CHATGPT library for interacting with the OpenAI GPT-3 API.
  """

  @base_url "https://api.openai.com"
  @api_key Application.compile_env(:chat_gpt, :api_key)

  defmacro sigil_CHATGPT(string, []) do
    compile_suggestion(String.to_char_list(string))
  end

  defp compile_suggestion(prompt) do
    {:ok, response} = HTTPoison.post(
      "#{@base_url}/v1/engines/davinci-codex/completions",
      %{
        "prompt" => prompt,
        "max_tokens" => 100,
        "temperature" => 0.7
      },
      headers: [
        {"Authorization", "Bearer #{@api_key}"},
        {"Content-Type", "application/json"}
      ]
    )

    result = Jason.decode!(response.body)
    suggestion = result["choices"][0]["text"]
    String.to_existing_atom(suggestion)
  end
end
