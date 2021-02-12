alias edprof="(cd ~/SemEnv; vi bash_profile); . ~/.bash_profile; echo IF IT WORKS RUN pushprof"
alias edssh="(cd ~/SemEnv; vi sshconfig); echo IF IT WORKS RUN pushprof"
alias pushprof="(cd ~/SemEnv; git add .; git commit --allow-empty-message; git push)"
alias pullprof="(cd ~/SemEnv; git pull); . ~/.bash_profile"

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
fsmvn(){
	(export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home/;mvn $@)
}
j8mvn(){
	(export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home/;mvn $@)
}
sigmamvn(){
	(export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home/;mvn $@)
}
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

alias sshisph="backamber && t isphome && ssh -t isphome01a.semantico.net 'exec $SHELL -l' ; backblack" 

#Boraqe
alias sshborage="backamber && t SPE && ssh -t ispfs01c.semantico.net 'exec $SHELL -l' ; backblack" 

#Ribo Test
alias sshribotestadmin="backamber && t RIBO && ssh -t cstbrillweb01e.test.semantico.net 'cd /opt/semantico/slot/ribo-admin/1/data/import/source_files/ && exec $SHELL -l' ; backblack" 

#Linking Hub
alias sshlinkinghub="backred && t RIBO && ssh -t cspbrillweb03yb.int.dyn.semcs.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 
alias sshlinkinghubsolrtnl1="figlet tunnel 34100 to Linking Hub prod solr;ssh  cspbrillweb03yb.int.dyn.semcs.net -L 34100:127.0.0.1:34100 cat"

#Ribo Prod
alias sshriboprodfe1="backred && t RIBO && ssh -t cspbrillribo03x1.semantico.net 'cd /opt/semantico/slot/ribo-frontend/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshriboprodfe2="backred && t RIBO && ssh -t cspbrillribo03y1.semantico.net 'cd /opt/semantico/slot/ribo-frontend/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshriboprodsolrtnl1="figlet tunnel 29100 to ribo prod solr;ssh  neilsadm@cspbrillribo03x1.semantico.net -L 29100:127.0.0.1:20100 cat"
alias sshriboprodsolrtnl2="figlet tunnel 29101 to ribo prod solr;ssh  neilsadm@cspbrillribo03x1.semantico.net -L 29101:127.0.0.1:20101 cat"
alias sshriboprodfragrtnl="figlet tunnel 26100 to ribo prod fragr;ssh  neilsadm@cspbrillribo03x1.semantico.net -L 26100:127.0.0.1:26100 cat"

#Ribo dataQA
alias sshribodataqafe1="backred && t RIBO && ssh -t cspbrillqaribo03x1.semantico.net 'cd /opt/semantico/slot/ribo-dataqa-frontend/1/sitecode && exec $SHELL -l' ; backblack" 
alias sshribodataqaadmin="backred && t RIBO && ssh -t cspbrillqapso03x1.semantico.net 'cd /opt/semantico/slot/brc-dataqa-admin/1/sitecode && exec $SHELL -l' ; backblack" 
alias sshribodataqasolrtnl1="figlet tunnel 29100 to ribo dataqa solr;ssh  neilsadm@cspbrillqaribo03x1.semantico.net -L 29100:127.0.0.1:20100 cat"
alias sshribodataqasolrtnl2="figlet tunnel 29101 to ribo dataqa solr;ssh  neilsadm@cspbrillqaribo03x1.semantico.net -L 29101:127.0.0.1:20101 cat"

#PSO/BRC Test
alias sshpsotestadmin="backamber && t RIBO && ssh -t cstbrillweb01g.test.semantico.net 'cd /opt/semantico/slot/brc-admin/1/data/import/ && exec $SHELL -l' ; backblack" 
alias sshpsotestfe="backamber && t RIBO && ssh -t cstbrillweb01g.test.semantico.net 'cd /opt/semantico/slot/brc-admin/1/data/import/ && exec $SHELL -l' ; backblack" 

