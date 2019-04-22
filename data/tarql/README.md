# RDF generation form google sheets 

## Prerequisites 

* [Tarql](http://tarql.github.io/) - converts tabular data to RDF following a pattren expresssed as SPARQL - it can be obtained form and must be installed so that it's binary is added to the *path*. 
* *curl* - to fetch csv data over http 
* *sed*  - for basic string manipulation 

## Google sheets to csv
We sue the chart Tools datasource protocol to convert a **public** google sheet to csv. The syntax is as follows

`https://docs.google.com/spreadsheets/d/{{DOC_ID}}/gviz/tq?tqx=out:csv&gid={{SHEET_ID}}` where `DOC_ID` and `SHEET_ID` are both available form the sheet's url. For example the grapeVariety [sheet](https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/edit#gid=1834822338) has
 * `DOC_ID=19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA` and 
 * `sheet=grapeVariety`

## my-tarql 

[my-tarql](../../bin/my-tarql) is a Tarql wrapper which converts the prefixes from [prefixes.ttl](../../model/prefixes.ttl) to SPARQL and prepends them to the current `.tarql` file before adding it to the pipeline. This is done in order to allow us to write more ineligible SPARQL and be able to always use any of the predefined prefixes. It also ensures that the resulting turtle is also prefixed and human-readable. 

## Running a conversion 

[all.sh](all.sh) contains all the conversions. Each line generates (or appends to) one ttl file in the [rdf](./rdf) folder. Note that we reuse [codedValues.tarql](codedValues.tarql) several times to generate rdf from diffrent sheets following the same pattern


