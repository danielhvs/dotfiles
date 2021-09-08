local _2afile_2a = "/home/danielhabib/.config/nvim/fnl/config/plugin/conjure.fnl"
local _1_
do
  local name_4_auto = "config.plugin.conjure"
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
    return {autoload("aniseed.nvim")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {nvim = "aniseed.nvim"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local nvim = _local_4_[1]
local _2amodule_2a = _1_
local _2amodule_name_2a = "config.plugin.conjure"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
nvim.g["conjure#mapping#doc_word"] = "K"
nvim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
nvim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
return nil