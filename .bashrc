#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ddg='ddgr -x -n 5'
alias ls='ls --color=auto'
alias nwbo='newsboat'
alias otbp='optirun -b primus'
alias pcsjvrun2='~/processing-2.2.1/processing-java --output=/home/cash/procjavarun/ --run --force' # exec with --sketch=<sketch directory>
alias pcsjvrun3='/usr/share/processing/processing-java --output=/home/cash/procjavarun/ --force' # exec with --sketch=<sketch directory> --run
alias prm='primusrun'
alias refm='sudo reflector --verbose --protocol https -l 200 --sort rate -n 6 --save /etc/pacman.d/mirrorlist'
alias rng='Rscript /home/cash/RNG.R'
alias slpr='streamlink --plaver="primusrun mpv"'
alias starwars='telnet towel.blinkenlights.nl'
alias triz='trizen -Syu' 
alias twc='twitchy'
alias umda='sudo umount /dev/sda1 -v'
alias wcu='wicd-curses'
alias wtr='curl wttr.in/Melbourne'
alias xprp='xprop WM_CLASS WM_NAME WM_WINDOW_ROLE'

# Custom prompt
PS1="\n\[\033[1;36m\][\w]\[\033[1;35m\]\$\[\033[0m\] "

# Custom editor
EDITOR=vim
export VISUAL="vim"

# Custom browser
BROWSER=firefox

# Colour output for less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"	# Code syntax colouring
export LESS='-R '					# (w/ source-highlight)

# Colour output for man pages (viewed w/ less)
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# hook pkgfile to search for available packages (in the Arch repos only) for unavailable commands TODO
source /usr/share/doc/pkgfile/command-not-found.bash
