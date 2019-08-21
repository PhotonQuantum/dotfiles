call plug#begin('~/.local/share/nvim/plugged')    
    
Plug 'unblevable/quick-scope'    
Plug 'PhotonQuantum/suda.vim'    
Plug 'easymotion/vim-easymotion'    
    
call plug#end()    
    
set nu    
set rnu    
nmap H ^    
vmap H ^    
nmap L $    
vmap L $    
nnoremap ZA :w suda://%<Return>:q<Return>    
cmap e!! e suda://%    
cmap r!! e suda://%    
cmap w!! w suda://% 
