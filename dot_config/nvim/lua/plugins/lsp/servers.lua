return {
  bashls = {},
  jdtls = {},
  cssls = {},
  clangd = {
    cmd = { "clangd", "--fallback-style=LLVM" },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false -- handled by conform
      vim.bo[bufnr].tabstop = 4
      vim.bo[bufnr].shiftwidth = 4
      vim.bo[bufnr].expandtab = true
    end,
  },

  dockerls = {},
  tsserver = {
    on_attach = function(client, bufnr)
      vim.bo[bufnr].tabstop = 2
      vim.bo[bufnr].shiftwidth = 2
      vim.bo[bufnr].expandtab = true
    end,
  },
  svelte = {},
  eslint = {},
  html = {},
  pyright = {},
  sumneko_lua = {},
  yamlls = {},
  tailwindcss = {},
}
