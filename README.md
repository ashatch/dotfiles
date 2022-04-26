# dotfiles

GNU stow managed dotfiles, plus ansible orchestrated installation
of a dev environment.

## HOWTO

From-scratch installation of the dot files and dependencies for
my local machine.

- Install [brew](https://brew.sh).
- Checkout the dotfiles repo: `git clone https://github.com/ashatch/dotfiles.git ~/.dotfiles`
- `brew install ansible`

Then:

```bash
ansible-galaxy install -r ~/.dotfiles/requirements.yml
ansible-playbook ~/.dotfiles/main.yml --ask-become-pass
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

## Also

Note, tags can be supplied to do only part of the playbook:

```
ansible-playbook main.yml -K --tags "asdf,homebrew"
```
