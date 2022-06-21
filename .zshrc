export ZSH="/Users/shiwei/.oh-my-zsh"

ZSH_THEME="ys"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions autojump kubectl)

source $ZSH/oh-my-zsh.sh

# Alias
alias ll='ls -al'
alias la='ls -a'

alias tmux='env TERM=xterm-it tmux -2'

# update zsh
alias zshupdate='omz update'

# vim -> neovim
alias vim='nvim'
alias vi='nvim'

export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

# Ruby development
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# k8s
source <(kubectl completion zsh)

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export PATH="$PATH:$(yarn global bin)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
