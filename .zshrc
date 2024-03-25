# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$BREW_PATH/opt/nvm/nvm.sh" ] && \. "$BREW_PATH/opt/nvm/nvm.sh"

ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
plugins=(git colored-man-pages docker npm nvm sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source "/Users/rf/.config/zsh/aliases"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
eval "$(zoxide init --cmd cd zsh)"

# powerlevel10k - To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

skhd --start-service
yabai --start-service
brew services start sketchybar > /dev/null

unset ZSH_AUTOSUGGEST_USE_ASYNC
