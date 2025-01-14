return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- for windows ]]
    opts = {
      provider = "groq",
      vendors = {
        ---@type AvanteProvider
        groq = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1/",
          model = "llama-3.1-70b-versatile",
        },
        ---@type AvanteProvider
        perplexity = {
          __inherited_from = "openai",
          api_key_name = "cmd:bw get notes perplexity-api-key",
          endpoint = "https://api.perplexity.ai",
          model = "llama-3.1-sonar-large-128k-online",
        },
        ---@type AvanteProvider
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
        },
        ---@type AvanteProvider
        qianwen = {
          __inherited_from = "openai",
          api_key_name = "DASHSCOPE_API_KEY",
          endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
          model = "qwen-coder-plus-latest",
        },
        ---@type AvanteProvider
        ollama = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "qwen2.5-coder:1.5b",
        }
      },
    },
    provider = "groq",
  },
}