#PSO/BRC DataQA
alias sshpsodataqaadmin="backred && t PSO  && ssh -t cspbrillqapso03x1.semantico.net 'cd /opt/semantico/slot/brc-dataqa-admin/1/sitecode && exec $SHELL -l'; backblack"
alias sshpsodataqafe="backred && t PSO  && ssh -t cspbrillqapso03x1.semantico.net 'cd /opt/semantico/slot/brc-dataqa-frontend/1/sitecode && exec $SHELL -l'; backblack"
alias sshpsodataqasolrtnl1="figlet tunnel 29103 to pso dataqa solr;ssh  neilsadm@cspbrillqapso03x1.semantico.net -L 29103:127.0.0.1:20103 cat"
alias sshpsodataqasolrtnl2="figlet tunnel 29104 to pso dataqa solr;ssh  neilsadm@cspbrillqapso03x1.semantico.net -L 29104:127.0.0.1:20104 cat"


#PSO/BRC Prod
alias sshpsoprodadmin="backred && t PSO  && ssh -t fr-brill-pso-admin-prod-01.int.dyn.semcs.net 'cd /opt/semantico/slot/brc-admin/1/ && exec $SHELL -l'; backblack"
alias sshpsoprodfe1="backred && t PSO  && ssh -t fr-brill-pso-web-prod-01.int.dyn.semcs.net 'cd /opt/semantico/slot/brc-frontend/1/sitecode && exec $SHELL -l'; backblack"
alias sshpsoprodfe2="backred && t PSO  && ssh -t fr-brill-pso-web-prod-02.int.dyn.semcs.net 'cd /opt/semantico/slot/brc-frontend/1/sitecode && exec $SHELL -l'; backblack"
alias sshpsoprodsolrtnl1="figlet tunnel 29102 to PSO prod solr;ssh  fr-brill-pso-web-prod-01.int.dyn.semcs.net  -L 29102:127.0.0.1:20102 cat"
alias sshpsoprodsolrtnl2="figlet tunnel 29103 to PSO prod solr;ssh  fr-brill-pso-web-prod-01.int.dyn.semcs.net  -L 29103:127.0.0.1:20103 cat"
alias sshpsoprodrodney1="figlet tunnel 39102 to PSO prod solr;ssh  fr-brill-pso-web-prod-01.int.dyn.semcs.net  -L 39102:127.0.0.1:30102 cat"


#SPE TEST
alias sshspetestadmin="backamber && t SPE && ssh -t cstspeweb01a.test.semantico.net 'cd /opt/semantico/slot/op-admin/1/data/import/articles/ && exec $SHELL -l' ; backblack" 
alias sshspetestfe="backamber && t SPE && ssh -t cstspeweb01a.test.semantico.net 'cd /opt/semantico/slot/op-frontend/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshspetestsams="backamber && t SPE && ssh -t cstspesams01a.test.semantico.net 'cd /tmp && exec $SHELL -l' ; backblack" 
alias sshspetestdb="backamber && t SPE && ssh -t cstspeweb01b.test.semantico.net 'cd /tmp && exec $SHELL -l' ; backblack"

