#!/bin/bash
ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")" 
ABSOLUTE_PATH=$( echo $ABSOLUTE_PATH | sed 's:/*$::')
DIR_PATH=$(dirname $ABSOLUTE_PATH)


echo $ABSOLUTE_PATH
echo $DIR_PATH 

cd ${ABSOLUTE_PATH}/climatic_data/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/genetic_data/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/plot_management/maturation_data/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/plot_management/harvest_data/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/plot_management/irrigation/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/plot_management/plot_data/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/plot_management/plot_soil_texture/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/sensory_analysis/beforeBottling/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/sensory_analysis/afterBottling/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/winemaking_activities/pressing_objects/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/winemaking_activities/fermentation_objects/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/winemaking_activities/laboratory/must/initial_must_data/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/winemaking_activities/laboratory/must/laboratory_analysis_fermentation_data/ && sh run.sh   \
&& cd ${ABSOLUTE_PATH}/winemaking_activities/laboratory/wine/lab_wine_data/ && sh run.sh   \


# && cd ${ABSOLUTE_PATH}/plot_management/link_harvest_area_berry/ && sh run.sh   \
cd $DIR_PATH

rm -R ${ABSOLUTE_PATH}/rdf
mkdir -p ${ABSOLUTE_PATH}/rdf
find -iname '*.ttl' -maxdepth 1 -exec cp -f {} ${ABSOLUTE_PATH}/rdf \;
rm ${ABSOLUTE_PATH}/rdf/sample.ttl
sed -i 's/http:\/\/data.bigdatagrapes.eu\/resource\///g' ${ABSOLUTE_PATH}/rdf/*.ttl

rm ${ABSOLUTE_PATH}/global.ttl && touch ${ABSOLUTE_PATH}/global.ttl
[ -f ${ABSOLUTE_PATH}/global_datasets.ttl ] && rm ${ABSOLUTE_PATH}/global_datasets.ttl && touch ${ABSOLUTE_PATH}/global_datasets.ttl

cat ${ABSOLUTE_PATH}/rdf/*datasets.ttl >> ${ABSOLUTE_PATH}/global_datasets.ttl
rm ${ABSOLUTE_PATH}/rdf/*datasets.ttl

cat ${ABSOLUTE_PATH}/../model/prefixes.ttl >> ${ABSOLUTE_PATH}/global.ttl
echo "" >> ${ABSOLUTE_PATH}/global.ttl
for filename in ${ABSOLUTE_PATH}/rdf/*.ttl; do 
    echo "$(grep -v "@prefix" $filename)" >>${ABSOLUTE_PATH}/global.ttl
done