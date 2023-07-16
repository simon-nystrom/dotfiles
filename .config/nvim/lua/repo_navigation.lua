local function is_git_repository()
  local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
  if not handle then
    return false
  end

  local result = handle:read("*a")
  handle:close()

  if result:find("true") then
    return true
  end

  return false
end

local function parse_git_url()
  local handle = io.popen("git remote get-url origin 2>/dev/null")

  if not handle then
    return false
  end

  local git_url = handle:read("*a")
  handle:close()

  local regex = "%w+@(.+):(.*).git"
  local base, path = git_url:match(regex)

  if base and path then
    local url = string.format("https://%s/%s", base, path)
    return url
  else
    return nil
  end
end

local km = vim.keymap.set

if is_git_repository then
  km("n", "<leader>repo", function()
    os.execute("open " .. parse_git_url())
  end)
end
