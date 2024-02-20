Application.put_env(:langchain, :openai_key, System.fetch_env!("OPENAI_API_KEY"))
ExUnit.start()
