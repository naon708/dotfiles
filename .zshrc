# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 色を使用
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# shell接頭辞
export export PS1="naon708 %1~ %# "

# rbenv設定
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

# export PATH=$HOME/.rbenv/shims:$PATH
# if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# nodenv設定
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# goenv設定
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"

# ****************************************************************
# ターミナルでgitのブランチ名を表示&補完【git-prompt / git-completion】
# https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d
# ****************************************************************
# git-promptの読み込み
# source ~/.zsh/git-prompt.sh

# プロンプトのオプション表示設定
# GIT_PS1_SHOWDIRTYSTATE=true

# プロンプトの表示設定
# setopt PROMPT_SUBST ; PS1="naon708 %1~ %# %F{magenta}$(__git_ps1 "[%s]")%f "

alias ll="ls -la"
alias ls="ls -GF"
alias gls="gls --color"
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Change language
# export LANG=en_US
export LANG=ja_JP.UTF-8

# 消音
setopt no_beep
# cd履歴を自動でスタックする
setopt auto_pushd
# cd履歴の重複を削除
setopt pushd_ignore_dups
# コマンド履歴の重複を削除
setopt hist_ignore_dups
# zsh内でコマンド履歴を共有
# setopt share_history
# コマンド履歴を即座に保存
setopt inc_append_history

# コマンド履歴保存数を変更
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# コマンド履歴をインクリメンタルサーチで検索するシェルの関数を定義
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
}

zle -N select-history       # ZLEのウィジェットとして関数を登録
bindkey '^r' select-history # `Ctrl+r` で登録したselect-historyウィジェットを呼び出す

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
