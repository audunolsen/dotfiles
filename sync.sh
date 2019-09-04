#!/bin/zsh

setopt extended_glob


ignoreDirs=(.git)
ignoreFiles=(.DS_Store *.cpp *.md symlink)
ignoreItems=(${ignoreDirs[@]} ${ignoreFiles[@]});

for item in $ignoreItems; do
    if [[ -n "${ignoreDirs[(r)$item]}" ]]; then
        ignore="${ignore}~${item}/*~${item}"
    else
        ignore="${ignore}~${item}"
    fi
done

lnFrom=(); lnTo=()

for f in **/*$~ignore(.N); do

    lnOpts=()
    while read -r line; do lnOpts+=( "$line" ); done < <( ./symlink $f )

    if [ -z "$lnOpts" ]; then continue; fi

    lnOpts=("${lnOpts[@]:1}")

    hide=""; lnPath=""

    for arg in $lnOpts; do
        if [ $arg = "HIDE" ]; then hide="." else lnPath=$arg; fi
    done

    if [[ -n $lnPath ]] && [ "${lnPath: -1}" != "/" ]; then path="$lnPath/"; fi

    from=$HOME/dotfiles/$f
    to=$HOME/$lnPath$hide$f:t

    ln -sf $from $to

    if [ -L $to ]; then
      lnFrom+=( dotfiles/$f ); lnTo+=( "~"/$lnPath$hide$f:t )
    fi


done

longestStrInArr() { # Call "longestStrInArr <result-var> <array>"
  local m=0
  local firstArg=$1

  shift
  local arr=("$@")

  for str in "${arr[@]}"; do
    if (( ${#str} > $m )); then m=${#str}; fi
  done
  eval "$firstArg='$m'"
}

padding=0; longestStrInArr padding "${lnFrom[@]}"
((padding+=2))


printf "\n"

for i in {1..${#lnFrom[@]}}; do

    printf "% ${padding}s  \e[1;32m>\e[0m  %s\n"\
           "${lnFrom[$i]}"\
           "${lnTo[$i]}"

done

printf "\n"
