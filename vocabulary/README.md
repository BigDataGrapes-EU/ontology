# Vocabulary generation form google sheets 

This folder contains the tools to generate the BDG vocabulary from shared google sheets.

## Prerequisites 

* [Tarql](http://tarql.github.io/) - converts tabular data to *RDF* following a pattern expresssed as *SPARQL* - it must be installed so that it's binary is added to the path 
* [Riot](https://jena.apache.org/documentation/io/#command-line-tools) - script form apache jena for validation and RDF converisons. 
* *curl* - to fetch csv data over http 
* *sed*  - for basic string manipulation 

## Google sheets to csv

The following Google Sheets contain the source master data 
* [BDG Coded lists](https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/edit#gid=0) Contains all used coded lists 
* [BDG Variables](https://docs.google.com/spreadsheets/d/1gu1RLLgaRHAYFp9LxYPVyYl2ad6Dlo-ZbqakyXJGeYo/edit#gid=0) Contains Measures, Dimensions and Variables 

We use the chart tools data source protocol to convert them to *CSV* and serve them over *HTTP*. 
The syntax is as follows:

`https://docs.google.com/spreadsheets/d/{{DOC_ID}}/gviz/tq?tqx=out:csv&gid={{SHEET_ID}}` where `DOC_ID` and `SHEET_ID` are both available form the sheet's url. For example the grapeVariety [sheet](https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/edit#gid=1834822338) has
 * `DOC_ID=19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA` and 
 * `sheet=grapeVariety`

## my-tarql 

[my-tarql](../bin/my-tarql) is a *Tarql* wrapper which converts the prefixes from [prefixes.ttl](../../model/prefixes.ttl) to *SPARQL* and prepends them to the current `.tarql` file before adding it to the pipeline. This is done in order to allow us to write more ineligible *SPARQL* and be able to always use any of the predefined prefixes. It also ensures that the resulting *Turtle* is also prefixed and human-readable. 

## Running a conversion 

[vocabulary.sh](vocabulary.sh) contains all the conversions. Each line generates (or appends to) one ttl file in the [rdf](./rdf) folder. Note that we reuse [codedValues.tarql](codedValues.tarql) several times to generate *RDF* from different sheets following the same pattern. 


The *RDF* is generated automatically and given that the volume is relativly small we can commit it to the repository in the [rdf](./rdf) folder.
