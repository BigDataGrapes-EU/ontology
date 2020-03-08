#!/usr/bin/env bash

curl "https://docs.google.com/spreadsheets/d/1lWEwwonC0Dg8MAWDSVm7GV184N7jGt-IhjXmdE4Y-oo/gviz/tq?tqx=out:csv&gid=623977456" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl crushingObject.tarql > rdf/crushing_objects.ttl
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl fermentationObjects.tarql > rdf/fermentation_objects.ttl
curl "https://docs.google.com/spreadsheets/d/17j93MM2hb2kI6oaU-CanktISlSyHBk8pz3jsnApQEzs/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl must_fermentationObjects.tarql > rdf/must_fermentation_objects.ttl
# fermentation output
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl freeRunJuiceObjects.tarql > rdf/freeRunJuiceObjects.ttl
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl pressJuiceObjects.tarql > rdf/pressJuiceObjects.ttl
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl malolacticFermentationObjects.tarql > rdf/malolacticFermentationObjects.ttl
#wine
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl wineObjects.tarql > rdf/wineObjects.ttl
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl malolacticFermentationObjects.tarql > rdf/malolacticFermentationObjects.ttl
curl "https://docs.google.com/spreadsheets/d/1nhBnoWhDfDakL-ucY-STdRbDzhgH0yZSEeebwYR88M0/gviz/tq?tqx=out:csv&gid=0" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl malolacticFermentationObjects.tarql > rdf/malolacticFermentationObjects.ttl
