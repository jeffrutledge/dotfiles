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

# mathmatica REPL
alias math='/Applications/Mathematica.app/Contents/MacOS/MathKernel'

# SSH Server
alias sshRut='ssh crut@65.78.142.195'

# SSH KNUTH
alias knuth='ssh jrutledge@knuth.cs.hmc.edu'

# CS-70 Compile
alias 70clang='clang++ -std=c++11 -pedantic -Wall -Wextra'

# Sublime
alias s='subl'
alias sn='subl -n' #new window flag

# Python
alias py2='python2'
alias py3='python3'

# MacVim
alias vim='mvim -v'
alias vi='mvim'

# Skim
alias skim='open -a Skim $1'

# Murmur
alias start_murmur='~/Desktop/murmur/murmurd'
alias kill_murmur='killall -9 murmurd'
