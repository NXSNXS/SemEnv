

export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)

__my_ip=$(ifconfig|grep 'inet '|grep -v '127.0.0.1'| \
            head -1|awk '{print $2}')
__scid_home_dir=~/scid_home # pick a place for the .scidvspc dir


dockereclipse() {
  killall -0 quartz-wm > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "ERROR: Quartz is not running. Start Quartz and try again."
  else
    socat TCP-LISTEN:6001,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
    SOCAT_SCID_PID=$!
    docker run --name dockreclipse -e HOME=$__scid_home_dir \
      -e XAUTHORITY=/tmp/xauth -v ~/.Xauthority:/tmp/xauth \
      -e DISPLAY=$__my_ip:1 --net host -v $HOME:$HOME fgrehm/eclipse:v4.4.1
    kill $SOCAT_SCID_PID
  fi
}

restartdockereclipse() {
  killall -0 quartz-wm > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "ERROR: Quartz is not running. Start Quartz and try again."
  else
    socat TCP-LISTEN:6001,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
    SOCAT_SCID_PID=$!
    docker start -ia cranky_kare 
    kill $SOCAT_SCID_PID
  fi
}


scid() {
  killall -0 quartz-wm > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "ERROR: Quartz is not running. Start Quartz and try again."
  else
    socat TCP-LISTEN:6001,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
    SOCAT_SCID_PID=$!
    docker run --rm -e HOME=$__scid_home_dir \
      -e XAUTHORITY=/tmp/xauth -v ~/.Xauthority:/tmp/xauth \
      -e DISPLAY=$__my_ip:1 --net host -v $HOME:$HOME kayvan/scidvspc
    kill $SOCAT_SCID_PID
  fi
}



export MAVEN_OPTS="-XX:MaxPermSize=128M"
export HISTCONTROL=ignoredups
export PATH=$PATH:~/utils:~/SemEnv/bin

alias nodelist="ssh isphome01a.semantico.net 'cd work/systems/pm/nodes; svn update; nodelist'"

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

alias oldmvn="/usr/local/opt/maven@3.0/bin/mvn"

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home/'

export RIBO_DATA=~/git/brill/ribo_data

export PATH=$PATH:/opt/homebrew-cask/Caskroom/redis/3.0.7-build.2/Redis.app/Contents/Resources/Vendor/redis/bin/

export PATH=$PATH:/Users/neilstevens/apache-cassandra-2.1.20/bin

export MAVEN_OPTS="-XX:MaxPermSize=128M"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export RANGER_LOAD_DEFAULT_RC=FALSE

alias r.ranger='SHELL=~/SemEnv/rangerShell.sh ranger'

alias renv=". ~/.bash_profile"

#export HOMEBREW_CASK_OPTS=--caskroom=/opt/homebrew-cask/Caskroom

alias backblack="echo -e '\033]Ph000000\033\\'" 
alias backred="echo -e '\033]Ph990000\033\\'" 
alias backamber="echo -e '\033]Ph997700\033\\'"

#Boraqe
alias sshborage="backamber && t SPE && ssh -t cstspeweb01a.test.semantico.net 'cd /opt/semantico/slot/op-admin/1/data/import/articles/ && exec $SHELL -l' ; backblack" 

#BRILL SOMETHING?
alias sshbrillprodadmin="backred && t RIBO && ssh cspbrillweb03xc.semantico.net ; backblack" 
alias sshribotestadmin="backamber && t RIBO && ssh -t cstbrillweb01e.test.semantico.net 'cd /opt/semantico/slot/ribo-admin/1/data/import/source_files/ && exec $SHELL -l' ; backblack" 

#PSO/BRC Test
alias sshpsotestadmin="backamber && t RIBO && ssh -t cstbrillweb01g.test.semantico.net 'cd /opt/semantico/slot/brc-admin/1/data/import/ && exec $SHELL -l' ; backblack" 
alias sshpsotestfe="backamber && t RIBO && ssh -t cstbrillweb01g.test.semantico.net 'cd /opt/semantico/slot/brc-admin/1/data/import/ && exec $SHELL -l' ; backblack" 

