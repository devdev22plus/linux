### Install vim plugin
if use wsl will have ddos convert to unix all file if file in plugin have error about end of line
use this command can help about convert file from ddos to unix ":w ++ff=unix" write can change in one command


# How To use Vim for me

### move by word
W move forward
B move backward


### move by line
^ for start line
$ for end line


### change current pane
ctrl + w > arrow

### copy
ctrl + d > cut

### past
p

### center of screen
zz

### command
:tabs show all tab session
:tabn next tab



### command plugin
:NERDTree > use file system tree


# Vim for c++
ctrl + ] # goto definition
gd # goto local declaration
gD # goto global declaration



### =============================================== ###
# How To use Tmux for me

### Install first for Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


### Tmux command
tmux source ~/.tmux.conf


### binding-key
prefix key: ctrl+b -> released



### move pane
prefix key -> [ or ]

### change current pane
prefix key -> arrow


### new pane horizontal
prefix key -> "

### new pane verticle
prefix key -> %


### join pane
join-pane -s :number of pane

### break pane
break-pane -s :number of pane

### change layout pane
prefix key -> space bar

### resize pane
prefix key press + arrow


### show all pane
prefix key -> w


### copy selection #
prefix key -> [ # for selection mode
ctrl + space bar # for start selection
alt + w # for copy
prefix key -> ] # for past mode




