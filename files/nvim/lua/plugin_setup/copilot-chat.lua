local select = require('CopilotChat.select')

require("CopilotChat").setup({
    auto_insert_mode = true,
    mappings = {
        close = {
            insert = "<ESC>",
        },
    },
    prompts = {
        Explain = {
            prompt = '/COPILOT_EXPLAIN カーソル上のコードの説明を段落をつけて書いてください。',
        },
        Tests = {
            prompt = '/COPILOT_TESTS カーソル上のコードの詳細な単体テスト関数を書いてください。',
        },
        Fix = {
            prompt = '/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。',
        },
        Optimize = {
            prompt = '/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。',
        },
        Docs = {
            prompt = '/COPILOT_REFACTOR 選択したコードのドキュメントを書いてください。ドキュメントをコメントとして追加した元のコードを含むコードブロックで回答してください。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptのJSDoc、Pythonのdocstringsなど）',
        },
        FixDiagnostic = {
            prompt = 'ファイル内の次のような診断上の問題を解決してください：',
            selection = select.diagnostics,
        },
    },
})

function CopilotChatBuffer()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end
vim.api.nvim_create_user_command('Ccq', CopilotChatBuffer, { nargs = 0 })

function ShowCopilotChatActionPrompt()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end
vim.api.nvim_create_user_command('Sccap', ShowCopilotChatActionPrompt, { nargs = 0 })
