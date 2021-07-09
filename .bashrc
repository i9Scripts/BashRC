#-----------------------------------------------
# Configurações Gerais
#-----------------------------------------------
 
# Se não estiver rodando interativamente, não fazer nada
[ -z "$PS1" ] && return
 
# Não armazenar as linhas duplicadas ou linhas que começam com espaço no historico
HISTCONTROL=ignoreboth
 
# Adicionar ao Historico e não substitui-lo
shopt -s histappend
 
# Definições do comprimento e tamnho do historico.
HISTSIZE=1000
HISTFILESIZE=2000
source ~/.get_branch.bash
#===========================================
# Váriavies com as Cores
#===========================================
NONE="\[\033[0m\]" # Eliminar as Cores, deixar padrão)
 
## Cores de Fonte
K="\[\033[0;30m\]" # Black (Preto)
R="\[\033[0;31m\]" # Red (Vermelho)
G="\[\033[0;32m\]" # Green (Verde)
Y="\[\033[0;33m\]" # Yellow (Amarelo)
B="\[\033[0;34m\]" # Blue (Azul)
M="\[\033[0;35m\]" # Magenta (Vermelho Claro)
C="\[\033[0;36m\]" # Cyan (Ciano - Azul Claro)
W="\[\033[0;37m\]" # White (Branco)
 
## Efeito Negrito (bold) e cores
BK="\[\033[1;30m\]" # Bold+Black (Negrito+Preto)
BR="\[\033[1;31m\]" # Bold+Red (Negrito+Vermelho)
BG="\[\033[1;32m\]" # Bold+Green (Negrito+Verde)
BY="\[\033[1;33m\]" # Bold+Yellow (Negrito+Amarelo)
BB="\[\033[1;34m\]" # Bold+Blue (Negrito+Azul)
BM="\[\033[1;35m\]" # Bold+Magenta (Negrito+Vermelho Claro)
BC="\[\033[1;36m\]" # Bold+Cyan (Negrito+Ciano - Azul Claro)
BW="\[\033[1;37m\]" # Bold+White (Negrito+Branco)
 
## Cores de fundo (backgroud)
BGK="\[\033[40m\]" # Black (Preto)
BGR="\[\033[41m\]" # Red (Vermelho)
BGG="\[\033[42m\]" # Green (Verde)
BGY="\[\033[43m\]" # Yellow (Amarelo)
BGB="\[\033[44m\]" # Blue (Azul)
BGM="\[\033[45m\]" # Magenta (Vermelho Claro)
BGC="\[\033[46m\]" # Cyan (Ciano - Azul Claro)
BGW="\[\033[47m\]" # White (Branco)
 
#=============================================
# Configurações referentes ao usuário
#=============================================
 
## Verifica se é usuário root (UUID=0) ou usuário comum
# if [ $UID -eq "0" ]; then
 
# ## Cores e efeitos do Usuario root
 
# PS1="$G┌─[$BR\u$G]$BY@$G[$BW${HOSTNAME%%.*}$G]$B:\w\n$G└──>$BR \\***> $NONE"
 
# else
 
# ## Cores e efeitos do usuário comum
 
#   PS1="$BR┌─[$BG${HOSTNAME%%.*}$BR]$B:\w\n$BR└──>$BG \\***> $NONE"

# fi # Fim da condição if
 
## Add branch to PS1 
#export GIT_PS1_SHOWDIRTYSTATE=1
#export PS1="$R┌─[$G\$be_get_branch${PS1}$G\t\n$R└────╼$W>"
export PS1="$R┌─[$G\u @ \W$(__git_ps1 " (%s)")$R] \n$R└──(⌐•⌣•)>$W"

#export PS1="$R┌─[$G$be_get_branch${PS1}$G\n$R└──(⌐•⌣•)>$W"
function dirname() {
  local dir="${1%${1##*/}}"
  "${dir:=./}" != "/" && dir="${dir%?}"
  echo "$dir"
}
## Exemplos de PS1
 
# export PS1='\n\e[1;30m[\j:\!\e[1;30m]\e[0;36m \T \d \e[1;30m[\e[1;34m\u@\H\e[1;30m:\e[0;37m`tty 2>/dev/null` \e[0;32m+${SHLVL}\e[1;30m] \e[1;37m\w\e[0;37m\[\033]0;[ ${H1}... ] \w - \u@\H +$SHLVL @`tty 2>/dev/null`  '

# export PS1='\w$(__git_ps1 " (%s)\ $? ")\***> '
# export PS1="\$be_get_branch "$2"${PS1}***>";
# export PS1="$BR┌─[$BG\${HOSTNAME%%.*}]$B:\w\n$BR└──>$BW\\***>"
# Faster (1ms vs 5ms) than /usr/bin/dirname
# PS1="\e[01;31m┌─[\e[01;35m\u\e[01;31m]──[\e[00;37m${HOSTNAME%%.*}\e[01;32m]:\w$\e[01;31m\n\e[01;31m└──\e[01;36m>>\e[00m"
 
# PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '}
 
# PS1="\e[01;31m┌─[\e[01;35m\u\e[01;31m]──[\e[00;37m${HOSTNAME%%.*}\e[01;32m]:\w$\e[01;31m\n\e[01;31m└──\e[01;36m>>\e[00m"
 
# PS1="┌─[\[\e[34m\]\h\[\e[0m\]][\[\e[32m\]\w\[\e[0m\]]\n└─╼ "
 
# PS1='[\u@\h \W]\$ '
 
# export GIT_PS1_SHOWDIRTYSTATE=1
# export PS1='\w$(__git_ps1 " (%s)\ $? ")\***> '

function lf
{ 
    ls --color=tty --classify $*
    echo "$(ls -l $* | wc -l) files"
}