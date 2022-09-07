require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "rust_analyzer", "luaformatter", "jsonls" },
  automatic_installation = true,
})
require("nlspsettings").setup({
  config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
  local_settings_dir = ".nlsp-settings",
  local_settings_root_markers_fallback = { ".git" },
  append_default_schemas = true,
  loader = "json",
})
local global_capabilities = vim.lsp.protocol.make_client_capabilities()
global_capabilities.textDocument.completion.completionItem.snippetSupport = true
require("mason-lspconfig").setup_handlers({
  function(server)
    local opt = {
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.cmd "autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)"
      end,
      capabilities = require("cmp_nvim_lsp").update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
    }
    local lspconfig = require("lspconfig")
    lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
      capabilities = global_capabilities,
    })
    lspconfig[server].setup(opt)
  end,
  ["rust_analyzer"] = function()
    require("rust-tools").setup {}
  end
})

vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua DocumentHighlight()
  autocmd CursorMoved,CursorMovedI * lua ClearReferences()
augroup END
]]

EnableDocumentHilight = true

function DocumentHighlight()
  if EnableDocumentHilight then
    vim.lsp.buf.document_highlight()
  end
end

EnableClearReferences = true
function ClearReferences()
  if EnableClearReferences then
    vim.lsp.buf.clear_references()
  end
end

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})
