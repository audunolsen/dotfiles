#!/bin/zsh

setopt extended_glob

ignoreDirs=(.git)
ignoreFiles=(.DS_Store *.cpp *.md symlink)
ignoreItems=(${ignoreDirs[@]} ${ignoreFiles[@]})

for item in $ignoreItems; do
    if [[ -n "${ignoreDirs[(r)$item]}" ]]; then
        ignore="${ignore}~${item}/*~${item}"
    else
        ignore="${ignore}~${item}"
    fi
done

lnFrom=(); lnTo=()

for file in **/*$~ignore(.N); do
    opts=()

    while read -r line; do opts+=( "$line" ); done < <( ./symlink $file )

    if [[ ${#opts[@]} -eq 0 ]]; then continue; fi

    hide=""; lnPath=""; outFile=""

    for arg in $opts; do
        if [ $arg = "HIDE" ]; then hide="." else lnPath=$arg; fi
    done

    outFile=$hide$file:t

    if [[ -n $lnPath ]] && [ "${lnPath: -1}" != "/" ]; then
        tmp=$lnPath
        lnPath=${tmp%/*}/
        outFile=${tmp##*/}
    fi

    from="$PWD/$file"
    to="$HOME/$lnPath$outFile"
    dir="$HOME/$lnPath"

    mkdir -p "$dir" > /dev/null 2>&1
    ln -sf "${from}" "${to}"
    
    if [ -L $to ]; then
      lnFrom+=( dotfiles/$file )
      lnTo+=( "~"/$lnPath$outFile )
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

# ZSH Modifiers: https://web.cs.elte.hu/local/texinfo/zsh/zsh_23.html