#!/usr/bin/env bash

curl "https://docs.google.com/spreadsheets/d/1lWEwwonC0Dg8MAWDSVm7GV184N7jGt-IhjXmdE4Y-oo/gviz/tq?tqx=out:csv&gid=2017_Harvest_Forms" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl harvestingObject.tarql > rdf/harvest_objects.ttl