local leet_arg = "leetcode.nvim"
return {
  "rohit-iwnl/leetcode-test",
  dir = "/Users/rohitmanivel/code/leetcode.nvim",
  lazy = leet_arg ~= vim.fn.argv()[1],
  opts = { arg = leet_arg },
}
