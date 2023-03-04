

" # Close brackets automatically, with return
inoremap {<cr> {<cr>}<C-O><S-O>
inoremap (<cr> (<cr>)<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
" # Close brackets without return
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
" # Two cases below are covered by inoremap <exp>
" inoremap " ""<left>
" inoremap ' ''<left>
" # If you close a bracket that is already closed, it overwrites
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''<left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"<left>"
" # enclose a word in normal mode with "'({[
nnoremap ' mmbi'<esc>ea'<esc>`m<right>
nnoremap " mmbi"<esc>ea"<esc>`m<right>
nnoremap ( mmbi(<esc>ea)<esc>`m<right>
nnoremap { mmbi{<esc>ea}<esc>`m<right>
nnoremap [ mmbi[<esc>ea]<esc>`m<right>
" # enclose a selection in visual mode with "'({[
vnoremap ' <Esc>`<i'<Esc>`>a<right>'<Esc>
vnoremap " <Esc>`<i"<Esc>`>a<right>"<Esc>
vnoremap ( <Esc>`<i(<Esc>`>a<right>)<Esc>
vnoremap { <Esc>`<i{<Esc>`>a<right>}<Esc>
vnoremap [ <Esc>`<i[<Esc>`>a<right>]<Esc>
