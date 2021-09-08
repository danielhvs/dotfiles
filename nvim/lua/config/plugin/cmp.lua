local _2afile_2a = "/home/danielhabib/.config/nvim/fnl/config/plugin/cmp.fnl"
local _1_
do
  local name_4_auto = "config.plugin.cmp"
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
    return {autoload("cmp"), autoload("aniseed.nvim")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {cmp = "cmp", nvim = "aniseed.nvim"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local cmp = _local_4_[1]
local nvim = _local_4_[2]
local _2amodule_2a = _1_
local _2amodule_name_2a = "config.plugin.cmp"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
local cmp_src_menu_items
do
  local v_23_auto = {buffer = "buff", conjure = "conj", nvim_lsp = "lsp"}
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["cmp-src-menu-items"] = v_23_auto
  cmp_src_menu_items = v_23_auto
end
local cmp_srcs
do
  local v_23_auto = {{name = "nvim_lsp"}, {name = "conjure"}, {name = "buffer"}}
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["cmp-srcs"] = v_23_auto
  cmp_srcs = v_23_auto
end
local function _8_(entry, item)
  item.menu = (cmp_src_menu_items[entry.source.name] or "")
  return item
end
return cmp.setup({formatting = {format = _8_}, mapping = {["<C-Space>"] = cmp.mapping.complete(), ["<C-d>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-e>"] = cmp.mapping.close(), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-p>"] = cmp.mapping.select_prev_item(), ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})}, sources = cmp_srcs})