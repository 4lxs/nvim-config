require('config.opts')
require('config.autocmd')

require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)
require('lze').register_handlers(require('lzextras').lsp)
require('plugins')

require('config.keys')
