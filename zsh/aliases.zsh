alias gamp='/home/jrutledge/safe/personal/developer/python/gamp/bin/gamp'
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
  alias rskbd="xmodmap -e 'clear Lock' && xmodmap -e 'keycode 0x42=Escape'"
  # unloads and reloads apple trackpad driver
  alias rstrackpad="sudo modprobe -r bcm5974 && sudo modprobe bcm5974"
  alias e='nvim'
  alias ls='ls --color=auto'
  # update keyring first
  alias pacman-update-all='sudo pacman -S archlinux-keyring && sudo pacman -Syu && sudo aura -Ayu'
  alias pacman-remove-orphans='pacman -Qtdq | sudo pacman -Rns -'
  if [[ $(vim -h | grep servername) ]]
  then
    alias vim='vim --servername vim' # for vimtex latexmk callbacks
  fi
fi


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
