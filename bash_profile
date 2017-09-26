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

lll(){
	ls --l $@
}

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

alias r.ranger='SHELL=~/SemEnv/rangerShell.sh ranger'

alias renv=". ~/.bash_profile"

#export HOMEBREW_CASK_OPTS=--caskroom=/opt/homebrew-cask/Caskroom

alias backblack="echo -e '\033]Ph000000\033\\'" 
alias backred="echo -e '\033]Ph990000\033\\'" 
alias backamber="echo -e '\033]Ph997700\033\\'"

#Boraqe
alias sshborage="backamber && t SPE && ssh -t cstspeweb01a.test.semantico.net 'cd /opt/semantico/slot/op-admin/1/data/import/articles/ && exec $SHELL' ; backblack" 

#BRILL SOMETHING?
alias sshbrillprodadmin="backred && t RIBO && ssh cspbrillweb03xc.semantico.net ; backblack" 
alias sshribotestadmin="backamber && t RIBO && ssh -t cstbrillweb01e.test.semantico.net 'cd /opt/semantico/slot/ribo-admin/1/data/import/source_files/ && exec $SHELL' ; backblack" 

#PSO/BRC Test
alias sshpsotestadmin="backamber && t RIBO && ssh -t cstbrillweb01g.test.semantico.net 'cd /opt/semantico/slot/brc-admin/1/data/import/ && exec $SHELL' ; backblack" 

#PSO/BRC DataQA
alias sshpsodataqaadmin="backred && t PSO  && ssh -t cspbrillweb03xa.brill.semcs.net 'cd /opt/semantico/slot/brc-dataqa-admin/1/data/import/collections/ && exec $SHELL'; backblack"

#SPE TEST
alias sshspetestadmin="backamber && t SPE && ssh -t cstspeweb01a.test.semantico.net 'cd /opt/semantico/slot/op-admin/1/data/import/articles/ && exec $SHELL' ; backblack" 
alias sshspetestfe="backamber && t SPE && ssh -t cstspeweb01a.test.semantico.net 'cd /opt/semantico/slot/op-frontend/1/sitecode/ && exec $SHELL' ; backblack" 
alias sshspetestsams="backamber && t SPE && ssh -t cstspesams01a.test.semantico.net 'cd /tmp && exec $SHELL' ; backblack" 

#SPE PROD
alias sshspeprodadmin="backred && t SPE && ssh -t cspspebend03xc1.semantico.net 'cd /opt/semantico/slot/op-admin/1/data/import/articles/ && exec $SHELL' ; backblack" 
alias sshspeprodfe1="backred && t SPE && ssh -t  cspspeweb03yb.semantico.net 'cd /opt/semantico/slot/op-frontend/1/sitecode/logs && exec $SHELL' ; backblack" 
alias sshspeprodfe2="backred && t SPE && ssh -t cspspeweb03xa.semantico.net 'cd /opt/semantico/slot/op-frontend/1/sitecode/logs && exec $SHELL' ; backblack" 

#DRAMA TEST
alias sshdramatestadmin="backamber && t DRAMA && ssh -t cstbppweb01b.test.semantico.net 'cd /var/www/admin.drama.bpp.test.semantico.net  && exec $SHELL' ; backblack" 

#DRAMA PROD
alias sshdramaprodfe="backred && t DRAMA && ssh -t cspbppweb03xa.semantico.net 'cd /opt/semantico/slot/op-admin/1/data/import/articles/ && exec $SHELL' ; backblack" 
alias sshdramaprodadmin="backred && t DRAMA && ssh -t cspbppweb03yb.semantico.net 'cd /var/www/admin.drama.bpp.semcs.net/data/ && exec $SHELL' ; backblack" 

#IOS TEST
alias sshiostestadmin="backamber && t IOS && ssh -t cstiosadmin01a.test.semantico.net 'cd /opt/semantico/slot/ip-admin/1/data/import && exec $SHELL' ; backblack" 
alias sshiostestfe="backamber && t IOS && ssh -t cstiosweb01b.test.semantico.net 'cd /opt/semantico/slot/ip-frontend/1/sitecode && exec $SHELL' ; backblack" 

#IOS PROD
alias sshiosprodadmin="backred && t IOS && ssh -t cspiosadmin30xa.semantico.net 'cd /opt/semantico/slot/ip-admin/1/data/import && exec $SHELL' ; backblack" 

#MAT PROPS DEV
alias sshmatpropsdev="backamber && t MHE && ssh -t devmhpweb01a.dev.semantico.net 'cd /opt/semantico/slot/mp-mpdbe/1/sitecode && exec $SHELL' ; backblack" 

#MAT PROPS PROD
alias sshmatpropsprod1="backred && t IOS && ssh -t cspmhpweb03xa.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL' ; backblack" 
alias sshmatpropsprod2="backred && t IOS && ssh -t cspmhpweb03yb.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL' ; backblack" 

#MHE TEST
alias sshmhetestfe1="backamber && t MHE && ssh -t cstmhpweb01a.test.semantico.net 'cd /opt/semantico/slot/ae-frontend/1/sitecode/ && exec $SHELL' ; backblack" 
alias sshmhetestfe2="backamber && t MHE && ssh -t cstmhpweb01b.test.semantico.net 'cd /opt/semantico/slot/ae-frontend/1/sitecode/ && exec $SHELL' ; backblack" 

#MHE PROD
alias sshmheprodfe1="backred && t IOS && ssh -t cspmhpweb03xa.semantico.net 'cd /opt/semantico/slot/ae-frontend/1/sitecode/ && exec $SHELL' ; backblack" 
alias sshmheprodfe2="backred && t IOS && ssh -t cspmhpweb03yb.semantico.net 'cd /opt/semantico/slot/ae-frontend/1/sitecode/ && exec $SHELL' ; backblack" 

#/opt/semantico/slot/op-admin/1/data/import/articles
