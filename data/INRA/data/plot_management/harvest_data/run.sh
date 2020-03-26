#!/usr/bin/env bash
curl "https://docs.google.com/spreadsheets/d/1lWEwwonC0Dg8MAWDSVm7GV184N7jGt-IhjXmdE4Y-oo/gviz/tq?tqx=out:csv&gid=623977456" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl harvestData.tarql > rdf/harvest_data.ttl