#SPE PROD
alias sshspeproddb1="backred && t SPE && ssh -t neilsadm@fr-spe-db-prod-01.highwire.org 'cd && exec $SHELL -l' ; backblack"
alias sshspeproddb2="backred && t SPE && ssh -t neilsadm@fr-spe-db-prod-02.highwire.org 'cd && exec $SHELL -l' ; backblack"
alias sshspeproddoi="backred && t SPE && ssh -t neilsadm@fr-spe-mxdoi-prod-01 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"
alias sshspeprodadminandreports="backred && t SPE && ssh -t neilsadm@fr-spe-op-admin-prod-01.highwire.org 'cd /opt/semantico/slot/op-admin/1/sitecode/ && exec $SHELL -l' ; backblack"
alias sshspeprodfe1="backred && t SPE && ssh -t neilsadm@fr-spe-op-web-prod-01.highwire.org 'cd /opt/semantico/slot/op-frontend/1/sitecode && exec $SHELL -l' ; backblack"
alias sshspeprodfe2="backred && t SPE && ssh -t neilsadm@fr-spe-op-web-prod-02.highwire.org 'cd /opt/semantico/slot/op-frontend/1/sitecode/ && exec $SHELL -l' ; backblack"
alias sshspeprodsams1="backred && t SPE && ssh -t neilsadm@fr-spe-sams-web-prod-01.highwire.org 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"
alias sshspeprodsams2="backred && t SPE && ssh -t neilsadm@fr-spe-sams-web-prod-02.highwire.org 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"
alias sshspeprodsolrtnl1="figlet tunnel 29100 to spe prod solr;ssh neilsadm@fr-spe-op-web-prod-01.highwire.org -L 29100:127.0.0.1:20100 cat"
alias sshspeprodsolrtnl2="figlet tunnel 29101 to spe prod solr;ssh neilsadm@fr-spe-op-web-prod-01.highwire.org -L 29101:127.0.0.1:20101 cat"

#PDF AGG
alias sshpdfaggprod1="backred && t SPE && ssh -t nstevens@fr-spe-pdfaggregator-prod-01.highwire.org 'cd / && exec $SHELL -l' ; backblack"
alias sshpdfaggprod2="backred && t SPE && ssh -t nstevens@fr-spe-pdfaggregator-prod-02.highwire.org 'cd / && exec $SHELL -l' ; backblack"

#DRAMA TEST
alias sshdramatestboth="backamber && t DRAMA && ssh -t cstbppweb03x1.highwire.org 'cd /opt/semantico/slot  && exec $SHELL -l' ; backblack" 

#DRAMA PROD
alias sshdramaprodfe1="backred && t DRAMA && ssh -t cspbppweb03xa.semantico.net 'cd /opt/semantico/slot/drama-frontend/1/sitecode && exec $SHELL -l' ; backblack" 
alias sshdramaprodfe2="backred && t DRAMA && ssh -t cspbppweb03yd.semantico.net 'cd /opt/semantico/slot/drama-frontend/1/sitecode && exec $SHELL -l' ; backblack" 

alias sshdramaprodadmincode="backred && t DRAMA && ssh -t cspbppweb03yd.semantico.net 'cd /opt/semantico/slot/drama-admin/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshdramaprodadmindata="backred && t DRAMA && ssh -t cspbppweb03yd.semantico.net 'cd /var/www/admin.drama.bpp.semcs.net/data/ && exec $SHELL -l' ; backblack" 

alias sshdramaprodsams="backred && t SAMS && ssh -t cspbppsams03x1 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 

alias sshbbyregtest="backamber && ssh -t nstevens@bk-bpp-sso-dev-01; backblack"

#IOS TEST
alias sshiostestadmin="backamber && t IOS && ssh -t cstiosadmin01a.test.semantico.net 'cd /opt/semantico/slot/ip-admin/1/data/import && exec $SHELL -l' ; backblack" 
alias sshiostestfe="backamber && t IOS && ssh -t cstiosweb01b.test.semantico.net 'cd /opt/semantico/slot/ip-frontend/1/sitecode && exec $SHELL -l' ; backblack" 
alias sshiostestdb="backamber && t IOS && ssh -t cstiosweb01a.test.semantico.net 'cd /opt/semantico/slot && exec $SHELL -l' ; backblack" 
alias sshiostestsams="backamber && t IOS && ssh -t cstiossams01a.test.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 

