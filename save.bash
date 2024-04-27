#!/bin/bash

currentDir=$(pwd)
backupDir="$currentDir/OLD"

if [ ! -d "$backupDir" ]; then
    mkdir "$backupDir"
    if [ $? -ne 0 ]; then
        echo "Erreur : Impossible de créer le répertoire de sauvegarde."
        exit 1
    fi
fi

currentDate=$(date +"%Y-%m-%d")

for file in "$currentDir"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        newFilename="${filename}#${currentDate}"
        cp "$file" "$backupDir/$newFilename"
        if [ $? -ne 0 ]; then
            echo "Erreur : Impossible de copier le fichier $filename."
        else
            echo "Fichier $filename sauvegardé avec succès dans $backupDir/$newFilename."
        fi
    fi
done