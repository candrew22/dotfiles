# ~/.bashrc: executed for interactive shells

unset colorise ls_colours

# Colorise for terminals with >= 256 colours
if command -v tput >/dev/null && [ "$(tput colors)" -ge 256 ]; then
	colorise=1
fi

# Prompt
if [ -n "$colorise" ]; then
	PS1="\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ "
else
	PS1="\u@\h:\w\$ "
fi

# Terminal title
PROMPT_COMMAND='echo -ne "\e]0;${PWD/$HOME/\~}\a"'

# Aliases
alias fzopen='xdg-open "$(fzf)" 2>/dev/null'
alias rl="source ~/.bashrc"

## Colours
if [ -n "$colorise" ]; then
	alias diff="diff --color=auto"
	alias grep="grep --color=auto"
	ls_colours=" --color=auto"
fi

alias ls="ls -F$ls_colours --group-directories-first"
alias ll="ls -l"
alias la="ls -lAh"

alias df="df -h"
alias du="du -h"

# History settings
HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi
