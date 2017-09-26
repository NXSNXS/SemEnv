#!/bin/bash

. ~/.bash_profile

# EXPL: simplify when r.shell -c $SHELL
if [[ $# == 2 && $1 == -c && ($2 == $SHELL || $2 == '$SHELL') ]]
then shift 2; fi

export SHELL=/bin/bash

# USE: Interactive shell
(($#)) || exec ${SHELL:?}  --init-file ~/.bash_profile

# USE: Cmdline populated with aliases
[[ $1 != -c ]] || shift
exec ${SHELL:?} -c '
(( $(id -u) )) || HOME=/home/${SUDO_USER:-${USER:-${USERNAME:?}}}
source ~/.bash_profile
eval "$@"
' "$0" "$@"

