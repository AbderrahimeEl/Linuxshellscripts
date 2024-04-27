#!/bin/bash

while true; do
    echo "Enter la note (or 'q' to quit): "
    read note

    if [ "$note" == "q" ]; then
        echo "Goodbye!"
        break
    fi
    note_int=$((note))

    if [ $note_int -ge 16 ] && [ $note_int -le 20 ]; then
        echo "Très bien"
    elif [ $note_int -ge 14 ] && [ $note_int -lt 16 ]; then
        echo "bien"
    elif [ $note_int -ge 12 ] && [ $note_int -lt 14 ]; then
        echo "Assez bien"
    elif [ $note_int -ge 10 ] && [ $note_int -lt 12 ]; then
        echo "moyenne"
    elif [ $note_int -lt 10 ]; then
        echo "Insufficient"
    else
        echo "entrer a valid nombre."
    fi
done

