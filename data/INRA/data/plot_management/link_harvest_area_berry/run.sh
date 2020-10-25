#!/usr/bin/env bash
curl "https://docs.google.com/spreadsheets/d/1lWEwwonC0Dg8MAWDSVm7GV184N7jGt-IhjXmdE4Y-oo/gviz/tq?tqx=out:csv&gid=623977456" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl harvestingObject.tarql > rdf/harvest_objects.ttl
sed -i 's/<qb4st:RefArea>/qb4st:RefArea/g' rdf/harvest_objects.ttl
sed -i 's/<bdg:plot>/bdg:plot/g' rdf/harvest_objects.ttl
sed -i 's/<bdg:subPlot>/bdg:subPlot/g' rdf/harvest_objects.ttl
