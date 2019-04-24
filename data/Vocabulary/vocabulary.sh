#!/usr/bin/env bash


#Measures
curl "https://docs.google.com/spreadsheets/d/1gu1RLLgaRHAYFp9LxYPVyYl2ad6Dlo-ZbqakyXJGeYo/gviz/tq?tqx=out:csv&sheet=Measures" | ../bin/my-tarql "-d , --stdin" ../../model/prefixes.ttl measures.tarql > rdf/measures.ttl
#Attributes
curl "https://docs.google.com/spreadsheets/d/1gu1RLLgaRHAYFp9LxYPVyYl2ad6Dlo-ZbqakyXJGeYo/gviz/tq?tqx=out:csv&sheet=Attributes" | ../bin/my-tarql "-d , " ../../model/prefixes.ttl attributes.tarql > rdf/attributes.ttl

#Dimensions
curl "https://docs.google.com/spreadsheets/d/1gu1RLLgaRHAYFp9LxYPVyYl2ad6Dlo-ZbqakyXJGeYo/gviz/tq?tqx=out:csv&sheet=Dimensions" | ../bin/my-tarql "-d , " ../../model/prefixes.ttl dimensions.tarql > rdf/dimensions.ttl

#RDF-ize coded list master sheet
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=Master" | ../bin/my-tarql "-d , --stdin" ../../model/prefixes.ttl codedLists.tarql > rdf/codedLists.ttl

#Assay Compound coded list
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=assayCompound" | ../bin/my-tarql "-d , --stdin" ../../model/prefixes.ttl codedValues.tarql > rdf/assayCompound.ttl

#Grape Variety coded list
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=grapeVariety" | ../bin/my-tarql "-d , --stdin" ../../model/prefixes.ttl  codedValues.tarql > rdf/grapeVariety.ttl

#Sensory Flavor coded list
curl "https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/gviz/tq?tqx=out:csv&sheet=sensoryFlavor" | ../bin/my-tarql "-d , --stdin" ../../model/prefixes.ttl  codedValues.tarql > rdf/sensoryFlavor.ttl

