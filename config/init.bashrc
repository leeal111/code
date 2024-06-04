# add proxy
export hostip="127.0.0.1"
export socks_hostport=7890
export http_hostport=7890
alias proxy='
    export https_proxy="http://${hostip}:${http_hostport}"
    export http_proxy="http://${hostip}:${http_hostport}"
    export ALL_PROXY="socks5://${hostip}:${socks_hostport}"
    export all_proxy="socks5://${hostip}:${socks_hostport}"
'
alias unproxy='
    unset ALL_PROXY
    unset https_proxy
    unset http_proxy
    unset all_proxy
'
alias echoproxy='
    echo $ALL_PROXY
    echo $all_proxy
    echo $https_proxy
    echo $http_proxy
'
#end proxy

export PATH="$PATH:/opt/nvim-linux64/bin"
alias v="nvim"