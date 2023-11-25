#!/bin/bash
# Joaquin Escayo (jescayo@ucm.es) 2022

if [ -z $1 ]; then
echo "Debes introducir el año a procesar"
exit
else
echo "Procesando el año "$1
fi

YEAR=$1
cd $YEAR # Trabajo desde el directorio del año que estoy procesando
PWD=$(pwd)

rm -rf STEP5
# Creo el directorio temp
mkdir -p STEP5/log

# Creating txt file

for i in $PWD/STEP4/*.tif; do
NAME=$(basename $i | cut -f 1 -d '.')
echo "zip -j "$PWD"/STEP5/"$NAME".zip "$i" "$PWD"/STEP4/"$NAME".txt &> "$PWD"/STEP5/log/"$NAME".log" >> $PWD/STEP5/commands
done

# Processing START
parallel --will-cite -j 10 < STEP5/commands


# DATA UPLOAD
# START DATA UPLOAD
cd STEP5
ls *.zip > lista_archivos.txt
cd ..
rclone copy STEP5/ gdrive_ruben:/joaquin/$YEAR"_V2"/ --include-from=STEP5/lista_archivos.txt -v
