## Completion
autoload -U compinit
compinit
#zstyle ':completion:*' menu select
# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## Prompt
autoload -U colors && colors
#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%%{$reset_color%}%% "
#PS1="[%n@%m %1d] $ "
PROMPT="%B%{$fg[blue]%}[%{$fg[red]%}%n@%m %{$fg[blue]%}%1d] $ %b%{$reset_color%}"

## History
export HISTFILE=~/.zsh_history
export HISTSIZE=2000
export SAVEHIST=2000
eval `dircolors -b`

## Directories history.
export DIRSTACKSIZE=10
setopt autopushd pushdminus pushdsilent pushdtohome
alias cdh='dirs -v'

## Options
setopt HIST_IGNORE_ALL_DUPS

## Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias gdic='gdic -f en -t ru'
alias emacs='emacsclient -nw'
alias grep='grep --color=auto'

export EDITOR='emacs -nw'
export PAGER=less

# Use always emacs daemon.
export ALTERNATE_EDITOR=""
# alias emacs='emacsclient -t'

## Hotkeys
case $TERM in
    linux)
        bindkey "^[[2~" yank
        bindkey "^[[3~" delete-char
        bindkey "^[[5~" up-line-or-history
        bindkey "^[[6~" down-line-or-history
        bindkey "^[[1~" beginning-of-line
        bindkey "^[[4~" end-of-line
        bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
        bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
        bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
        bindkey " " magic-space ## do history expansion on space
        ;;

    *rxvt*)
        bindkey "^[[2~" yank
        bindkey "^[[3~" delete-char
        bindkey "^[[5~" up-line-or-history
        bindkey "^[[6~" down-line-or-history
        bindkey "^[[7~" beginning-of-line
        bindkey "^[[8~" end-of-line
        bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
        bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
        bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
        bindkey " " magic-space ## do history expansion on space
        ;;
esac

bindkey "^W" vi-backward-kill-word

# MPD configuration variables.
#export MPD_HOST=server
#export MPD_PORT=6600

#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk
export PATH=$PATH:/home/vchimishuk/bin
export GOROOT=/usr/lib/go
export GOBIN=$GOROOT/bin

# less colors
export LESS_TERMCAP_mb=$'\E[34m'
export LESS_TERMCAP_md=$'\E[34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[32m'

# Some usefull functions.
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf "$1"
                ;;
            *.tar.gz)    tar xzf "$1"
                ;;
            *.bz2)       bunzip2 "$1"
                ;;
            *.rar)       unrar x "$1"
                ;;
            *.gz)        gunzip "$1"
                ;;
            *.tar)       tar xf "$1"
                ;;
            *.tbz2)      tar xjf "$1"
                ;;
            *.tgz)       tar xzf "$1"
                ;;
            *.zip)       unzip "$1"
                ;;
            *.Z)         uncompress "$1"
                ;;
            *.7z)        7z x "$1"
                ;;
            *)           echo "Unsupported archive format."
                ;;
        esac
    else
        echo "extract: $1: Is not a valid archive file."
    fi
}

local _myhosts
if [[ -f $HOME/.ssh/known_hosts ]]; then
  _myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
  zstyle ':completion:*' hosts $_myhosts
fi
