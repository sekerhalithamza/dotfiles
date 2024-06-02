languages=`echo "golang lua cpp python nodejs nextjs typescript c html css bash zsh tmux" | tr " " "\n"`
utils=`echo "xargs find mv sed awk ls" | tr " " "\n"`

selected=`printf "$languages\n$utils" | fzf`
read -p "query: " query

if printf $languages | grep -qs $selected; then
	tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr " " "+"` & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
