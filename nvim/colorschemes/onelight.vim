set termguicolors
syntax on
set t_Co=256
colorscheme one
set background=light

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Comment'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'String'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'String'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Function', 'bg', 'CursorLine'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Function']}


lua << EOF
-- Helper function which, given a Highlight Group and the attribute will
-- return that attribute's value.
-- This is used to fetch the `fg#` value of some highlight groups in order to
-- change the colors used in Lualine for the git diff section.
local fn = vim.fn
local function get_color(group, attr)
  return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

require'lualine'.setup {
  -- Sets lualine's theme to onelight.
  options = { theme = 'onelight' },
  sections = {
    lualine_b = {
      'branch',
      { 'diff', diff_color = {
          added     = { fg = get_color('String', 'fg#')   },
          modified  = { fg = get_color('Type', 'fg#')     },
          removed   = { fg = get_color('Keyword', 'fg#')  },
        }
      },
      'diagnostics'
    },
  }
}
EOF
