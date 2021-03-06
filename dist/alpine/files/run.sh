#!/bin/sh

if [ "$(id -u)" != "0" ]; then
  su - root <<! > /dev/null
alpine
chown $(id -u).$(id -g) /src /target
adduser -D -h /src -u $(id -u) hugo
!
fi

case "$1" in

    # Commands from hugo

    "benchmark")
        hugo $@
        ;;

    "config")
        hugo $@
        ;;

    "convert")
        hugo $@
        ;;

    "env")
        hugo $@
        ;;

    "gen")
        hugo $@
        ;;

    "help")
        hugo $@
        ;;

    "import")
        hugo $@
        ;;

    "list")
        hugo $@
        ;;

    "new")
        hugo $@
        ;;

    "server")
        hugo server --bind=$HUGO_BIND $(echo $* | sed "s:^server::")
        ;;

    "undraft")
        hugo $@
        ;;

    "version")
        hugo $@
        ;;

    # Commands special to docker image

    "shell")
        sh /shell.sh
        ;;

    # Default build command

    *)
        hugo $@ --destination=$HUGO_DESTINATION
        ;;

esac
