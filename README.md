# Dotfiles

This Directory contains the dotfiles for my system

## Requirement 
Requirements for installation
**Install from your own package manager**

### Git
```
https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
```

### Stow
```
https://www.gnu.org/software/stow/stow.html
```

#### Ripgrep
To allow for telescope live-grep, neovim

## Installation

Clone Github Repo 
```
cd ~
git clone git@github.com/Viwathanac/.dotfiles.git
```

Use GNU Stow to create symlinks
```
cd ~/.dotfiles/
stow */
```
