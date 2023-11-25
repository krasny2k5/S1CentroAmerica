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
rm -rf STEP3
# Creo el directorio temp
mkdir -p STEP3/

# Creating txt file 

QUARTERS="Q1 Q2 Q3 Q4"
PWD=$(pwd)

for i in $QUARTERS; do
echo "nice -n 10 gdal_merge.py -o "$PWD"/STEP3/34_136_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_34_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_136_"$YEAR"_"$i".tif" >> STEP3/commands
echo "nice -n 10 gdal_merge.py -o "$PWD"/STEP3/136_63_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_136_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_63_"$YEAR"_"$i".tif" >> STEP3/commands
echo "nice -n 10 gdal_merge.py -o "$PWD"/STEP3/63_165_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_63_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_165_"$YEAR"_"$i".tif" >> STEP3/commands
echo "nice -n 10 gdal_merge.py -o "$PWD"/STEP3/165_92_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_165_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_92_"$YEAR"_"$i".tif" >> STEP3/commands
echo "nice -n 10 gdal_merge.py -o "$PWD"/STEP3/121_48_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_121_"$YEAR"_"$i".tif "$PWD"/STEP2/ASCENDING_48_"$YEAR"_"$i".tif" >> STEP3/commands
echo "nice -n 10 gdal_merge.py -o "$PWD"/STEP3/11_113_"$YEAR"_"$i".tif "$PWD"/STEP2/DESCENDING_11_"$YEAR"_"$i".tif "$PWD"/STEP2/DESCENDING_113_"$YEAR"_"$i".tif" >> STEP3/commands
done

parallel --will-cite -j 3 < STEP3/commands
