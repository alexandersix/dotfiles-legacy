#!/bin/bash

languages=`echo "golang php laravel javascript typescript vuejs svelte react lua html css" | tr ' ' '\n'`
coreutils=`echo "xargs rg sed awk ssh tee scp" | tr ' ' '\n'`

selected=`printf "$languages\n$coreutils" | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if printf "$languages" | grep -qs $selected; then
    $query = `echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
