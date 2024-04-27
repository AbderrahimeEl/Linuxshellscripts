#!/bin/bash

numberOfParam=$#
name=$0
thirdParam=$3
listeParam="$@"

echo "Bonjour, vous avez rentré $numberOfParam paramètres."
echo "Le nom du script est $name."
echo "Le 3ème paramètre est $thirdParam."
echo "Voici la liste des paramètres : $listeParam"
