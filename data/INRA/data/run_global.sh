
sh ./climatic_data/run.sh   \
&& sh . ./genetic_data/run.sh  \
&& sh ./plot_management/maturation_data/run.sh \
&& sh ./plot_management/harvest_data/run.sh \
&& sh ./plot_management/irrigation/run.sh \
&& sh ./plot_management/plot_data/run.sh \
&& sh ./plot_management/link_harvest_area_berry/run.sh \
&& sh ./plot_management/plot_soil_texture/run.sh \
&& sh ./sensory_analysis/beforeBottling/run.sh \
&& sh ./sensory_analysis/afterBottling/run.sh \
&& sh ./winemaking_activities/pressing_objects/run.sh \
&& sh ./winemaking_activities/fermentation_objects/run.sh \
&& sh ./winemaking_activities/laboratory/must/initial_must_data/run.sh \
&& sh ./winemaking_activities/laboratory/must/laboratory_analysis_fermentation_data/run.sh \
&& sh ./winemaking_activities/laboratory/wine/lab_wine_data/run.sh

rm -R ./rdf
mkdir ./rdf
find -iname '*.ttl' -exec cp {} ./rdf \;
rm ./rdf/sample.ttl
rm global.ttl && touch global.ttl

# cat ../../../model/prefixes.ttl >> global.ttl
# echo "" >> global.ttl
for filename in ./rdf/*.ttl; do 
    echo "$(grep -v "@prefix" $filename)" >> global.ttl
done