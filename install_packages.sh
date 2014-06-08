#!/bin/sh

set -o errexit
set -o nounset

fatal() { echo "$@" 1>&2 && exit 1; }

install() {
    local args="$@"
    local distro="$(echo $(lsb_release -d | cut -d':' -f2))"

    case "${distro}" in
        Ubuntu*) installer="apt-get install" ;;
        *)       fatal "unsupported distribution ${distro}" ;;
    esac

    sudo ${installer} ${args}
}

# systems stuff
install man
install curl

# development stuff
install build-essential
install git
install tmux
install vim
install cloc
install ant

# python stuff
install python
install python3
curl https://bootstrap.pypa.io/get-pip.py | sudo python
sudo pip install ipython
sudo pip install virtualenv
