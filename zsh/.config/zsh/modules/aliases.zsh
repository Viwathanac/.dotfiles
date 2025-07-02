# <<Setting Aliases>>
alias v="nvim"
alias c="clear"
alias vim="nvim"
alias ls="ls -p --color=auto"
alias shutdown="systemctl poweroff"
alias reboot="systemctl reboot"
alias kiwi="tmux-sessionizer kiwi"

# Pacman Aliases
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias paclean='sudo pacman -Sc'
alias pacins='sudo pacman -U'
alias paclr='sudo pacman -Scc'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='sudo pacman -S --asdeps'
alias pacmir='sudo pacman -Syy'
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='sudo pacman -Fy'
alias pacfiles='pacman -F'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'
alias pacupd="sudo pacman -Sy"

# YAY Aliases
alias yaupg='yay -Syu'
alias yaconf='yay -Pg'
alias yaclean='yay -Sc'
alias yaclr='yay -Scc'
alias yasu='yay -Syu --noconfirm'
alias yain='yay -S'
alias yains='yay -U'
alias yare='yay -R'
alias yarem='yay -Rns'
alias yarep='yay -Si'
alias yareps='yay -Ss'
alias yaloc='yay -Qi'
alias yalocs='yay -Qs'
alias yalst='yay -Qe'
alias yaorph='yay -Qtd'
alias yainsd='yay -S --asdeps'
alias yamir='yay -Syy'
alias yaupd="yay -Sy"

# Git Aliases
alias g='git'
alias ga='git add'
alias grm='git rm'
alias grst='git restore --staged'
alias gst='git status'
alias gss='git status --short'
alias gsb='git status --short --branch'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcB='git checkout -B'
alias gp='git push'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gprv='git pull --rebase -v'
alias gpra='git pull --rebase --autostash'
alias gprav='git pull --rebase --autostash -v'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
