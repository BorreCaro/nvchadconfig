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
  c = "gcc -g % -o bin\\%< && bin\\%<.exe",
  python = "python3 %",
  lua = "lua %",
  go = "go run %",
  javascript = "node %",
  cpp = "g++ -g % -o bin\\%< && bin\\%<.exe",
  rust = "cargo run",
}
return M
