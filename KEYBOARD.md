
---
starred: ✰
context: None
status: Next
aliases:
  - VIM
  - Obsidian
  - Motions
  - VScode
  - tmux
Tags:
  - Permanent
---

# TMUX
new session - Cb-b
rename session  Cb-,
goto session n - Cb-n
split horizontally - Cb-%
goto split - Cb-left
reload config - Cb-r 


split horizontally C-b %
switch panes: C-b <left>

detach:
tmux detach

ls: list sessions
tmux ls

attach:
tmux attach -t 0


new session:
C-b C

to session n
C-b n

name session
C-b ,


#BROWSERS & OBSIDIAN
- edit url/search - alt-l
- next tab - ctrl-tab
- previous tab -ctrl-shift-tab
- fw history - cmd-left 
- bw history - cmd-right


# gmail
- **compose** c

# Vivaldi
- Page / Focus address field alt-\
- Bookmarks panel alt-u
- History panel alt-i
- Downloads panel alt-o

# Corne
- y/^ u/& i/* o/{ p/} f
- h/! j/@ k/# l/$ 

# VIM Motions
https://vim.rtorr.com/

## horizontal
- f forward
- ; repeat search

- alt k / alt j : move line up or down
- undo: u, redo: ctr-r

- g d open definition (set in keybindings.json)
- ctr-6 > open last file
- Replace: /s/replaceme/tothis. normal mode: n for next hit. "." for replace again
- select all: ggVGii
- to next occurence of word: *
- to previous occurence of word: #
- ident: =
- delete until end of the line: D or $d
- substitute: 
	-  :[range]s/{pattern}/{string}/[flags] [count]
	- eg :%s/Home Improvements/Weekends/g (replace all in file 
	- eg %s/Home Improvements//g (remove all in file)
- to top of page: gg
- close file: C-w q in normal mode
- to bottom of page: G
- pageup: ctr-u (1/2 page)
- pagedown: ctr-d (1/2 page)
