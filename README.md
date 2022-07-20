# myset

> Linux Ubuntu와 Amazon Linux 지원 

### How to Install

#### 1) joyful_shell.sh installation
` ./joyful_shell.sh`

#### 2) updaterc.sh installation
` ./updaterc.sh`

#### 3) minikubeset.sh installation
` ./minikubeset.sh`

---

### Explanation of Each Files

#### 1) Waht joyful_shell.sh does?

install git, zsh, vim, tmux, and so on
install gotop
apply plugins 

##### Explaination of important plugins:
- alien-minial: o-my-zsh-shell theme
- autosuggestions (press right button for auto-complete
- zsh-syntax-highlighting

apply rc files
##### Explanation of rc files:
**.zshrc**: can change the theme

**.zsh_aliases**: apply aliases 
  - source ~/.zshrc : src
  - tmux: t
  - vim: v
  - clear: c
  - docker: d
  - l: ls
  - ls -a: la
  - git: g

**.gitconfig**: shortened git command and set the color for git command

  - commit: c
  - commit -m :  cm
  - clone : clone
  - init: i
  - add --all: a
  - add -i: ai
  - branch: b
  - checkout : o
  - checkout -b: ob
  - push: ps
  - pull: pl
  - remote add origin: rao
  - diff : d 

**.vimrc**: set the vim, shortcut-key, colors

**.tmux.conf**: set shortcut-key, colors

#### 2) Waht updaterc.sh does?
update all rc files under the current directory

#### 3) Waht minikubeset.sh does?
install minikube in Amazon Linux

