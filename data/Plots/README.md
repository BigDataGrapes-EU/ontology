# Parcel data generation from google sheets

These queries generate RDF for the parcels involved in the project. 

The source are these gsheets: [BDG Plots](https://docs.google.com/spreadsheets/d/1945ZW7cusemulYEb4w9eHDGDpdPGIS0K_-MXJs6s-Ag/edit#gid=176283442)

Geometries are retrieved dynamically from the [Geocledian API](https://geocledian.com/agknow/api/v3/parcels/142330?key=454cd545-217c-45aa-b32a-20b49096729b&geoformat=WKT) within the Google Sheet using [importJSON.gs](https://github.com/bradjasper/ImportJSON/blob/master/ImportJSON.gs). 

this is how the call looks within Google Sheets to retrieve the `geometry` litteral.
 
```
=if(C3,ImportJSON(CONCATENATE("https://geocledian.com/agknow/api/v3/parcels/",C3,"?key=454cd545-217c-45aa-b32a-20b49096729b&geoformat=WKT"),"/content/geometry","noHeaders,noTruncate"),"")
 ```
 
See [Vocabulary/README.md](../Vocabulary/README.md) for details of the rest of the process process. 
Resulting RDF is in the [rdf](./rdf) folder.   