#PSO/BRC DataQA
alias sshpsodataqaadmin="backred && t PSO  && ssh -t cspbrillweb03xa.semantico.net 'cd /opt/semantico/slot/brc-dataqa-admin/1/ && exec $SHELL -l'; backblack"
alias sshpsoprodadmin="backred && t PSO  && ssh -t fr-brill-pso-admin-prod-01.highwire.org 'cd /opt/semantico/slot/brc-admin/1/ && exec $SHELL -l'; backblack"

#PSO/BRC Prod
alias sshpsoprodfe1="backred && t PSO  && ssh -t fr-brill-pso-web-prod-01 'cd /opt/semantico/slot/brc-frontend/1/sitecode && exec $SHELL -l'; backblack"
alias sshpsoprodfe2="backred && t PSO  && ssh -t fr-brill-pso-web-prod-02 'cd /opt/semantico/slot/brc-frontend/1/sitecode && exec $SHELL -l'; backblack"


#SPE TEST
alias sshspetestadmin="backamber && t SPE && ssh -t cstspeweb01a.test.semantico.net 'cd /opt/semantico/slot/op-admin/1/data/import/articles/ && exec $SHELL -l' ; backblack" 
alias sshspetestfe="backamber && t SPE && ssh -t cstspeweb01a.test.semantico.net 'cd /opt/semantico/slot/op-frontend/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshspetestsams="backamber && t SPE && ssh -t cstspesams01a.test.semantico.net 'cd /tmp && exec $SHELL -l' ; backblack" 
alias sshspetestdb="backamber && t SPE && ssh -t cstspeweb01b.test.semantico.net 'cd /tmp && exec $SHELL -l' ; backblack"

#SPE PROD
alias sshspeproddb1="backred && t SPE && ssh -t fr-spe-db-prod-01.highwire.org 'cd && exec $SHELL -l' ; backblack"
alias sshspeproddb2="backred && t SPE && ssh -t fr-spe-db-prod-02.highwire.org 'cd && exec $SHELL -l' ; backblack"
alias sshspeproddoi="backred && t SPE && ssh -t fr-spe-mxdoi-prod-01 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"
alias sshspeprodadminandreports="backred && t SPE && ssh -t fr-spe-op-admin-prod-01.highwire.org 'cd /opt/semantico/slot/op-admin/1/sitecode/ && exec $SHELL -l' ; backblack"
alias sshspeprodfe1="backred && t SPE && ssh -t fr-spe-op-web-prod-01.highwire.org 'cd /opt/semantico/slot/op-frontend/1/sitecode && exec $SHELL -l' ; backblack"
alias sshspeprodfe2="backred && t SPE && ssh -t fr-spe-op-web-prod-02.highwire.org 'cd /opt/semantico/slot/op-frontend/1/sitecode/ && exec $SHELL -l' ; backblack"
alias sshspeprodsams1="backred && t SPE && ssh -t fr-spe-sams-web-prod-01.highwire.org 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"
alias sshspeprodsams2="backred && t SPE && ssh -t fr-spe-sams-web-prod-02.highwire.org 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"

#DRAMA TEST
alias sshdramatestadmin="backamber && t DRAMA && ssh -t cstbppweb01b.test.semantico.net 'cd /var/www/admin.drama.bpp.test.semantico.net  && exec $SHELL -l' ; backblack" 

#DRAMA PROD
alias sshdramaprodfe1="backred && t DRAMA && ssh -t cspbppweb03xa.semantico.net 'cd /opt/semantico/slot/drama-frontend/1/sitecode && exec $SHELL -l' ; backblack" 
alias sshdramaprodfe2="backred && t DRAMA && ssh -t cspbppweb03yd.semantico.net 'cd /opt/semantico/slot/drama-frontend/1/sitecode && exec $SHELL -l' ; backblack" 

alias sshdramaprodadmincode="backred && t DRAMA && ssh -t cspbppweb03yb.semantico.net 'cd /opt/semantico/slot/drama-admin/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshdramaprodadmindata="backred && t DRAMA && ssh -t cspbppweb03yb.semantico.net 'cd /var/www/admin.drama.bpp.semcs.net/data/ && exec $SHELL -l' ; backblack" 

