local _2afile_2a = "/home/danielhabib/.config/nvim/fnl/config/plugin.fnl"
local _1_
do
  local name_4_auto = "config.plugin"
  local module_5_auto
  do
    local x_6_auto = _G.package.loaded[name_4_auto]
    if ("table" == type(x_6_auto)) then
      module_5_auto = x_6_auto
    else
      module_5_auto = {}
    end
  end
  module_5_auto["aniseed/module"] = name_4_auto
  module_5_auto["aniseed/locals"] = ((module_5_auto)["aniseed/locals"] or {})
  do end (module_5_auto)["aniseed/local-fns"] = ((module_5_auto)["aniseed/local-fns"] or {})
  do end (_G.package.loaded)[name_4_auto] = module_5_auto
  _1_ = module_5_auto
end
local autoload
local function _3_(...)
  return (require("aniseed.autoload")).autoload(...)
end
autoload = _3_
local function _6_(...)
  local ok_3f_21_auto, val_22_auto = nil, nil
  local function _5_()
    return {autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("packer"), autoload("config.util")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {a = "aniseed.core", nvim = "aniseed.nvim", packer = "packer", util = "config.util"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local nvim = _local_4_[2]
local packer = _local_4_[3]
local util = _local_4_[4]
local _2amodule_2a = _1_
local _2amodule_name_2a = "config.plugin"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
local safe_require_plugin_config
do
  local v_23_auto
  local function safe_require_plugin_config0(name)
    local ok_3f, val_or_err = pcall(require, ("config.plugin." .. name))
    if not ok_3f then
      return print(("config error: " .. val_or_err))
    end
  end
  v_23_auto = safe_require_plugin_config0
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["safe-require-plugin-config"] = v_23_auto
  safe_require_plugin_config = v_23_auto
end
local use
do
  local v_23_auto
  local function use0(...)
    local pkgs = {...}
    local function _9_(use1)
      for i = 1, a.count(pkgs), 2 do
        local name = pkgs[i]
        local opts = pkgs[(i + 1)]
        do
          local _10_ = opts.mod
          if _10_ then
            safe_require_plugin_config(_10_)
          else
          end
        end
        use1(a.assoc(opts, 1, name))
      end
      return nil
    end
    return packer.startup(_9_)
  end
  v_23_auto = use0
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["use"] = v_23_auto
  use = v_23_auto
end
return use("wbthomason/packer.nvim", {}, "Olical/aniseed", {branch = "master"}, "Olical/conjure", {branch = "master", mod = "conjure"}, "nvim-telescope/telescope.nvim", {mod = "telescope", requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}}, "nvim-treesitter/nvim-treesitter", {mod = "treesitter", run = ":TSUpdate"}, "neovim/nvim-lspconfig", {mod = "lspconfig"}, "hrsh7th/nvim-cmp", {mod = "cmp", requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "PaterJason/cmp-conjure"}})