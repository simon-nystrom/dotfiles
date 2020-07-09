# dotfiles

Personal repository showing my mac setup and how to attain it.

## Install development tools
`xcode-select --install`

## Install Homebrew and some packages
`./brew.sh`

## Add zsh as a valid login shell
`echo /usr/local/bin/zsh | sudo tee -a /etc/shells > /dev/null`

## Change the default shell to the new zsh
`chsh -s /usr/local/bin/zsh`

## Clone this repo
`git clone git@github.com:simon-nystrom/dotfiles.git ~/dotfiles`

## Symlink the .zshrc file into the home directory
```
mkdir ~/.zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/prompt.sh ~/.zsh/prompt.sh
ln -s ~/dotfiles/alias.sh ~/.zsh/alias.sh
```

## Setup z command (gets sourced in .zshrc)
```
git clone git@github.com:rupa/z.git
mv ~/z/z.sh /usr/local/bin
```

## Install iTerm2
Dowload iTerm2 from https://www.iterm2.com/ and make the preferences be read from this folder