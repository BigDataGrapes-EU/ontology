#!/usr/bin/env bash
cd $(dirname $0)
curl "https://docs.google.com/spreadsheets/d/1lWEwwonC0Dg8MAWDSVm7GV184N7jGt-IhjXmdE4Y-oo/gviz/tq?tqx=out:csv&gid=623977456" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl crushingObject.tarql > rdf/crushingObject.ttl
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl fermentationObjects.tarql > rdf/fermentationObjects.ttl

# alcoholic fermentation 
curl "https://docs.google.com/spreadsheets/d/17j93MM2hb2kI6oaU-CanktISlSyHBk8pz3jsnApQEzs/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl linkMustFermentationObjects.tarql > rdf/linkmustFermentationObjects.ttl
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl freeRunJuiceObjects.tarql > rdf/freeRunJuiceObjects.ttl
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl pressJuiceObjects.tarql > rdf/pressJuiceObjects.ttl

# malolactic fermentation
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl malolacticFermentationObjects.tarql > rdf/malolacticFermentationObjects.ttl

#wine
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl wineObjects.tarql > rdf/wineObjects.ttl

