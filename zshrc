if [[ ! -f ~/.config/zinit/bin/zinit.zsh ]]; then
    mkdir ~/.config/zinit
    git clone https://github.com/zdharma-continuum/zinit.git ~/.config/zinit/bin
fi

# load zinit
source ~/.config/zinit/bin/zinit.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#####################
# ENV VARIABLE      #
#####################
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR='nvim'
export SHELL='/bin/zsh'
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

#####################
# ALIASES           #
#####################
alias c='clear'
# alias r='ranger'
alias vi='nvim'
alias vnv='nvim ~/.config/nvim/init.lua'
function mkcd() { mkdir -p $1; cd $1;}
function proxy_on() {
    export http_proxy="socks5://127.0.0.1:1089"
    export https_proxy="socks5://127.0.0.1:1089"
    echo -e "终端代理已开启。"
}
function proxy_off(){
    unset http_proxy https_proxy
    echo -e "终端代理已关闭。"
}

# #####################
# # PLUGINS           #
# #####################

# highting and completion
zinit ice lucid wait='0' atinit='zpcompinit'
# zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice lucid wait='0' atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions
# zsh snippet
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/autojump/autojump.plugin.zsh
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

zinit load djui/alias-tips

zinit ice wait'0c' lucid atinit'zpcompinit;zpcdreplay'
zinit light zdharma-continuum/fast-syntax-highlighting
# EXA
zinit ice wait'2' lucid id-as'exa' from'gh-r' as'program' mv'bin/exa* -> exa' \
    cp'completions/exa.zsh -> _exa' \
  atload"
        alias l='exa --sort=changed --icons -la --git --git-ignore --ignore-glob=\".DS_Store|__MACOSX|__pycache__\"'
        alias la='exa --group-directories-first --icons -la'
        alias ll='exa --group-directories-first --icons -la --color-scale --time-style=long-iso --git --git-ignore --ignore-glob=\".git|.DS_Store|__MACOSX|__pycache__\" -T -L2'
        alias ll3='exa --group-directories-first --icons -la --git --git-ignore --ignore-glob=\".git|.DS_Store|__MACOSX\" -T -L3'
        alias ll4='exa --group-directories-first --icons -la --git --git-ignore --ignore-glob=\".git|.DS_Store|__MACOSX\" -T -L4'
        alias tree='exa --group-directories-first -T --icons'
    "
zinit light ogham/exa
zinit ice wait blockf atpull'zinit creinstall -q .'
# BAT
zinit ice as'program' id-as'bat' from'gh-r' mv'bat* -> bat' cp'bat/autocomplete/bat.zsh -> _bat' pick'bat/bat' atload'alias cat=bat'
zinit light sharkdp/bat
# RIPGREP
zinit ice from'gh-r' as'program' id-as'rg' mv'ripgrep* -> rg' cp'rg/complete/_rg -> _rg' pick'rg/rg'
zinit light BurntSushi/ripgrep
# DELTA
zinit wait'1' lucid \
  as'program' id-as'delta' from'gh-r' mv'delta* -> delta' pick'delta/delta' \
  light-mode for @dandavison/delta
zinit ice wait'1' lucid as'delta-completion' has'delta' mv'completion.zsh -> _delta'
zinit snippet https://github.com/dandavison/delta/blob/master/etc/completion/completion.zsh
# FORGIT
zinit ice wait lucid id-as'forgit' atload'alias gr=forgit::checkout::file'
zinit load 'wfxr/forgit'
# LAZYGIT
zinit ice lucid wait'0' as'program' from'gh-r' mv'lazygit* -> lazygit' atload'alias lg=lazygit'
zinit light 'jesseduffield/lazygit'
# LAZYDOCKER
zinit ice lucid wait'0' as'program' from'gh-r' mv'lazydocker* -> lazydocker' atload'alias ld=lazydocker'
zinit light 'jesseduffield/lazydocker'
# # RANGER
# zinit ice depth'1' as'program' pick'ranger.py' atload'alias ranger=ranger.py'
# zinit light ranger/ranger
# FD
zinit ice as'program' id-as'fd' from'gh-r' mv'fd* -> fd' cp'fd/autocomplete/_fd -> _fd' pick'fd/fd'
zinit light sharkdp/fd

source /usr/share/nvm/init-nvm.sh
