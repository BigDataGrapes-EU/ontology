# Wind speed and direction data transformation


This case compares two datasets containg similar meteorological information, but recording it in diffrent manners. The Climate data from INRA's Pech Rouge weather station and data from a Pessl Weather station at Casato Prime Donne estate (from Abaco) contain information about the wind speed and direction. They differ in several aspects at the same time:
* *Granularity*: Abaco's data is a series of observations every 30 seconds, INRA's data is a daily summary.
* *Nature of the measurments*: Abaco measure the speed of the wind in metres per second and the direction. INRA report the total wind (in KM) for the day
* *Discretisation of the directions:* Abaco use the magnetic bearing (in degrees) to represent win direction INRA use the 8 main compasss directions (N,NE,E etc..)

The objective is to demonstrate how semantic technology allows conversion between the two representaions in a 100% declarative manner. 

## Datasets 

 Here are subsets of both datasets illustarting the relevant entities:
 
`curl "https://docs.google.com/spreadsheets/d/1e3KHXUCC6jwM7tTQURYPWi5OEkXRvyTH6J3orL8btlA/gviz/tq?tqx=out:csv" | csvcut -c "YEAR,MONTH,DAY,TNW,TNEW,TEW,TSEW,TSW,TSWW,TWW,TNWW" | head -n 10 | csvtomd`

We can see in the table that on new year's day 2012, at Pech Rouge a total of 16km wind blew from the north (TNW). This can be the result of (for example) 4 hours of 4km/h north wind. 

YEAR  |  MONTH  |  DAY  |  TNW  |  TNEW  |  TEW  |  TSEW  |  TSW  |  TSWW  |  TWW  |  TNWW
------|---------|-------|-------|--------|-------|--------|-------|--------|-------|------
2012  |  1      |  1    |  16   |  5     |  0    |  0     |  1    |  31    |  96   |  54
2012  |  1      |  2    |  44   |  10    |  0    |  0     |  1    |  19    |  139  |  120
2012  |  1      |  3    |  14   |  1     |  1    |  1     |  2    |  21    |  65   |  95
2012  |  1      |  4    |  31   |  2     |  0    |  1     |  4    |  25    |  94   |  175
2012  |  1      |  5    |  13   |  1     |  0    |  1     |  4    |  53    |  261  |  213
2012  |  1      |  6    |  66   |  1     |  0    |  0     |  0    |  4     |  77   |  313
2012  |  1      |  7    |  24   |  1     |  1    |  0     |  1    |  12    |  110  |  251
2012  |  1      |  8    |  19   |  1     |  0    |  0     |  1    |  26    |  105  |  155
2012  |  1      |  9    |  13   |  1     |  0    |  0     |  0    |  12    |  149  |  257

This is the RDF resulting from the first line
```ttl
<wineMaking/PechRouge/climaticData/11170004/2012-01-01>
        rdf:type                        qb:Observation ;
        qb:dataSet                      <data/wineMaking/PechRouge/climaticData/11170004> ;
        bdg:date                        "2012-01-01"^^xsd:date ;
        bdg:total_wind_E                "0"^^xsd:decimal ;
        bdg:total_wind_N                "16"^^xsd:decimal ;
        bdg:total_wind_NE               "5"^^xsd:decimal ;
        bdg:total_wind_NW               "54"^^xsd:decimal ;
        bdg:total_wind_W                "96"^^xsd:decimal ;
        bdg:total_wind_S                "1"^^xsd:decimal ;
        bdg:total_wind_SE               "0"^^xsd:decimal ;
        bdg:total_wind_SW               "31"^^xsd:decimal ;
```  

Here is a sample from Abaco's data, showing that on 2019-05-23, between 10:00:24 and 10:30:24 the windspeed was an average of 0.9m/s and the average direction was 225°

Date                 |  dir  |  speed
---------------------|-------|-------
2019-05-23 10:00:24  |  208  |  0.7
2019-05-23 10:30:24  |  225  |  0.9
2019-05-23 11:00:23  |  202  |  1
2019-05-23 11:30:24  |  195  |  1.1
2019-05-23 12:00:24  |  220  |  1
2019-05-23 12:30:23  |  234  |  1
2019-05-23 13:00:24  |  211  |  1
2019-05-23 13:30:24  |  234  |  0.8
2019-05-23 14:00:23  |  126  |  1.1

And the resulting RDF from the first line:

```ttl
<data/farmManagement/windDemo/2019-05-23T10:30:24>
        rdf:type                 qb:Observation ;
        qb:dataSet               <data/farmManagement/WindDemo> ;
        bdg:dateTime             "2019-05-23T10:30:24"^^xsd:dateTime ;
        bdg:speed_wind_MEAN      "0.9"^^xsd:float ;
        bdg:direction_wind_MEAN  "225"^^xsd:float .
```

The target model in this case is INRA's data because it is the least granular one. One line of INRA data corresponds to 48 lines of Pessl data.

## Compass directions 

The conversion between symbolic and numeric directions (225° to "South West") is done via a Concept list representing the 8 directions and their corresponding range of bearings. 

```ttl
<resource/compass/southwest>
        rdf:type         skos:Concept ;
        rdf:type         bdg:Compass ;
        skos:prefLabel   "Southwest" ;
        skos:inScheme    <compass> ;
        bdg:compassFrom  202.5 ;
        bdg:compassTo    247.5 .
```

