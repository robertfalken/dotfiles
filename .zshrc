# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/rf/.zsh/completions:"* ]]; then export FPATH="/Users/rf/.zsh/completions:$FPATH"; fi
ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
plugins=(1password git colored-man-pages docker npm nvm sudo zsh-autosuggestions zsh-syntax-highlighting)

source "/Users/rf/.oh-my-zsh/oh-my-zsh.sh"
source "/Users/rf/.config/zsh/aliases"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
eval "$(zoxide init --cmd cd zsh)"

# skhd --start-service
# yabai --start-service
# brew services start sketchybar > /dev/null

unset ZSH_AUTOSUGGEST_USE_ASYNC
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
. "/Users/rf/.deno/env"