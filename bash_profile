export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

# For AWS:
export PATH=~/Library/Python/2.7/bin:$PATH

