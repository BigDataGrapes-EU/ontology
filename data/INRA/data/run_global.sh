#!/bin/bash
ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")" 
ABSOLUTE_PATH=$( echo $ABSOLUTE_PATH | sed 's:/*$::')
DIR_PATH=$(dirname $ABSOLUTE_PATH)


echo $ABSOLUTE_PATH
echo $DIR_PATH 

cd ${DIR_PATH}/climatic_data/ && sh run.sh   \
&& cd ${DIR_PATH}/genetic_data/ && sh run.sh   \
&& cd ${DIR_PATH}/plot_management/maturation_data/ && sh run.sh   \
&& cd ${DIR_PATH}/plot_management/harvest_data/ && sh run.sh   \
&& cd ${DIR_PATH}/plot_management/irrigation/ && sh run.sh   \
&& cd ${DIR_PATH}/plot_management/plot_data/ && sh run.sh   \
&& cd ${DIR_PATH}/plot_management/plot_soil_texture/ && sh run.sh   \
&& cd ${DIR_PATH}/sensory_analysis/beforeBottling/ && sh run.sh   \
&& cd ${DIR_PATH}/sensory_analysis/afterBottling/ && sh run.sh   \
&& cd ${DIR_PATH}/winemaking_activities/pressing_objects/ && sh run.sh   \
&& cd ${DIR_PATH}/winemaking_activities/fermentation_objects/ && sh run.sh   \
&& cd ${DIR_PATH}/winemaking_activities/laboratory/must/initial_must_data/ && sh run.sh   \
&& cd ${DIR_PATH}/winemaking_activities/laboratory/must/laboratory_analysis_fermentation_data/ && sh run.sh   \
&& cd ${DIR_PATH}/winemaking_activities/laboratory/wine/lab_wine_data/ && sh run.sh   \


# && cd ${DIR_PATH}/plot_management/link_harvest_area_berry/ && sh run.sh   \
cd $DIR_PATH

rm -R ${DIR_PATH}/rdf
mkdir -p ${DIR_PATH}/rdf
find -iname '*.ttl'  -exec cp -f {} ${DIR_PATH}/rdf \;
rm ${DIR_PATH}/rdf/sample.ttl
sed -i 's/http:\/\/data.bigdatagrapes.eu\/resource\///g' ${DIR_PATH}/rdf/*.ttl

rm ${DIR_PATH}/global.ttl && touch ${DIR_PATH}/global.ttl
[ -f ${DIR_PATH}/global_datasets.ttl ] && rm ${DIR_PATH}/global_datasets.ttl && touch ${DIR_PATH}/global_datasets.ttl

cat ${DIR_PATH}/rdf/*datasets.ttl >> ${DIR_PATH}/global_datasets.ttl
rm ${DIR_PATH}/rdf/*datasets.ttl

cat ${DIR_PATH}/../model/prefixes.ttl >> ${DIR_PATH}/global.ttl
echo "" >> ${DIR_PATH}/global.ttl
for filename in ${DIR_PATH}/rdf/*.ttl; do 
    echo "$(grep -v "@prefix" $filename)" >>${DIR_PATH}/global.ttl
done