#IOS PROD
alias sshiosprodadmin="backred && t IOS && ssh -t neilsadm@cspiosadmin30xa.ext.dyn.semcs.net 'cd /opt/semantico/slot/ip-admin/1/data/import && exec $SHELL -l' ; backblack" 
alias sshiosprodfe="backred && ssh -t neilsadm@cspiosweb30yb.ext.dyn.semcs.net  'cd /opt/semantico/slot/ip-frontend/1/sitecode && exec /bin/bash -l'; backblack"
alias sshiosprodsams1="backred && ssh -t neilsadm@cspiossams30xa.ext.dyn.semcs.net  'cd /opt/semantico/slot/ && exec /bin/bash -l'; backblack"
alias sshiosprodsams2="backred && ssh -t neilsadm@cspiossams30yb.ext.dyn.semcs.net  'cd /opt/semantico/slot/ && exec /bin/bash -l'; backblack"
alias sshiosprodsolrtnl1="figlet tunnel 29100 to ios prod solr;ssh neilsadm@cspiosweb30yb.ext.dyn.semcs.net -L 29100:127.0.0.1:20100 cat"

#MAT PROPS DEV
alias sshmatpropsdev="backamber && t MHE && ssh -t devmhpweb01a.dev.semantico.net 'cd /opt/semantico/slot/mp-mpdbe/1/sitecode && exec $SHELL -l' ; backblack" 

#MAT PROPS PROD
alias sshmatpropsprod1="backred && t IOS && ssh -t cspmhpweb03xa.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 
alias sshmatpropsprod2="backred && t IOS && ssh -t cspmhpweb03yb.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 

#MHE PROD
alias sshmheprodfe1="backred && t IOS && ssh -t cspmhpweb03xa.int.dyn.semcs.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 
alias sshmheprodfe2="backred && t IOS && ssh -t cspmhpweb03yb.int.dyn.semcs.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 
alias sshmheprodsolrtnl1="figlet tunnel 29102 to mhe prod solr;ssh  neilsadm@cspmhpweb03yb.int.dyn.semcs.net -L 29102:127.0.0.1:20102 cat"
#MHE TEST

alias sshmhetestfe1="backamber && t MHE && ssh -t cstmhpweb01a.test.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 
alias sshmhetestfe2="backamber && t MHE && ssh -t cstmhpweb01b.test.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 
alias sshpgmhetest="ssh -f neilsadm@db.ae.mhp.test.semantico.net -L 5433:db.ae.mhp.test.semantico.net:5432 -N"

#STAR TEST
alias sshstartestrec1="backamber && t Star && ssh -t iststar01a.test.semantico.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstartestrec2="backamber && t Star && ssh -t iststar01b.test.semantico.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstartestdb="backamber && t Star && ssh -t iststardb01b.test.semantico.net 'cd ~  && exec $SHELL -l' ; backblack"

#STAR PROD
alias sshstarprodrec1="backred && t Star && ssh -t ispstar03xa.int.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarprodrec2="backred && t Star && ssh -t ispstar03yb.int.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarprodrec3="backred && t Star && ssh -t ispstarrec03xa.int.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarprodrec4="backred && t Star && ssh -t ispstarrec03yb.int.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 

#alias sshstarproddb="backred && t Star && ssh -t ispstardb03xa.int.dyn.semcs.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"
alias sshstarproddb="backred && t Star && ssh -t fa-star-postgres-prod-01.highwire.org 'cd ~ && exec $SHELL -l' ; backblack"
alias sshstarproddbcopydb="backamber && t Star && ssh -t nstevens@bk-star-postgres-float-dev-01.highwire.org 'cd  && exec $SHELL -l' ; backblack"
alias sshstarproddbcopytnl="figlet tunnel 5431 to Star Copy Production DB;ssh  nstevens@bk-star-postgres-float-dev-01.highwire.org -L 5431:bk-star-postgres-float-dev-01.highwire.org:5432 cat"
alias sshstarprodapicopytnl="figlet tunnel 28199 to Star Copy Production API;ssh iststar03x1.int.dyn.semcs.net -L 28199:127.0.0.1:28100 cat"

