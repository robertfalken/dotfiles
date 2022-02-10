# Set up new computer

```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare git@github.com:robfalken/.dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```

## Download

### From web

- [Postico](https://eggerapps.at/postico/)
- [1Password](https://1password.com/downloads/mac/)

### From App Store

- Magnet
- Omnifocus

## Preferences

### Trackpad

- max speed
- Tap to click

### Keyboard

- Key repeat fast
- Key delay short
- Add US English
- Turn off all shortcuts
- Map caps lock to ctrl

#### Shared preferences folder

`~/Library/Mobile Documents/com~apple~CloudDocs/configuration`

- Alfred
