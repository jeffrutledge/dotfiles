export EDITOR='vim'

# compile with multiple jobs
export MAKEFLAGS='-j'

# ls color for MAC OS X
export CLICOLOR=true

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_LIST_BEEP
setopt CORRECT
setopt IGNORE_EOF
setopt PROMPT_SUBST

setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

setopt COMPLETE_IN_WORD
setopt COMPLETE_ALIASES # don't expand aliases _before_ completion has finished

setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions
setopt EXTENDED_HISTORY # add timestamps to history
setopt APPEND_HISTORY # adds history
setopt HIST_REDUCE_BLANKS

bindkey -v

manual_package_paths=(
  $HOME'/manual_packages/z/z.sh'
  '/usr/share/fzf/completion.zsh'
  '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
)
if [[ "$(uname -s)" == "Linux" ]]
then
  for p in $manual_package_paths
  do
    [[ -a $p ]] && source $p
  done
fi
