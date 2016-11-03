export HISTCONTROL=ignoredups
export PATH=$PATH:~/utils

alias h="history | grep -E -v '^ *[0-9]+ *h ' | grep "

findFn(){
	echo -------Finding $1 ------------
	find / -name "$1" 2>/dev/null
	echo ------------------------------
}

alias f=findFn

alias p="ps -ef | grep -i $1"

alias ll="ls -lt"


#automatically sets items title to pwd
#if [ $ITERM_SESSION_ID ]; then
#  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
#fi

export PROMPT_COMMAND=pwd

#export PS1="\[\e[34;43m\]\W\[\e[m\] "
#export PS1="\[\e[33;40m\]\\$\[\e[m\] "
export PS1="\[\e[33;40m\]==>\[\e[m\] "
t(){
	echo -ne "\033]0;"$@"\007"
}

alias oldmvn="/opt/apache-maven-3.0.5/bin/mvn"

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home/'

export RIBO_DATA=~/git/brill/ribo_data

export PATH=$PATH:/opt/homebrew-cask/Caskroom/redis/3.0.7-build.2/Redis.app/Contents/Resources/Vendor/redis/bin/

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export RANGER_LOAD_DEFAULT_RC=FALSE

#export HOMEBREW_CASK_OPTS=--caskroom=/opt/homebrew-cask/Caskroom
