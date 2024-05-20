#!/bin/bash

directories=""

for dir in ~/Projects/*/; do
	directories="$directories\n$dir"
done

path=`printf "$directories" | fzf`

pathname=$(basename $path)


if tmux has-session -t $pathname; then
	if [ -n "$TMUX" ]; then	
		tmux switch-client -t	$pathname":"
	else
		tmux attach -t $pathname
	fi
else
	if [ -n "$TMUX" ]; then
		tmux new-session -ds $pathname -c $path
		tmux switch-client -t $pathname
	else
		tmux new-session -s $pathname -c $path
	fi
fi
