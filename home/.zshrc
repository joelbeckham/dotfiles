# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/joelbeckham/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  kubectl
  terraform
  aws
  docker
  docker-compose
  vagrant
)

source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

################
# Prompt
################
# Orig - PROMPT='$FG[015][$FG[010]%n@%m$FG[015]][$FG[244]%t$FG[015]][$FG[087]%~$FG[015]]$FG[010]$(git_prompt_info)$FG[015]-> '
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%~%b $FG[010]$(git_prompt_info)$FG[015]'
 
################
# NPM
################
export NPM_TOKEN=
export NPM_EMAIL=joel@bombbomb.com
# teamcity
#export NPM_TOKEN=getityoself
#export NPM_EMAIL=devops@bombbomb.com
 
 
################
# AWS Functions
################
function aws-switch() {
    case ${1} in
        "")
            unset AWS_PROFILE
            unset AWS_SDK_LOAD_CONFIG
            ;;
        clear)
            unset AWS_PROFILE
            unset AWS_SDK_LOAD_CONFIG
            ;;
        *)
            export AWS_PROFILE="${1}"
            export AWS_SDK_LOAD_CONFIG=1
            ;;
    esac
}
_aws-switch() {
 
    local -a aws_profiles
 
    aws_profiles=$( \
        grep '\[profile' ~/.aws/config \
        | awk '{sub(/]/, "", $2); print $2}' \
        | while read -r profile; do echo -n "$profile "; done \
    )
 
#    _arguments \
#        ':Aws profile:($(echo ${aws_profiles}) clear)'
}
 
_aws-switch "$@"
 
autoload -U +X bashcompinit && bashcompinit
 
######################################################################
## Aliases
######################################################################
# git aliases
alias gl="git log --oneline"
alias gnb="git checkout -b "
alias gc="git commit -m "
# terragrunt aliases
alias ti="terragrunt init"
alias tp="terragrunt plan"
alias ta="terragrunt apply"
alias timp="terragrunt import"
# kubernetes aliases
alias k="kubectl"
alias kp="kubectl get pods"
alias kpa="kubectl get pods --all-namespaces"
alias kpag="kubectl get pods --all-namespaces | grep"
alias kpg="kubectl get pods | grep"
alias kpw="kubectl get pods -o wide"
alias kpwg="kubectl get pods -o wide | grep"
alias kpaw="kubectl get pods -o wide --all-namespaces"
alias kpawg="kubectl get pods -o wide --all-namespaces | grep"
alias kpbad="kubectl get pods -o wide --all-namespaces | grep -vE 'Running|Completed'"
alias keg="kubectl get events | grep"
alias ks="kubectl get services"
alias ksg="kubectl get services | grep"
alias ki="kubectl get ingress"
alias kig="kubectl get ingress | grep"
alias kcc="kubectl config current-context"
alias kuc="kubectl config use-context"
alias kcurl="kubectl run -i --tty --rm --image=radial/busyboxplus:curl --restart=Never curl -- sh"
alias mk="minikube"
alias msu="minikube service --url"
# docker aliases
alias dimg="docker images"
alias dimgg="docker images | grep"
alias dps="docker ps"
alias db="docker build"
alias dk="docker kill"
# dns stuff
alias ns="nslookup"
alias nsbust="dscacheutil -flushcache"
alias nsns="nslookup -query=ns"
alias nscname="nslookup -query=cname"
alias ttl="dig +noauthority +noquestion +nostats"
kn() {
    kubectl config set-context --current --namespace="$1"
}
kcurlname() {
    kubectl run -i --tty --rm --image=radial/busyboxplus:curl --restart=Never $1 -- sh
}
kld() {
    kubectl logs --all-containers=true --follow deployment/$1
}
kegtop() {
    kubectl get events --sort-by=".lastTimestamp" | grep $1 | tail -n 20 -r
}
ketop() {
    kubectl get events --sort-by=".lastTimestamp" | tail -n 20 -r
}
#kca() {
#    kubectl logs -n kube-system $(kpawg cluster-autoscaler | awk '{print$2}') | tail -n 50
#}
######################################################################
## chad alias
######################################################################
# Base
alias ll='ls -alF'
alias l='ls -CF'
alias la='ls -la'
alias lass='ls -la | less'
 
#Take me somewhere please follow the verb.location naming
alias to.logs='cd /var/log'
 
################
# Recall
################
# nc -zvw3 192.168.1.8 22
# nc -tvz 192.168.1.8 22
 
########################################################################################
# Login
########################################################################################
clear
echo "==> Yay!"
 
########################################################################################

source ~/.bash_aliases
