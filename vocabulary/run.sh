#!/usr/bin/env bash


#Measures
curl "https://docs.google.com/spreadsheets/d/1gu1RLLgaRHAYFp9LxYPVyYl2ad6Dlo-ZbqakyXJGeYo/gviz/tq?tqx=out:csv&sheet=Measures" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl tarql/measures.tarql > rdf/measures.ttl
#Attributes
curl "https://docs.google.com/spreadsheets/d/1gu1RLLgaRHAYFp9LxYPVyYl2ad6Dlo-ZbqakyXJGeYo/gviz/tq?tqx=out:csv&sheet=Attributes" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl tarql/attributes.tarql > rdf/attributes.ttl

#Dimensions
curl "https://docs.google.com/spreadsheets/d/1gu1RLLgaRHAYFp9LxYPVyYl2ad6Dlo-ZbqakyXJGeYo/gviz/tq?tqx=out:csv&sheet=Dimensions" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl tarql/dimensions.tarql > rdf/dimensions.ttl

#RDF-ize coded list master sheet
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=Master" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl tarql/codedLists.tarql > rdf/codedLists.ttl

#Measurement Contexts
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=measurementContext" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl  tarql/measurementContexts.tarql > rdf/measurementContext.ttl

#Assay Compound coded list
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=assayCompound" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl tarql/codedValues.tarql > rdf/assayCompound.ttl

#Grape Variety coded list
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=grapeVariety" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl  tarql/codedValues.tarql > rdf/grapeVariety.ttl

#Sensory Flavor coded list
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=sensoryFlavor" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl  tarql/codedValues.tarql > rdf/sensoryFlavor.ttl

#Compass
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=compass" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl  tarql/compass.tarql > rdf/compass.ttl

#Radiation Level
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=radiationLevel" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl  tarql/codedValues.tarql > rdf/radiationLevel.ttl

#Statistical Summary
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=statisticalSummary" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl  tarql/codedValues.tarql > rdf/statisticalSummary.ttl

#NDRE Version
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=ndreVersion" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl  tarql/codedValues.tarql > rdf/ndreVersion.ttl

#Satellite
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=satellite" | ../bin/my-tarql "-d , --stdin" ../model/prefixes.ttl  tarql/codedValues.tarql > rdf/satellite.ttl

#Concatenate vocabulary
cat rdf/* | riot --syntax=ttl --formatted=ttl> bdg.ttl