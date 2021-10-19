# dotfiles

GNU stow managed dotfiles.

## HOWTO

From-scratch installation of the dot files and dependencies for
a nice prompt, etc.

Follow the [antigen](https://github.com/zsh-users/antigen) insructions.

```
npm install --global pure-prompt
brew install stow
brew install asdf
git co <repo> .dotfiles
pushd .dotfiles
stow <directory>
popd
```
