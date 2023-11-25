#!/bin/bash
# Joaquin Escayo (jescayo@ucm.es) 2022

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

# Comprobación de que todos los meses tienen las mismas SLC

for i in *SCENDING_*; do
#for i in ASCENDING_92; do
echo "Procesando el Track "$i
echo "Procesando el Track "$i > LOGFILE_STEP1
declare -a SLC_

for z in $(seq 1 1 12); do
SLC_[$z]=$(ls -1 $i/$z/SLC/*.zip | wc -l) &> /dev/null
echo $i"/"$z" tiene "${SLC_[$z]}" imagenes"
done

#TODO: meter todo esto en una funcion para evitar repetirlo tanto.
# Genero los archivos para juntar las SLC en un solo archivo (assembly)

for z in $(seq 1 1 12); do
echo "Generando archivo para el mes $z con un total de "${SLC_[$z]}" imagenes"
echo "Generando archivo para el mes $z con un total de "${SLC_[$z]}" imagenes" >> LOGFILE_STEP1
declare -a FILE_ 				# Declaro el array FILES para cada uno de los archivos del track
# Meto los ZIPs en un array FILE
for j in $(seq 1 1 ${SLC_[$z]}); do
FILE_[$j]=$(ls $(pwd)/$i/$z/SLC/*.zip | awk 'NR=='$j'')
#echo ${FILE_[$j]}
done

IMAGENES=${#FILE_[@]}
MERGE_XML="../step1_xml/"$IMAGENES"_imagenes_JE_model_Lee7x7.xml"
mkdir -p $(pwd)/STEP1/merge_xml/$i &> /dev/null			# Creo el directorio STEP1
cp $MERGE_XML $(pwd)/STEP1/merge_xml/$i/$z"_"$IMAGENES"_imagenes_JE_model_Lee7x7.xml" 

# Cambio los valores INPUT
for x in $(seq 1 1 $IMAGENES); do
sed -i -e 's|INPUT'$x'|'${FILE_[$x]}'|g' $(pwd)/STEP1/merge_xml/$i/$z"_"$IMAGENES"_imagenes_JE_model_Lee7x7.xml"
done
# Cambio el output
sed -i -e 's|OUTPUT|'$(pwd)/STEP1/$i'_'$YEAR'_'$z'.tif|g' $(pwd)/STEP1/merge_xml/$i/$z"_"$IMAGENES"_imagenes_JE_model_Lee7x7.xml"
# FIN GENERAR ARCHIVO MERGE_XML
unset FILE_
done
unset SLC_
done

# EMPIEZO A PROCESAR LOS XML

for i in $(find $(pwd)/STEP1/merge_xml -name '*_imagenes_JE_model_Lee7x7.xml'); do
echo $(date "+%H:%M:%S") "Procesando el archivo $i"
echo $(date "+%H:%M:%S") "Procesando el archivo $i" &>> LOGFILE_STEP1
/home/jescayo/snap/bin/gpt $i &>> $i".log"
done
