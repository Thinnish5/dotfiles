set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "eza -l -g --icons"
alias lla "ll -A"
alias g git
alias notes "cd ~/Sync/1º\ Semestre/Notes/ && nvim notes.tex"
alias nova "cd ~/Sync/1º\ Semestre"
alias asd "cd ~/Sync/1º\ Semestre/ASD"
alias ml "cd ~/Sync/1º\ Semestre/AA"
alias ipm "cd ~/Sync/1º\ Semestre/IPM"
alias scc "cd ~/Sync/1º\ Semestre/SCC"
alias ide "bash ~/.scripts/ide.sh"
alias emp "cd ~/Sync/Empr"
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
# vscode path
function code
    open -a "Visual Studio Code.app" $argv
end
switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

eval "$(/opt/homebrew/bin/brew shellenv)"
