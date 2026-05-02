require("mason").setup()
require("trouble").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = {
    "jsonls",
    "ts_ls",
    "html",
    "cssls",
    "cssmodules_ls",
    "tailwindcss",
    "taplo",
  },
  automatic_enable = true,
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

function go_org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

local function exec_format()
  if vim.bo.filetype == 'go' then
    go_org_imports()
  end
  vim.lsp.buf.format(nil)
end

local function on_attach(_, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_create_augroup('lsp_auto_format', {})
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'lsp_auto_format',
    callback = exec_format
  })
end


local server_opts = {
  on_attach = on_attach,
  capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
}
vim.g.rustaceanvim = {
  server = {
    on_attach=on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    default_settings = {
      ['rust-analyzer'] = {
      },
    },
  }
}
vim.lsp.config("rust-analyzer", {})

vim.lsp.config("*",server_opts)

vim.cmd [[
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
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

vim.api.nvim_create_augroup('lsp_document_highlight', {})
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  group = 'lsp_document_highlight',
  callback = DocumentHighlight
})
vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
  group = 'lsp_document_highlight',
  callback = ClearReferences
})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  experimental = {
    ghost_text = true,
  },
})
