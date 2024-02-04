echo "Email address for git commits?"
read email

echo "Installing Homebrew"
if which brew >/dev/null; then
	echo "Homebrew is already installed"
else
  export BREW_PATH="/opt/homebrew"
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$($BREW_PATH/bin/brew shellenv)"
fi

brew bundle

if [ -d "$HOME/.oh-my-zsh" ]; then
	echo "oh-my-zsh is already installed"
else
	echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! which brew >/dev/null; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

git_clone_unless_exists() {
	if [ -d "$2" ]; then
		echo "$2 already exist"
	else
		echo "Clone $1 to $2"
		git clone $1 $2
	fi
}

git_clone_unless_exists "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
git_clone_unless_exists "https://github.com/zsh-users/zsh-autosuggestions" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
git_clone_unless_exists "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

echo "Installing npm packages"
npm install -g typescript typescript-language-server @tailwindcss/language-server

# Set configuration
echo "Applying settings"
git config --global user.name "robfalken"
git config --global user.email $email
git config --global core.excludesfile ~/.gitignore
git config --global init.defaultBranch main
git config --global core.editor nvim
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Removing all persisted apps from Dock"
defaults write com.apple.dock persistent-apps -array
killall Dock
