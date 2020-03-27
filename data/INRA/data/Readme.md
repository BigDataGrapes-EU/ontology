
Plan :
- [File structure](#file-structure)
  - [Notes/Remarks:](#notesremarks)
  - [Errors/Issues:](#errorsissues)
    - [Not fixed](#not-fixed)
    - [Fixed](#fixed)

# File structure

```shell
.
├── climatic_data # climatic data produced by the weather station
│   ├── climaticData.tarql
│   ├── rdf
│   │   └── datasets.ttl
│   ├── run.sh
│   └── sample.ttl
├── plot_management
│   ├── harvest_data # data on the harvest step  (weight, etc ...)
│   │   ├── harvestData.tarql
│   │   ├── rdf
│   │   │   └── datasets.ttl
│   │   ├── run.sh
│   │   └── sample.ttl
│   ├── irrigation # irrigation events 
│   │   ├── irrigationEvents.tarql
│   │   ├── rdf
│   │   ├── run.sh
│   │   └── sample.ttl
│   ├── link_harvest_area_berry # makes the links between areas and berries
│   │   ├── harvestingObject.tarql
│   │   ├── rdf
│   │   ├── run.sh
│   │   └── sample.ttl
│   ├── maturation_data # chmemical data analysis on berry
│   │   ├── grapeMaturationBrix.tarql
│   │   ├── grapeMaturationPh.tarql
│   │   ├── grapeMaturationProbablealcohol.tarql
│   │   ├── grapeMaturationSugars.tarql
│   │   ├── grapeMaturationTotalacidity.tarql
│   │   ├── rdf
│   │   └── run.sh
│   ├── plot_data # data on annual yield and production
│   │   ├── annualProduction.tarql
│   │   ├── annualYield.tarql
│   │   ├── rdf
│   │   └── run.sh
│   └── plot_soil
│       ├── plotSoil.tarql
│       ├── rdf
│       ├── run.sh
│       └── sample.ttl
├── Readme.md
├── sensory_analysis
│   ├── afterBottling2017
│   │   ├── rdf
│   │   ├── run.sh
│   │   ├── sample.ttl
│   │   └── sensory.tarql
│   └── beforeBottling
│       ├── rdf
│       ├── run.sh
│       ├── sample.ttl
│       └── sensory.tarql
└── winemaking_activities
    ├── fermentation
    │   └── rdf
    ├── fermentation_objects
    │   ├── crushingObject.tarql
    │   ├── fermentationObjects.tarql
    │   ├── must_fermentationObjects.tarql
    │   ├── rdf
    │   ├── run.sh
    │   └── sample.ttl
    ├── laboratory
    │   ├── must
    │   └── wine
    └── pressing_objects
        ├── pressingObjectsLink.tarql
        ├── pressingObjects.tarql
        ├── rdf
        ├── run.sh
        └── sample.ttl

```

## Notes/Remarks:

- [Plot data.tarql](plot_management/plot_data/annualYield.tarql)
  - Sometimes refArea can be plot or subplot

- Soiltextures => http://imash.leeds.ac.uk/ontologies/atu/SoilPhysics.owl
  - http://archive.researchdata.leeds.ac.uk/42/
  - **Update class plotSoil to [plotTexture](https://docs.google.com/spreadsheets/d/19fdrdisQqihUN68_lb-VEGVgxxEock-IIdDWUPfVUMA/edit#gid=248064775)**

- Add to [model.ttl](../../../../ontology/model/model.ttl)
```sparql
bdg:startDate a bdg:date;
  rdfs:label "Start Date"; rdfs:comment "Date of the beginning of a process".
 
bdg:endDate a bdg:date;
  rdfs:label "End Date"; rdfs:comment "Date of the ending of a process" .
```

- Add in this directory `` winemaking_activities/fermentation_objects `` some fermentation objects generated from fermentation objects base file


## Errors/Issues:

### Not fixed


### Fixed

- Duplicate statements when creating fermentation objects from[malolacticFermentationObjects.tarql](winemaking_activities/fermentation_objects/malolacticFermentationObjects.tarql)

```sparql
<http://data.bigdatagrapes.eu/resource/fermentation/PR011_2017R>
        rdf:type        afeo:Alcoholic-Fermentation ;
        afeo:hasInput   <http://data.bigdatagrapes.eu/resource/must/FV_2017_057> ;
        bdg:experiment  <http://data.bigdatagrapes.eu/resource/experiment/2017_QUALIVINBIO_3160> ;
        rdf:type        afeo:Alcoholic-Fermentation ;
        afeo:hasInput   <http://data.bigdatagrapes.eu/resource/must/FV_2017_057> ;
        bdg:experiment  <http://data.bigdatagrapes.eu/resource/experiment/2017_QUALIVINBIO_3160> .
```

- [grapeMaturationProbablealcohol.tarql](plot_management/maturation_data/grapeMaturationProbablealcohol.tarql)
When getting csv file from google api, why the first two lines are merged ?

```bash
curl "https://docs.google.com/spreadsheets/d/103zwveRlsPy890GfJKqwlJnUOgfgwdOH/gviz/tq?tqx=out:csv&gid=2010910138"
# Results example
"Vinestock 2017-SUNAGRI-L2-1","brix 9.8","date 2017-07-19" > first line is merge
"2017-SUNAGRI-L2-3","8","2017-07-19"
"2017-SUNAGRI-L1-1","11.8","2017-07-19"
```

**Answer : change data format to text**