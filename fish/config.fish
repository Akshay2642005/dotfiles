#-------------------------------------Fish-Conifg---------------------------------------------

#-------------------tide---------------------
set fish_greeting ""
set -gx term xterm-256color
set -gx tide_git_icon " "
set -gx tide_character_icon '⚡'
#set -gx tide_character_icon '➟'
set -gx tide_character_vi_icon_default '~$'
set -gx tide_character_vi_icon_replace '~$'
set -gx tide_character_vi_icon_visual '~$'
#--------------------------------------------


#--------------------theme-------------------
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
#--------------------------------------------


#----------------aliases---------------------
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias lfp="lf-pick"
alias rm="rm -rf"
command -qv nvim && alias vim nvim
alias ll="eza --icons=always --long --no-filesize --color=always --no-time --no-permissions --octal-permissions $args"
alias src='source'
alias ex='exec'
alias c='clear'
alias ss='spf'
alias llloll='vim'
alias vim='nvim'
alias ff='yazi'
alias ani='ani-cli'
alias ytdlp='yt-dlp'
alias zc="zellij"
alias vi='NVIM_APPNAME=nvim-dvs nvim'
alias conda="conda.exe"
alias deepseek="ollama run deepseek-coder-v2:16b-lite-instruct-q4_0"
alias postgres="sudo su - postgres"
#-------------------------------------------- 

#---------------Git--------------------------
alias lg='lazygit'
alias g='git'
alias ga='git add'
alias gafzf='git ls-files -m -o --exclude-standard | grep -v "__pycache__" | fzf -m --print0 | xargs -0 -o -t git add' # Git add with fzf
alias grmfzf='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git rm' # Git rm with fzf
alias grfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore' # Git restore with fzf
alias grsfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore --staged' # Git restore --staged with fzf
alias gf='git fetch'
alias gs='git status'
alias gss='git status -s'
alias gup='git fetch && git rebase'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias glo='git pull origin'
alias gl='git pull'
alias gb='git branch '
alias gbr='git branch -r'
alias gd='git diff'
alias gco='git checkout '
alias gcob='git checkout -b '
alias gcofzf='git branch | fzf | xargs git checkout' # Select branch with fzf
alias gre='git remote'
alias gres='git remote show'
alias glgg='git log --graph --max-count=5 --decorate --pretty="oneline"'
alias gm='git merge'
alias gp='git push'
alias gpo='git push origin'
alias ggpush='git push origin $(current_branch)'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gcmnv='git commit --no-verify -m'
alias gcanenv='git commit --amend --no-edit --no-verify'
#--------------------------------------------

#--------------npm---------------------------
alias ni='npm install'
alias nrd='npm run dev'
alias nrt='npm run test'
alias nrs='npm run start'
alias nig='npm install -g'
alias pm='pnpm'
alias pmid='pnpm run dev'
alias yum='sudo pacman -S'
alias rem='sudo pacman -R'
alias pip="pip3"
alias py="python3"
#--------------------------------------------

#------------Api Keys------------------------


#--------------------------------------------


#---------------Misc-------------------------
alias exp="lfp"
alias qa='exit'
alias projects="cd ~/Projects"
alias user="cd ~/Akshay"
alias home="cd ~"
#--------------------------------------------

#-------------fish-alias---------------------
alias refreshenv="source ~/.config/fish/config.fish"
alias fish-config="nvim ~/.config/fish/config.fish"
#--------------------------------------------
#------------Defaults & PATH ----------------
set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx fish_prompt_pwd_dir_length 1
#--------------------------------------------

#--------------PATH--------------------------
#     ---------NodeJS-----------
set -gx PATH node_modules/.bin $PATH
#     --------------------------

#     ---------Homebrew---------
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
#     --------------------------

#     ----------Go-------------
set -gx PATH /usr/local/go/bin $PATH
#     -------------------------

#     ---------Rust------------
set -gx PATH ~/.cargo/bin $PATH
#     -------------------------

#--------------------------------------------





#---------------------------------------------------------------------------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/akshay/miniconda3/bin/conda
    eval /home/akshay/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/akshay/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/akshay/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/akshay/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

