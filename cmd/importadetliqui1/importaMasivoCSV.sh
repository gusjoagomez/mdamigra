#!/bin/bash

directory="/home/ntbdesa/go/src/mdamigra/detalleliqui"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "NO existe directorio: $directory "
    exit 1
fi

# Iterate over CSV files in the directory
for file in "$directory"/*.csv; do
    echo "======================================================================="
    if [ -f "$file" ]; then
        echo "Procesando archivo: $file"
	go run detalleliquidacion1.go $file
    fi
    echo "======================================================================="
done

