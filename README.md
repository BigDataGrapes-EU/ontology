Ontologies, semantic models and semantic data for the BigDataGrapes project.
See extra notes and links at gfolder [BigDataGrapes/WP3](https://drive.google.com/drive/folders/1-_h8mXQLt2lglzEyNk09C5csQf9fCSk2) (for project partners only).

* [data](data): semantic data (for now, some samples)
* [ttl](ttl): relevant ontologies converted to turtle (and added prefixes) for easier reading 
* [misc](misc): ontology materials in miscellaneous formats (eg xlsx, obo)
* [notes](notes): various notes on ontologies and data

## riotval
If you omit prefixes from your Turtle files and use a global `prefixes.ttl` file, use the Perl script `riotval.pl` that prepends `prefixes.ttl`, calls the Jena RIOT validator, then subtracts the number of lines in `prefixes.ttl` from error messages. Put it in your path, then run it like this:
```sh
  perl -S riotval.pl <file.ttl>
```


## D3.1 notes

input on section 4

## Refs

<https://doi.org/10.1371/journal.pbio.2001414> Identifiers for the 21st century: How to design, provision, and reuse persistent identifiers to maximize utility and impact of life science data

