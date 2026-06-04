# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"
# Basic

alias c='clear'

alias cls='clear'

alias reload='source ~/.zshrc'

alias zshconfig='nvim ~/.zshrc'

alias home='cd ~'

alias ..='cd ..'

alias ...='cd ../..'

alias ll='ls -lah'

alias la='ls -A'

alias l='ls -CF'



# Open current folder in Windows Explorer

alias open='explorer.exe .'



# Neovim / LazyVim



alias nvimconfig='cd ~/.config/nvim && nvim .'

alias nvcfg='cd ~/.config/nvim && nvim .'

alias dashboard='nvim ~/.config/nvim/lua/plugins/dashboard.lua'

alias lazyconfig='nvim ~/.config/nvim'

alias lazyclean='rm -rf ~/.cache/nvim ~/.local/state/nvim/sessions'



# Git

alias gs='git status'

alias ga='git add .'

alias gaa='git add --all'

alias gc='git commit -m'

alias gp='git push'

alias gpl='git pull'

alias gb='git branch'

alias gco='git checkout'

alias glog='git log --oneline --graph --decorate --all'



# Node / Next.js / React

alias ni='npm install'

alias nd='npm run dev'

alias nb='npm run build'

alias ns='npm start'

alias nr='npm run'

alias nrd='npm run dev'



# Laravel

alias pas='php artisan serve'

alias pam='php artisan migrate'

alias pamf='php artisan migrate:fresh'

alias pamfs='php artisan migrate:fresh --seed'

alias pac='php artisan config:clear'

alias par='php artisan route:clear'

alias pav='php artisan view:clear'

alias pao='php artisan optimize:clear'

alias tinker='php artisan tinker'



# CodeIgniter 4

alias spark='php spark'

alias pss='php spark serve'



# Composer

alias ci='composer install'

alias cu='composer update'

alias cda='composer dump-autoload'



# Project helpers

alias www='cd /mnt/c/xampp/htdocs'

alias desktop='cd /mnt/c/Users/Pongo/Desktop'

alias downloads='cd /mnt/c/Users/Pongo/Downloads'



# Create folder and enter it

mkcd() {

  mkdir -p "$1" && cd "$1"

}



# Go to git project root

croot() {

  cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

}






# Basic

alias c='clear'

alias cls='clear'

alias reload='source ~/.zshrc'

alias zshconfig='nvim ~/.zshrc'

alias home='cd ~'

alias ..='cd ..'

alias ...='cd ../..'

alias ll='ls -lah'

alias la='ls -A'

alias l='ls -CF'



# Open current folder in Windows Explorer

alias open='explorer.exe .'



# Neovim / LazyVim



alias nvimconfig='cd ~/.config/nvim && nvim .'

alias nvcfg='cd ~/.config/nvim && nvim .'

alias dashboard='nvim ~/.config/nvim/lua/plugins/dashboard.lua'

alias lazyconfig='nvim ~/.config/nvim'

alias lazyclean='rm -rf ~/.cache/nvim ~/.local/state/nvim/sessions'



# Git

alias gs='git status'

alias ga='git add .'

alias gaa='git add --all'

alias gc='git commit -m'

alias gp='git push'

alias gpl='git pull'

alias gb='git branch'

alias gco='git checkout'

alias glog='git log --oneline --graph --decorate --all'



# Node / Next.js / React

alias ni='npm install'

alias nd='npm run dev'

alias nb='npm run build'

alias ns='npm start'

alias nr='npm run'

alias nrd='npm run dev'



# Laravel

alias pas='php artisan serve'

alias pam='php artisan migrate'

alias pamf='php artisan migrate:fresh'

alias pamfs='php artisan migrate:fresh --seed'

alias pac='php artisan config:clear'

alias par='php artisan route:clear'

alias pav='php artisan view:clear'

alias pao='php artisan optimize:clear'

alias tinker='php artisan tinker'



# CodeIgniter 4

alias spark='php spark'

alias pss='php spark serve'



# Composer

alias ci='composer install'

alias cu='composer update'

alias cda='composer dump-autoload'



# Project helpers

alias www='cd /mnt/c/xampp/htdocs'

alias desktop='cd /mnt/c/Users/Pongo/Desktop'

alias downloads='cd /mnt/c/Users/Pongo/Downloads'



# Create folder and enter it

mkcd() {

  mkdir -p "$1" && cd "$1"

}



# Go to git project root

croot() {

  cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

}




# Neovim shortcut
alias nvcfg='cd ~/.config/nvim && nvim .'
alias dashboard='nvim ~/.config/nvim/lua/plugins/dashboard.lua'




# Neovim shortcuts

alias v='nvim'

alias vi='nvim'

alias vim='nvim'

alias nv='nvim'

alias nvcfg='cd ~/.config/nvim && nvim .'

alias dashboard='nvim ~/.config/nvim/lua/plugins/dashboard.lua'



