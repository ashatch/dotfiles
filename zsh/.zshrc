# .zshrc is for interactive usage, e.g:
#   prompt,
#   command completion,
#   command correction,
#   command suggestion,
#   command highlighting,
#   output coloring,
#   aliases,
#   key bindings,
#   commands history management,
#   other miscellaneous interactive tools (auto_cd, manydots-magic)...

##### HISTORY #####
HISTSIZE=250000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

###### allow commenting out a line interactively ####
setopt INTERACTIVE_COMMENTS

###### directories #####
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

##### completion #####
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'


#### brew #####
export PATH="/usr/local/sbin:$PATH"

###### git ######
autoload -Uz compinit && compinit

###### jenv ######
export PATH="/Users/ashatch/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.2/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

###### nvm ########
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

###### rbenv #######
export PATH="/Users/ashatch/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/usr/local/Cellar/rbenv/1.1.2/libexec/../completions/rbenv.zsh'
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

########## plugin loading #####
# use antibody for plugins, add to the .txt file mentioned below:
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt
compinit -i

#### flutter ####
export PATH="/Users/ashatch/dev/github.com/flutter/bin:${PATH}"


### broot ####
source /Users/ashatch/Library/Preferences/org.dystroy.broot/launcher/bash/br

### prompt ####
PURE_PROMPT_SYMBOL="λ"
export REPORTTIME=10

### aliases ###
alias uuid="uuidgen | tr '[A-Z]' '[a-z]'"
cdiff() {
    code --wait --diff $1 $2
}
