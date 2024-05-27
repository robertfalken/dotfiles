ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
plugins=(git colored-man-pages docker npm nvm sudo zsh-autosuggestions zsh-syntax-highlighting)

source "/Users/rf/.oh-my-zsh/oh-my-zsh.sh"
source "/Users/rf/.config/zsh/aliases"

eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
eval "$(zoxide init --cmd cd zsh)"

# skhd --start-service
# yabai --start-service
# brew services start sketchybar > /dev/null

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$BREW_PATH/opt/nvm/nvm.sh" ] && \. "$BREW_PATH/opt/nvm/nvm.sh"

unset ZSH_AUTOSUGGEST_USE_ASYNC
