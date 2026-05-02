
local fcitx5 = {activated=true}
local fcitx5CommandName = "fcitx5-remote"


function fcitx5:isExecutable()
  return vim.fn.executable(fcitx5CommandName) == 1
end

function fcitx5:isActivated()
  local result = vim.system({fcitx5CommandName}):wait()
  self.activated = result.stdout == "2"
  return self.activated
end

function fcitx5:activate()
  vim.system({fcitx5CommandName,"-o"}):wait()
end

function fcitx5:inactivate()
  vim.system({fcitx5CommandName,"-c"}):wait()
end

function fcitx5:switch()
  vim.system({fcitx5CommandName,"-t"}):wait()
end

function fcitx5:name()
  return "fcitx5"
end


local noImeControl = {}
function noImeControl:isExecutable()
  return true
end
function noImeControl:isActivated()
  return false
end
function noImeControl:activate()
end

function noImeControl:inactivate()
end

function noImeControl:switch()
end

function noImeControl:name()
  return "no ime"
end

ime = fcitx5:isExecutable() and fcitx5 or noImeControl


local activated = ime:isActivated()



vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    local event = vim.v.event
    if event.new_mode == "i" then
      if activated then
        ime:activate()
      else
        ime:inactivate()
      end
    else
      activated = ime:isActivated()
      ime:inactivate()
    end
  end,
})
