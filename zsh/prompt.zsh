autoload colors && colors

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '🐙 ' && return
    echo '○'
}

function battery_charge {
    batChargeFile='/Users/JRut/bin/batcharge.py'
    if [ -e "$batChargeFile" ] ; then
        batCharge=`python ~/bin/batcharge.py`
        numEmpty=`expr "$batCharge" : '▹*'`
        numFull=$((10 - $numEmpty / 3))

        colorgreen=%{$fg[green]%}
        coloryellow=%{$fg[yellow]%}
        colorred=%{$fg[red]%}
        colorreset=%{$reset_color%}
        
        if (( $numFull > 6 )) ; then
            outColor=$colorgreen
        elif (( $numFull > 4 )) ; then
            outColor=$coloryellow
        else
            outColor=$colorred
        fi
        echo $outColor $batCharge
    fi
} 

export PROMPT='
%{$fg[cyan]%}%n%{$reset_color%} at %{$fg[green]%}%m%{$reset_color%} in %{$fg[yellow]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)
$(prompt_char) '

set_prompt () {
  export RPROMPT='$(battery_charge)'
}


# export PROMPT=$'\n$(rb_prompt)in $(directory_name) $(git_dirty)$(need_push)\n› '
# set_prompt () {
#   export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
# }

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
