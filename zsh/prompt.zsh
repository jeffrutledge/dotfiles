autoload colors && colors

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git symbolic-ref --short HEAD)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git symbolic-ref --short HEAD)%{$reset_color%}"
    fi
  fi
}

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo 'ɣ' && return
  echo '○'
}

export PROMPT='
%{$fg[cyan]%}%n%{$reset_color%} at %{$fg[green]%}%m%{$reset_color%} in %{$fg[yellow]%}$(collapse_pwd)%{$reset_color%} $(git_dirty)
$(prompt_char) '
export RPROMPT='%1(j.%j jobs.)'