alias sshstarproddbcopyapi="backamber && t Star && ssh -t iststar03x1.int.dyn.semcs.net 'cd  && exec $SHELL -l' ; backblack"

#ITHIKA STAR DATAQA
alias sshstarithdataqarec1="backred && t Star && ssh -t cspithqastar08x1.ext.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarithdataqarec2="backred && t Star && ssh -t cspithqastar08y1.ext.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarithdataqaapi1="backred && t Star && ssh -t cspithqastar08y2.ext.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 
alias sshstarithdataqaapi2="backred && t Star && ssh -t cspithqastar08x3.ext.dyn.semcs.net 'cd /opt/semantico/slot/star_receiver/1/sitecode/ && exec $SHELL -l' ; backblack" 


alias sshlbtest="backamber && t Star && ssh -t istlb01b-dmz.test.semantico.net 'cd /var/log/ && exec $SHELL -l' ; backblack" 
alias sshlbprod="backred && t Star && ssh -t isplb03yb.semantico.net 'cd /var/log/star-receiver/ && exec $SHELL -l' ; backblack" 

#CABI PROD
alias sshcabiprod1="backred && t Star && ssh -t cabisearch2.semantico.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack" 

#C5
alias sshc5dev="backamber && t 5Star && ssh -t bk-counter5-dev-01.highwire.org 'cd && exec $SHELL -l' ; backblack" 

#RMM
alias sshrmmtestfe="backamber && t rmm && ssh -t cstbwweb01i.test.semantico.net 'cd && exec $SHELL -l' ; backblack" 
alias sshrmmqaadmin="backamber && t rmm && ssh -t cspbwqarmmadmin61x1 'cd /opt/semantico/slot/rmm9-dataqa-admin/1/sitecode/ && exec $SHELL -l' ; backblack"
alias sshrmmprodadmin="backred && t rmm && ssh -t cspbwrmmadmin60x1 'cd /opt/semantico/slot/rmm9-admin/1/sitecode/ && exec $SHELL -l' ; backblack"

#RMM10
alias sshrmm10testadmin="backamber && t rmm && ssh -t cstbwrmm10admin03x1.highwire.org 'cd && exec $SHELL -l' ; backblack"
alias sshrmm10testfe1="backamber && t rmm && ssh -t cstbwrmm10web03x1.highwire.org 'cd && exec $SHELL -l' ; backblack"
alias sshrmm10uatadmin="backamber && t rmm && ssh -t cstbwuatrmm10admin03x1.highwire.org 'cd && exec $SHELL -l' ; backblack"
alias sshrmm10uatfe1="backamber && t rmm && ssh -t cstbwuatrmm10web03x1.highwire.org 'cd && exec $SHELL -l' ; backblack"
alias sshrmm10prodadmin="backred && t rmm && ssh -t cspbwrmm10admin60x1.int.dyn.semcs.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"
alias sshrmm10prodfe1="backred && t rmm && ssh -t cspbwrmm10web60x1.int.dyn.semcs.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"
alias sshrmm10prodfe2="backred && t rmm && ssh -t cspbwrmm10web60y1.int.dyn.semcs.net 'cd /opt/semantico/slot/ && exec $SHELL -l' ; backblack"

#rooks
alias sshrookstestfe="backamber && t rooks && ssh -t cstbwweb01j.test.semantico.net 'cd && exec $SHELL -l' ; backblack" 
alias sshrooksprodfe1="backred && t rooks && ssh -t cspbwrooksweb60x1.int.dyn.semcs.net 'cd && exec $SHELL -l' ; backblack" 
alias sshrooksprodfe2="backred && t rooks && ssh -t cspbwrooksweb60y1.int.dyn.semcs.net 'cd && exec $SHELL -l' ; backblack" 


