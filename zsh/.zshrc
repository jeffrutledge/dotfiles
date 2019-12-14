# temporarily fix systemd bug
# export LC_ALL=en_US.UTF-8

# shortcut to this dotfiles path is $ZSH
export DOTFILES=~/dotfiles

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/**/*.zsh $DOTFILES/**/.*.zsh)
echo $config_files

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

unset config_files
