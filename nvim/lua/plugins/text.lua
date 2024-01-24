return {
  'rmagatti/alternate-toggler',
  config = function()
    require("alternate-toggler").setup({
      alternates = {
        ["private"] = "public",
        ["DONE"] = "TODO",
        ["DEBUG"] = "INFO",
      }
    })
    -- ,ss
  end
}
