#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -z "$TMUX" -a "$TERM_PROGRAM" != "vscode" -a "$(tty)" != "/dev/tty1" ] ; then
	echo "executed"
	TERMINAL_EMULATOR="$(basename $(tty))"
	TERMINAL_EMULATOR=${TERMINAL_EMULATOR^^} # Uppercase all letters

	TERMINAL_PROCESS="$(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$))"

	if [ -x "$TERMINAL_PROCESS" ] ; then
		TERMINAL_EMULATOR=$(basename "$TERMINAL_PROCESS")
		TERMINAL_EMULATOR=${TERMINAL_EMULATOR^} # Uppercase first letter
	fi

	for i in $(seq -w 1 100) ; do
		if [ "$i" -eq 001 ] ; then
			SESSION_NAME="$TERMINAL_EMULATOR"
		else
			SESSION_NAME="$TERMINAL_EMULATOR-$i"
		fi

		if (exec tmux new -s "$SESSION_NAME") ; then
			break
		fi
	done
fi

neofetch 

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
