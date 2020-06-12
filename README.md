# dotfiles

GNU stow managed dotfiles.

## HOWTO

From-scratch installation of the dot files and dependencies for
a nice prompt, etc.

```
brew install getantibody/tap/antibody
npm install --global pure-prompt
brew install stow
brew install jenv
git co <repo> .dotfiles
pushd .dotfiles
stow <directory>
popd
```
