" Load guard
if ( exists('g:loaded_ctrlp_bore') && g:loaded_ctrlp_bore )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_bore = 1


" Add this extension's settings to g:ctrlp_ext_vars
call add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#bore#init()',
	\ 'accept': 'ctrlp#acceptfile',
	\ 'lname': 'bore',
	\ 'sname': 'bore',
	\ 'type': 'path',
	\ 'enter': 'ctrlp#bore#enter()',
	\ 'exit': 'ctrlp#bore#exit()',
	\ 'opts': 'ctrlp#bore#opts()',
	\ 'sort': 1,
	\ 'specinput': 0,
	\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#bore#init()
	if (exists('g:bore_filelist_file'))
		return readfile(g:bore_filelist_file)
	else
		return ['No filelist loaded.', 'Please run boresln first.']
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#bore#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#bore#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#bore#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#bore#id()
	return s:id
endfunction

" vim:nofen:fdl=0:ts=2:sw=2:sts=2
