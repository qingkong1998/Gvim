" 引用自定义的vundle配置文件,存放vimrc的地方(不是固定写法，可自定义)
" 修改leader键
let mapleader = ','
let g:mapleader = ','

" 开启语法高亮
syntax on
set rtp+=$VIM/vimfiles/bundle/YouCompleteMe
let g:ycm_global_ycm_extra_conf = "C:\.ycm_extra_conf.py"

" 判断操作系统类型
if(has('win32') || has('win64'))
	" ########## Windows系统编码格式 #######################
	" #########确定文件编码格式(Windows系统)#############

		" 设置编码
		set fenc=utf-8
		set encoding=utf-8
		set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
		" 解决菜单乱码
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		" 解决consle输出乱码
		language messages zh_CN.utf-8
		set ambiwidth=double                        " 防止特殊符号无法显示
		set helplang=cn                             " 中文帮助
		" 下面这句只影响普通模式 (非图形界面) 下的 Vim
		set termencoding=utf-8

		" Use Unix as the standard file type
		set ffs=unix,dos,mac

		" 如遇Unicode值大于255的文本，不必等到空格再折行
		set formatoptions+=m
		" 合并两行中文时，不在中间加空格
		set formatoptions+=B

	" ###########使用 vim-plug 管理插件 #######
" install bundles
	if filereadable(expand("$VIM/vimfiles/vimrc.bundles"))
	  source $VIM/vimfiles/vimrc.bundles

     elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
	  source ~/.config/nvim/vimrc.bundles
	endif
        source $VIM/vimfiles/basic_vimrc
        " source $VIM/vimfiles/vimrc
else
	" ###########使用 vim-plug 管理插件 #######
		"" ##################确定文件编码格式(Unix系统)#####################

		"==========================================
		" FileEncode Settings 文件编码,格式
		"==========================================
		" 设置新文件的编码为 UTF-8
		set encoding=utf-8
		" 自动判断编码时，依次尝试以下编码：
		set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
		set helplang=cn
		"set langmenu=zh_CN.UTF-8
		"set enc=2byte-gb18030
		" 下面这句只影响普通模式 (非图形界面) 下的 Vim
		set termencoding=utf-8

		" Use Unix as the standard file type
		set ffs=unix,dos,mac

		" 如遇Unicode值大于255的文本，不必等到空格再折行
		set formatoptions+=m
		" 合并两行中文时，不在中间加空格
		set formatoptions+=B

" install bundles
	if filereadable(expand("~/.vimrc.bundles"))
	  source  ~/.vim/vimrc.bundles
	elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
	  source ~/.config/nvim/vimrc.bundles
	endif

       	source ~/.vim/basic_vimrc
        " source $VIM/vimfiles/vimrc
endif

" ensure ftdetect et al work by including this after the bundle stuff
filetype plugin indent on

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

