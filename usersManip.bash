#!/bin/bash

afficherUtilisateurs() {
    echo "Liste des utilisateurs avec UID > 1000 :"
    awk -F: '$3 > 1000 {print $1}' /etc/passwd
}

verifierUtilisateur() {
    read -p "Veuillez saisir un login ou un UID : " input
    if id "$input" &>/dev/null; then
        echo "Informations détaillées sur l'utilisateur $input :"
        id "$input"
    else
        echo "L'utilisateur $input n'existe pas."
    fi
}

creerUtilisateur() {
    read -p "Veuillez saisir le nom de l'utilisateur à créer : " username
    if id "$username" &>/dev/null; then
        echo "L'utilisateur $username existe déjà."
        return 1
    fi
    # le script doit être exécuté par root
    if [ "$EUID" -ne 0 ]; then
        echo "Ce script doit être exécuté en tant que root."
        return 1
    fi
    if [ -d "/home/$username" ]; then
        echo "Le répertoire personnel /home/$username existe déjà."
        return 1
    fi
    useradd "$username" -m
    echo "L'utilisateur $username a été créé avec succès."
}

while true; do
    echo "Choisissez une option :"
    echo "1. Afficher la liste des utilisateurs avec UID > 1000"
    echo "2. Vérifier l'existence d'un utilisateur"
    echo "3. Créer un utilisateur"
    echo "4. Quitter"
    read -p "Votre choix : " choix
    case $choix in
        1) afficherUtilisateurs ;;
        2) verifierUtilisateur ;;
        3) creerUtilisateur ;;
        4) echo "Au revoir !"; exit ;;
        *) echo "Option invalide." ;;
    esac

    echo ""
done