#FiveStar
alias sshfstesttnl1="ssh -f bk-fivestar-app-dev-01.highwire.org -L 9000:127.0.0.1:9000 -N &"
alias sshfstesthost1="ssh bk-fivestar-app-dev-01.highwire.org"
alias sshfstesthost2="ssh bk-fivestar-app-dev-02.highwire.org"
alias sshfstesthost3="ssh bk-fivestar-app-dev-03.highwire.org"

alias sshfsprodtnl2="ssh -f bk-fivestar-app-prod-01.highwire.org -L 9000:127.0.0.1:9001 -N &"
alias sshfsprodhost1="ssh bk-fivestar-app-prod-01.highwire.org"

#COCHRANE DEV
alias sshcochdev01="ssh nstevens@bk-cochrane-support-dev-01.highwire.org"
alias sshcochdev01debugfetnl="figlet debug tunnel 8000 to Cochrane Dev 01;ssh nstevens@bk-cochrane-support-dev-01.highwire.org -L 8000:127.0.0.1:8000 cat"
alias sshcochdev01debugldtnl="figlet debug tunnel 8001 to Cochrane Dev 01;ssh nstevens@bk-cochrane-support-dev-01.highwire.org -L 8001:127.0.0.1:8001 cat"
alias sshcochdev01postgrestnl="figlet debug tunnel 5433 to Cochrane Dev 01;ssh nstevens@bk-cochrane-support-dev-01.highwire.org -L 5433:127.0.0.1:5432 cat"
alias sshcochdev02="ssh nstevens@bk-cochrane-support-dev-02.highwire.org"
alias sshcochdev03="ssh nstevens@bk-cochrane-support-dev-03.highwire.org"

#COCHRANE PROD
alias sshcochprodlifex1="backred && t coch && ssh -t cspbwgreclprt160x1.int.dyn.semcs.net 'cd && exec $SHELL -l' ; backblack"
alias sshcochprodlifey1="backred && t coch && ssh -t cspbwgreclprt160y1.int.dyn.semcs.net 'cd && exec $SHELL -l' ; backblack"
alias sshcochprodlifez1="backred && t coch && ssh -t cspbwgreclprt160z1.int.dyn.semcs.net 'cd && exec $SHELL -l' ; backblack"
alias sshcochprodsolry1z1="backred && t coch && ssh -t neilsadm@cspbwgreclsolr160x1.ext.dyn.semcs.net 'cd && exec $SHELL -l' ; backblack"


#BBYP13nREG
alias sshbbyregtest="ssh nstevens@bk-bpp-sso-dev-01.highwire.org"

#SYSLOG
alias sshsyslog="backred && ssh nstevens@fa-syslog-prod-01.highwire.org; backblack"

############## HW Services #############
alias sshhwdevswarm="backamber && ssh nstevens@fa-docker-swarm-dev-01.highwire.org; backblack" 
alias sshhwqaswarm="backamber && ssh nstevens@fa-docker-swarm-qa-01.highwire.org; backblack" 
alias sshhwprodswarm1="backred && ssh nstevens@fa-docker-swarm-prod-01.highwire.org; backblack" 
alias sshhwprodswarm2="backred && ssh nstevens@fa-docker-swarm-prod-02.highwire.org; backblack" 
alias sshhwprodswarm3="backred && ssh nstevens@fa-docker-swarm-prod-03.highwire.org; backblack" 

alias sshhwp13nmysqldev="backamber && ssh nstevens@fr-alerts-mysql-dev-01.highwire.org; backblack"
alias sshhwp13nmysqlqa="backamber && ssh nstevens@fr-alerts-mysql-qa-01.highwire.org; backblack"
alias sshhwp13nmysqlprod="backred && ssh nstevens@fr-alerts-mysql-prod-01.highwire.org; backblack"


######### Personal Dev Box in Faction #############
alias sshdevfact="ssh nstevens@fa-nstevens-dev-01.highwire.org" 

