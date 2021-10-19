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
HISTFILESIZE=1000000000
HISTSIZE=1000000000
SAVEHIST=250000
HISTFILE=~/.zsh_history
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

if type brew &>/dev/null; then
  export FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

###### git ######
autoload -Uz compinit && compinit

## gpg
export GPG_TTY=$(tty)

## python / pip
export PATH="/Users/ashatch/Library/Python/2.7/bin:${PATH}"


## asdf

. /usr/local/opt/asdf/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh

########## plugin loading #####
# use antigen for plugins, add to the .txt file mentioned below:
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

### prompt ####
PURE_PROMPT_SYMBOL="λ"
export REPORTTIME=10
autoload -U promptinit; promptinit
prompt pure



### aliases ###
alias uuid="uuidgen | tr '[A-Z]' '[a-z]' | tr -d '\n' | pbcopy"
cdiff() {
    code --wait --diff $1 $2
}

## AWS
export AWS_PROFILE=dev
