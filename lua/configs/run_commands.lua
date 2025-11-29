local M = {}
M.unix = {
  c = "gcc -g % -o bin/%< && ./bin/%<",
  python = "python3 %",
  lua = "lua %",
  go = "go run %",
  javascript = "node %",
  cpp = "g++ -g % -o bin/%< && ./bin/%<",
  rust = "cargo run",
}
M.windows = {
  c = "gcc -g % -o bin\\%<.exe && bin\\%<.exe",
  python = "python %",
  lua = "lua %",
  go = "go run %",
  javascript = "node %",
  cpp = "g++ -g % -o bin\\%<.exe && bin\\%<.exe",
  rust = "cargo run",
}
return M
