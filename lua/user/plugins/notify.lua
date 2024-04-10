return {'rcarriga/nvim-notify',
config = function ()
  vim.opt.termguicolors = true
  Notify = require('notify')
  vim.notify = Notify
end
}
