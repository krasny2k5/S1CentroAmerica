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

NUMERO_TRACKS=$(ls -1d *SCENDING_* | wc -l)
echo "Se han encontrado "$NUMERO_TRACKS "tracks a procesar."

# Creo el directorio temp
mkdir -p STEP2/temp

#for i in ASCENDING_121; do # USE THIS FOR TESTING
for i in *SCENDING_*; do
echo "Procesando el Track "$i

# Creating Q1
echo "Creating "$i" Q1"
gdal_merge.py -separate $(pwd)/STEP1/$i'_'$YEAR'_1.tif' $(pwd)/STEP1/$i'_'$YEAR'_2.tif' $(pwd)/STEP1/$i'_'$YEAR'_3.tif' -o $(pwd)/STEP2/$i"_"$YEAR"_Q1.tif"
#gdalwarp -srcnodata 0 -dstnodata nan $(pwd)/STEP2/temp/$i"_"$YEAR"_Q1_temp.tif" $(pwd)/STEP2/$i"_"$YEAR"_Q1.tif" -overwrite

# Creating Q2
echo "Creating "$i" Q2"
gdal_merge.py -separate $(pwd)/STEP1/$i'_'$YEAR'_4.tif' $(pwd)/STEP1/$i'_'$YEAR'_5.tif' $(pwd)/STEP1/$i'_'$YEAR'_6.tif' -o $(pwd)/STEP2/$i"_"$YEAR"_Q2.tif"
#gdalwarp -srcnodata 0 -dstnodata nan $(pwd)/STEP2/temp/$i"_"$YEAR"_Q2_temp.tif" $(pwd)/STEP2/$i"_"$YEAR"_Q2.tif" -overwrite

# Creating Q3
echo "Creating "$i" Q3"
gdal_merge.py -separate $(pwd)/STEP1/$i'_'$YEAR'_7.tif' $(pwd)/STEP1/$i'_'$YEAR'_8.tif' $(pwd)/STEP1/$i'_'$YEAR'_9.tif' -o $(pwd)/STEP2/$i"_"$YEAR"_Q3.tif"
#gdalwarp -srcnodata 0 -dstnodata nan $(pwd)/STEP2/temp/$i"_"$YEAR"_Q3_temp.tif" $(pwd)/STEP2/$i"_"$YEAR"_Q3.tif" -overwrite

# Creating Q4
echo "Creating "$i" Q4"
gdal_merge.py -separate $(pwd)/STEP1/$i'_'$YEAR'_10.tif' $(pwd)/STEP1/$i'_'$YEAR'_11.tif' $(pwd)/STEP1/$i'_'$YEAR'_12.tif' -o $(pwd)/STEP2/$i"_"$YEAR"_Q4.tif"
#gdalwarp -srcnodata 0 -dstnodata nan $(pwd)/STEP2/temp/$i"_"$YEAR"_Q4_temp.tif" $(pwd)/STEP2/$i"_"$YEAR"_Q4.tif" -overwrite

done

#rm -rf STEP2/temp # Delete temp files
