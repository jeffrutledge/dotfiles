alias iver3rd='rdesktop -g 97% -P -z -x l -r sound:off -u iver -p i 192.168.1.10:3389'

# SSH KNUTH
alias knuth='ssh jrutledge@knuth.cs.hmc.edu'

# Python
alias py2='python2'
alias py3='python3'

# Suffix
alias -s pdf='pdf-open'

# Linux Exclusive aliases
if [[ "$(uname -s)" == "Linux" ]]
then
  alias userpermmount='sudo mount -ouser,umask=0000'
  alias e='emacsclient -nc'
  alias ls='ls --color=auto'
  alias rswifi='connmanctl disable wifi && sleep 0.1 && connmanctl enable wifi'
fi

# alias vim='vim --servername vim' # for vimtex latexmk callbacks

# Mac OSX Exclusive aliases
if [[ "$(uname -s)" == "Darwin" ]]
then
  # MacVim
  alias vim='mvim -v'
  alias vi='mvim'

  # Skim
  alias skim='open -a Skim $1'

  # mathmatica REPL
  alias math='/Applications/Mathematica.app/Contents/MacOS/MathKernel'

  # Personal
  # Open and close notes
  function onotes() {
    hdiutil attach ~/safe/personal/notes.dmg && cd /Volumes/notes
  }
  function qnotes() {
    cd ~
    local disk_name=$(hdiutil info | grep /Volumes/notes | cut -f1)
    hdiutil detach $disk_name
  }
  # Create a new journal entry
  function new_journal_entry() {
    if onotes; then
      echo '\n##'$(date +"%Y-%m-%d %H:%M")'\n' >> journal.md
      vim -c 'startinsert' + journal.md
      qnotes
    fi
  }
  alias nje=new_journal_entry
fi
