alias reload!='. ~/.zshrc'

##############################################################
# Custom Functions
##############################################################

# Copy and Change Directory
#
# args[in] $1 Target
#      $2 Destination
#
# post: Target copied to destination directory
#   and current directory is destination directory
function cpcd() {
  cp $1 $2
  cd $2
}

# Move and Change Directory
#
# args[in] $1 Target
#      $2 Destination
#
# post: Target moved to destination directory
#   and current directory is destination directory
function mvcd() {
  mv $1 $2
  cd $2
}

##############################################################
# Alias
##############################################################

alias iver3rd='rdesktop -g 97% -P -z -x l -r sound:off -u iver -p i 192.168.1.10:3389'

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
    hdiutil attach ~/gdrive/personal/notes.dmg && cd /Volumes/notes
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

# SSH Server
alias sshRut='ssh jrutledge@65.78.142.195'

# SSH KNUTH
alias knuth='ssh jrutledge@knuth.cs.hmc.edu'

# CS-70 Compile
alias 70clang='clang++ -std=c++11 -pedantic -Wall -Wextra'

# Python
alias py2='python2'
alias py3='python3'

# Murmur
alias start_murmur='~/Desktop/murmur/murmurd'
alias kill_murmur='killall -9 murmurd'
