#!/usr/bin/env bash

#RDF-ize master sheet
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=Master" | ./my-tarql "-d , --stdin" ../../model/prefixes.ttl codedLists.tarql > rdf/codedLists.ttl

#Assay Compound
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=assayCompound" | ./my-tarql "-d , --stdin" ../../model/prefixes.ttl codedValues.tarql > rdf/assayCompound.ttl

#Grape Variety
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=grapeVariety" | ./my-tarql "-d , --stdin" ../../model/prefixes.ttl  codedValues.tarql > rdf/grapeVariety.ttl