This is crucial not only to convert between the two modess of representing direction but also because the concept gives us the means to select the relevant `qb:MeasureProperty`, that will be the predicate of the new value, in this case `bdg:total_wind_SW`, which is also linked to the same concept via the `bdg:measurementContext` predicate:

```ttl
bdg:total_wind_SW  rdf:type         qb:MeasureProperty ;
        rdf:type                    sosa:ObservableProperty ;
        rdfs:label                  "Total Wind Sud-West Direction" ;
        sdmx-attribute:unitMeasure  unit:KM ;
        sosa:hasFeatureOfInterest   <feature/Wind> ;
        bdg:measurementContext      <compass/southwest> ;
        bdg:derivedFrom             bdg:total_wind ;
        qb:concept                  sdmx-concept:obsValue ;
        skos:notation               "TSWW" .
```
## Coversion query 

The following query coverts between the two representations. 
The inner query does most the work:
* Calculates the cumulated wind using simple arithmetics
* Groups by date and aggregates the results for each day
* Converys bearing to direction
The outer query selects the relevant `qb:measureProperty`


```sparql
PREFIX bdg: <http://data.bigdatagrapes.eu/resource/ontology/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX qb: <http://purl.org/linked-data/cube#>
select * {
    ?var a qb:MeasureProperty ; 
         bdg:derivedFrom bdg:total_wind ;
         bdg:measurementContext ?compass .
    {
        select ?date (sum(?wind_km) as ?total_wind_km) ?compass where {
            ?s bdg:direction_wind_MEAN ?dir ;
               bdg:speed_wind_MEAN ?speed ;
               bdg:dateTime ?dateTime  .
            
            ?compass a bdg:Compass ;
                     bdg:compassFrom ?from ;
                     bdg:compassTo ?to ;
            filter(?dir >= ?from && ?dir < ?to )
            
            bind(?speed * 1.8 as ?wind_km) #speed in m/sec, 30 min interval, 1800 sec  
            bind(strdt(replace(str(?dateTime),"T.*$",""),xsd:date) as ?date)   
        } group by ?date ?compass order by desc(?date)
    }
}
```
[link](http://136.243.38.67:7200/sparql?name=Wind+speed+and+direction+aggregation&infer=true&sameAs=true&query=PREFIX+bdg%3A+%3Chttp%3A%2F%2Fdata.bigdatagrapes.eu%2Fresource%2Fontology%2F%3E%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0APREFIX+qb%3A+%3Chttp%3A%2F%2Fpurl.org%2Flinked-data%2Fcube%23%3E%0Aselect+*+%7B%0A++++%3Fvar+a+qb%3AMeasureProperty+%3B%0A+++++++++bdg%3AderivedFrom+bdg%3Atotal_wind+%3B%0A+++++++++bdg%3AmeasurementContext+%3Fcompass+.%0A++++%7Bselect+%3Fdate+(sum(%3Fwind_km)+as+%3Ftotal_wind_km)+%3Fcompass+where+%7B%0A++++++++++++%3Fs+bdg%3Adirection_wind_MEAN+%3Fdir+%3B%0A+++++++++++++++bdg%3Aspeed_wind_MEAN+%3Fspeed+%3B%0A+++++++++++++++bdg%3AdateTime+%3FdateTime++.%0A++++++++++++%3Fcompass+a+bdg%3ACompass+%3B%0A+++++++++++++++++++++bdg%3AcompassFrom+%3Ffrom+%3B%0A+++++++++++++++++++++bdg%3AcompassTo+%3Fto+%3B%0A+++++++++++++++++++++filter(%3Fdir+%3E%3D+%3Ffrom+%26%26+%3Fdir+%3C+%3Fto+)%0A++++++++++++bind(%3Fspeed+*+1.8+as+%3Fwind_km)+%23speed+in+m%2Fsec%2C+30+min+interval%2C+1800+sec++%0A++++++++++++bind(strdt(replace(str(%3FdateTime)%2C%22T.*%24%22%2C%22%22)%2Cxsd%3Adate)+as+%3Fdate)+++%0A++++++++%7D+group+by+%3Fdate+%3Fcompass+order+by+desc(%3Fdate)%0A++++%7D%0A%7D)

var            |  date        |  total_wind_km
---------------|--------------|---------------
bdg:total_wind_E   |  2019-07-09  |  104.76
bdg:total_wind_NE  |  2019-07-09  |  18.720001
bdg:total_wind_S   |  2019-07-09  |  0.17999999
bdg:total_wind_SE  |  2019-07-09  |  1.6199999
bdg:total_wind_SW  |  2019-07-09  |  3.2399998
bdg:total_wind_W   |  2019-07-09  |  2.52
bdg:total_wind_E   |  2019-07-08  |  81.0
bdg:total_wind_NE  |  2019-07-08  |  25.56
bdg:total_wind_SE  |  2019-07-08  |  20.34
bdg:total_wind_SW  |  2019-07-08  |  2.6999998
bdg:total_wind_W   |  2019-07-08  |  2.8799999
bdg:total_wind_E   |  2019-07-07  |  45.539997
bdg:total_wind_NE  |  2019-07-07  |  66.78001
bdg:total_wind_S   |  2019-07-07  |  4.8599997
bdg:total_wind_SE  |  2019-07-07  |  3.78
bdg:total_wind_SW  |  2019-07-07  |  2.1599998
bdg:total_wind_W   |  2019-07-07  |  0.17999999

