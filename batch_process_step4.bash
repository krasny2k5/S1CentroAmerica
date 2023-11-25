#!/bin/bash
# Joaquin Escayo (jescayo@ucm.es) 2022

JOBS=6 			# Define el numero de trabajos para procesar en paralelo

if [ -z $1 ]; then
echo "Debes introducir el año a procesar"
exit
else
echo "Procesando el año "$1
fi
MAIN_PWD=$(pwd)
YEAR=$1
cd $YEAR # Trabajo desde el directorio del año que estoy procesando
PWD=$(pwd)

rm -rf STEP4
# Creo el directorio temp
mkdir -p STEP4/log

# Creating txt file

QUARTERS="Q1 Q2 Q3 Q4"
H34_136="01 02 03 04 07 08 09"									#7 hojas
H136_63="05 06 10 11 12 13 14 17 18 19 20 21 15"						#13 hojas
H63_165="22 23 24 25 26 27 28 29 30 31 32 37 38 39 16"					#15 hojas
H165_92="33 34 35 36 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59"	#24 hojas
H11_113="60 61 62 63 64"									#5 hojas
H121_48="65 66 67 68 69 70 71 72 73 74 75"						#11 hojas


for i in $H34_136; do
for j in $QUARTERS; do
echo "gdalwarp -srcnodata 0 -dstnodata nan -cutline "$MAIN_PWD"/cutlines/id_"$i".shp -crop_to_cutline "$PWD"/STEP3/34_136_"$YEAR"_"$j".tif "$PWD"/STEP4/"$YEAR"_H"$i"_"$j".tif &> "$PWD"/STEP4/log/"$YEAR"_H"$i"_"$j".tif.log" >> STEP4/commands
#METADATA
echo "The following Sentinel-1 SLC files have been used to generate this product:" > $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
if [[ $j == "Q1" ]]; then
echo "TRACK 34 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 136 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q2" ]]; then
echo "TRACK 34 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/4/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 136 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/4/SLC >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q3" ]]; then
echo "TRACK 34 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/7/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 136 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/7/SLC/>> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
else
echo "TRACK 34 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_34/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 136 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
fi
done
done

for i in $H136_63; do
for j in $QUARTERS; do
echo "gdalwarp -srcnodata 0 -dstnodata nan -cutline "$MAIN_PWD"/cutlines/id_"$i".shp -crop_to_cutline "$PWD"/STEP3/136_63_"$YEAR"_"$j".tif "$PWD"/STEP4/"$YEAR"_H"$i"_"$j".tif &> "$PWD"/STEP4/log/"$YEAR"_H"$i"_"$j".tif.log" >> STEP4/commands
#METADATA
echo "The following Sentinel-1 SLC files have been used to generate this product:" > $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
if [[ $j == "Q1" ]]; then
echo "TRACK 136 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 63 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q2" ]]; then
echo "TRACK 136 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/4/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 63 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/4/SLC >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q3" ]]; then
echo "TRACK 136 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/7/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 63 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/7/SLC/>> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
else
echo "TRACK 136 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_136/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 63 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
fi
done
done

for i in $H63_165; do
for j in $QUARTERS; do
echo "gdalwarp -srcnodata 0 -dstnodata nan -cutline "$MAIN_PWD"/cutlines/id_"$i".shp -crop_to_cutline "$PWD"/STEP3/63_165_"$YEAR"_"$j".tif "$PWD"/STEP4/"$YEAR"_H"$i"_"$j".tif &> "$PWD"/STEP4/log/"$YEAR"_H"$i"_"$j".tif.log" >> STEP4/commands
#METADATA
echo "The following Sentinel-1 SLC files have been used to generate this product:" > $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
if [[ $j == "Q1" ]]; then
echo "TRACK 63 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 165 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q2" ]]; then
echo "TRACK 63 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/4/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 165 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/4/SLC >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q3" ]]; then
echo "TRACK 63 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/7/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 165 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/7/SLC/>> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
else
echo "TRACK 63 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_63/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 165 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
fi
done
done

for i in $H165_92; do
for j in $QUARTERS; do
echo "gdalwarp -srcnodata 0 -dstnodata nan -cutline "$MAIN_PWD"/cutlines/id_"$i".shp -crop_to_cutline "$PWD"/STEP3/165_92_"$YEAR"_"$j".tif "$PWD"/STEP4/"$YEAR"_H"$i"_"$j".tif &> "$PWD"/STEP4/log/"$YEAR"_H"$i"_"$j".tif.log" >> STEP4/commands
#METADATA
echo "The following Sentinel-1 SLC files have been used to generate this product:" > $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
if [[ $j == "Q1" ]]; then
echo "TRACK 165 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 92 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q2" ]]; then
echo "TRACK 165 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/4/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 92 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/4/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q3" ]]; then
echo "TRACK 165 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/7/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 92 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/7/SLC/>> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
else
echo "TRACK 165 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_165/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 92 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_92/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
fi
done
done

for i in $H11_113; do
for j in $QUARTERS; do
echo "gdalwarp -srcnodata 0 -dstnodata nan -cutline "$MAIN_PWD"/cutlines/id_"$i".shp -crop_to_cutline "$PWD"/STEP3/11_113_"$YEAR"_"$j".tif "$PWD"/STEP4/"$YEAR"_H"$i"_"$j".tif &> "$PWD"/STEP4/log/"$YEAR"_H"$i"_"$j".tif.log" >> STEP4/commands
#METADATA
echo "The following Sentinel-1 SLC files have been used to generate this product:" > $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
if [[ $j == "Q1" ]]; then
echo "TRACK 11 DESCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 113 DESCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q2" ]]; then
echo "TRACK 11 DESCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/4/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 113 DESCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/4/SLC >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q3" ]]; then
echo "TRACK 11 DESCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/7/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 113 DESCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/7/SLC/>> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
else
echo "TRACK 11 DESCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_11/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 113 DESCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/DESCENDING_113/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
fi
done
done

for i in $H121_48; do
for j in $QUARTERS; do
echo "gdalwarp -srcnodata 0 -dstnodata nan -cutline /home/jescayo/GRHD_ASC/cutlines/id_"$i".shp -crop_to_cutline "$PWD"/STEP3/121_48_"$YEAR"_"$j".tif "$PWD"/STEP4/"$YEAR"_H"$i"_"$j".tif &> "$PWD"/STEP4/log/"$YEAR"_H"$i"_"$j".tif.log" >> STEP4/commands
#METADATA
echo "The following Sentinel-1 SLC files have been used to generate this product:" > $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
if [[ $j == "Q1" ]]; then
echo "TRACK 121 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 48 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/1/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/2/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/3/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q2" ]]; then
echo "TRACK 121 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/4/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 48 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/4/SLC >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/5/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/6/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
elif [[ $j == "Q3" ]]; then
echo "TRACK 121 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/7/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 48 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/7/SLC/>> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/8/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/9/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
else
echo "TRACK 121 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_121/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
echo "TRACK 48 ASCENDING" >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/10/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/11/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
ls -1 $MAIN_PWD/$YEAR/ASCENDING_48/12/SLC/ >> $PWD"/STEP4/"$YEAR"_H"$i"_"$j".txt"
fi
done
done

echo "Empiezo a procesar en paralelo"

parallel --will-cite -j $JOBS < STEP4/commands