#IOS TEST
alias sshiostestadmin="backamber && t IOS && ssh -t cstiosadmin01a.test.semantico.net 'cd /opt/semantico/slot/ip-admin/1/data/import && exec $SHELL -l' ; backblack" 
alias sshiostestfe="backamber && t IOS && ssh -t cstiosweb01b.test.semantico.net 'cd /opt/semantico/slot/ip-frontend/1/sitecode && exec $SHELL -l' ; backblack" 
alias sshpgiostest="ssh -f neilsadm@cstiosadmin01a.test.semantico.net -L 5433:cstiosadmin01a.test.semantico.net:5432 -N"

#IOS PROD
alias sshiosprodadmin="backred && t IOS && ssh -t cspiosadmin30xa 'cd /opt/semantico/slot/ip-admin/1/data/import && exec $SHELL -l' ; backblack" 
alias sshiosprodfe="backred && ssh -t cspiosweb30yb 'cd /opt/semantico/slot/ip-frontend/1/sitecode && exec /bin/bash -l'; backblack"

#MAT PROPS DEV
alias sshmatpropsdev="backamber && t MHE && ssh -t devmhpweb01a.dev.semantico.net 'cd /opt/semantico/slot/mp-mpdbe/1/sitecode && exec $SHELL -l' ; backblack" 

#MAT PROPS PROD
alias sshmatpropsprod1="backred && t IOS && ssh -t cspmhpweb03xa.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 
alias sshmatpropsprod2="backred && t IOS && ssh -t cspmhpweb03yb.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 

#MHE PROD
alias sshmheprodfe1="backred && t IOS && ssh -t cspmhpweb03xa.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 
alias sshmheprodfe2="backred && t IOS && ssh -t cspmhpweb03yb.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 

#MHE TEST
alias sshmhetestfe1="backamber && t MHE && ssh -t cstmhpweb01a.test.semantico.net 'cd /opt/semantico/slot/ae-frontend/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshmhetestfe2="backamber && t MHE && ssh -t cstmhpweb01b.test.semantico.net 'cd /opt/semantico/slot/ae-frontend/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshpgmhetest="ssh -f neilsadm@db.ae.mhp.test.semantico.net -L 5433:db.ae.mhp.test.semantico.net:5432 -N"

#STAR TEST
alias sshstartestrec1="backamber && t Star && ssh -t iststar01a.test.semantico.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstartestrec2="backamber && t Star && ssh -t iststar01b.test.semantico.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstartestdb="backamber && t Star && ssh -t iststardb01b.test.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"

#STAR PROD
alias sshstarprodrec1="backred && t Star && ssh -t ispstar03xa 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarprodrec2="backred && t Star && ssh -t ispstar03yb 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarproddb="backred && t Star && ssh -t ispstardb03xa.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"

#ITHIKA STAR DATAQA
alias sshstarithdataqarec1="backred && t Star && ssh -t cspithqastar08x1.ext.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarithdataqarec2="backred && t Star && ssh -t cspithqastar08y1.ext.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarithdataqaapi1="backred && t Star && ssh -t cspithqastar08y2.ext.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarithdataqaapi2="backred && t Star && ssh -t cspithqastar08x3.ext.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 


alias sshlbtest="backamber && t Star && ssh -t istlb01b.test.semantico.net 'cd /var/log/ && exec $SHELL -l' ; backblack" 
alias sshlbprod="backred && t Star && ssh -t isplb03yb.semantico.net 'cd /var/log/star-receiver/ && exec $SHELL -l' ; backblack" 

#CABI PROD
alias sshcabiprod1="backred && t Star && ssh -t cabisearch2.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 

#C5
alias sshc5dev="backamber && t 5Star && ssh -t bk-counter5-dev-01.highwire.org 'cd && exec $SHELL -l' ; backblack" 

#RMM
alias sshrmmtestfe="backamber && t rmm && ssh -t cstbwweb01i.test.semantico.net 'cd && exec $SHELL -l' ; backblack" 
alias sshrmmqaadmin="backamber && t rmm && ssh -t cspbwqarmmadmin61x1 'cd /opt/semantico/slot/rmm9-dataqa-admin/1/sitecode/ && exec $SHELL -l' ; backblack"
alias sshrmmprodadmin="backred && t rmm && ssh -t cspbwrmmadmin60x1 'cd /opt/semantico/slot/rmm9-admin/1/sitecode/ && exec $SHELL -l' ; backblack"

#rooks
alias sshrootestfe="backamber && t rooks && ssh -t cstbwweb01j.test.semantico.net 'cd && exec $SHELL -l' ; backblack" 


