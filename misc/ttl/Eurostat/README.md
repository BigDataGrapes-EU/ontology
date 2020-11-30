http://estatwrap.ontologycentral.com/page/ei_bsco_m is an example RDF QB dataset. At the bottom there are links for viewing it as a table, and downloading it as:
- RDF (data and DSD)
- SDMX (XML data and XSD)
- TSV

If you convert the RDF DSD to Turtle (using Jena RIOT or http://rdf-translator.appspot.com/) and look at it, you'll see the structure:
```ttl
<ei_bsco_m.rdf#dsd>
        a             qb:DataStructureDefinition ;
        qb:component  [ qb:attribute  estat:freq ] ;
        qb:component  [ qb:attribute  estat:geo ] ;
        qb:component  [ qb:attribute  estat:obs_status ] ;
        qb:component  [ qb:attribute  estat:timeformat ] ;
        qb:component  [ qb:dimension  dcterms:date ] ;
        qb:component  [ qb:dimension  estat:indic ] ;
        qb:component  [ qb:dimension  estat:s_adj ] ;
        qb:component  [ qb:dimension  estat:unit ] ;
        qb:component  [ qb:measure    sdmx-measure:obsValue ] ;
        foaf:page     <ei_bsco_m.rdf> .
```

If you look at the data, it consists of a bunch of nodes like this:
```ttl
[ a                      qb:Observation ;
  estat:geo              <dic/geo#SE> ;
  estat:indic            <dic/indic#BS-PT-NY> ;
  estat:s_adj            <dic/s_adj#SA> ;
  estat:unit             <dic/unit#BAL> ;
  dcterms:date           "2016-11" ;
  qb:dataSet             <id/ei_bsco_m#ds> ;
  sdmx-measure:obsValue  27.7
] .
```
All dimensions and the measure are present in each observation. On the other hand the attributes freq obsStatus timeformat are optional, and are not present.

Defects:
- no `@base` is defined, so a bunch of URLs resolved to local `file:` URLs (I've fixed it in this example)
- not sure why `qb:attribute estat:geo`: I think that should be `qb:dimension` since the geo (refArea) is surely a dimension of the observation (and unlike the other attributes, is present in the data)
- I can't see where the dataset `<id/ei_bsco_m#ds>` is defined
- I think `estat:timeformat` must be defined (and `estat:freq` better be defined), else how to know what the `dcterms:date` literal means?
  There is a way to attach (express) them at the dataset level, but as far as I can see, they are not expressed anywhere.
