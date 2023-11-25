#!/bin/bash
# Joaquin Escayo (jescayo@ucm.es) 2022
# Program to check the orbit and track of Sentinel-1 files within a directory.

rm errors.txt &> /dev/null
rm report.txt &> /dev/null

if [ -z $1 ]; then
echo "Debes introducir el año a procesar"
exit
else
echo "Procesando el año "$1
fi

YEAR=$1

NUMERO_TRACKS=$(ls -1d $YEAR/*SCENDING_* | wc -l)
echo "Se han encontrado "$NUMERO_TRACKS "tracks a procesar."

# Entro al directorio del año
cd $YEAR

for i in S1*.zip; do
rm manifest.safe &> /dev/null
FECHA=$(echo $i | cut -c18-25)
MES=$(echo $i | cut -c22-23)
YEAR=$(echo $i  | cut -c18-21)
FOLDER=$(echo $i | sed 's/zip/SAFE/g')
unzip -j $i $FOLDER/manifest.safe -d . &> /dev/null
if [ $? -eq 0 ]; then
TRACK=$(xmlstarlet sel -N oe="http://schemas.dmtf.org/ovf/environment/1" -N ve="http://www.vmware.com/schema/ovfenv" --net -t -v '//safe:relativeOrbitNumber[@type="start"]' -n manifest.safe)
ORBIT=$(xmlstarlet sel -N oe="http://schemas.dmtf.org/ovf/environment/1" -N ve="http://www.vmware.com/schema/ovfenv" --net -t -v '//s1:pass' -n manifest.safe)
echo "FILE: "$i" Track: "$TRACK" ORBIT: "$ORBIT
echo "FILE: "$i" Track: "$TRACK" ORBIT: "$ORBIT >> report.txt
mkdir -p $ORBIT"_"$TRACK/$MES/SLC &> /dev/null
mkdir -p $ORBIT"_"$TRACK/$MES/NOT_USED &> /dev/null
mv $i $ORBIT"_"$TRACK/$MES/SLC
else
echo " ERROR ON FILE "$i" !!!!!!!!!!"
echo " ERROR ON FILE "$i" !!!!!!!!!!" &> errors.txt
fi
done

rm manifest.safe
for i in *SCENDI*; do cd $i; mv 01 1; mv 02 2; mv 03 3; mv 04 4; mv 05 5; mv 06 6; mv 07 7; mv 08 8; mv 09 9; cd ..; done
