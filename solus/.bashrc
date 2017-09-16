source /usr/share/defaults/etc/profile

# bash extra stuff
eval $(thefuck --alias)
(wal -r -t -n &)

# PS1 customisations
z='\[\e[0m\]' # reset
#arrow=$'\uE0b0'
f3='\[\033[0;36m\]'
f1='\[\033[0;32m\]'

PS1=$f3'-< '$f1'\w '$f3'>\n $ '$z