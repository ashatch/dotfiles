# dotfiles

GNU stow managed dotfiles, plus ansible orchestrated installation
of a dev environment.

## HOWTO

From-scratch installation of the dot files and dependencies for
my local machine.


Install [brew](https://brew.sh).

```
brew install ansible
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml --ask-become-pass
```

Note, tags can be supplied to do only part of the playbook:

```
ansible-playbook main.yml -K --tags "asdf,homebrew"
```

Install `pure-prompt`:

```
npm install --global pure-prompt
```

and then

```
git co <repo> .dotfiles
pushd .dotfiles
stow gitconfig
stow zsh
stow asdf
popd
```
