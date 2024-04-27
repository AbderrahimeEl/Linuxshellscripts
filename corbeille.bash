#!/bin/bash

corbeille="$HOME/corbeille"
if [ ! -d "$corbeille" ]; then
    mkdir "$corbeille"
fi
case "$1" in
    -l)
        ls -l "$corbeille"
        ;;
    -r)
        rm -rf "$corbeille"/*
        echo "La corbeille est vidée."
        ;;
    *)
        if [ "$#" -eq 0 ]; then
            echo "Utilisation :  -l  (lister)  -r  (vider) fichier1 fichier2 ..."
            exit 1
        else
            mv "$@" "$corbeille"
            echo "Les fichiers ont été déplacés vers la corbeille."
        fi
        ;;
esac
exit 0
