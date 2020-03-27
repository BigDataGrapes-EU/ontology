#!/usr/bin/env bash
curl "https://docs.google.com/spreadsheets/d/1OazX9ivXHEP6ZMrYsvUru-1TuBj_p54hfidGNMxYJcw/gviz/tq?tqx=out:csv&gid=Initial_must_2017" | ../../../../../../bin/my-tarql "-d , --stdin" ../../../../../../../model/prefixes.ttl initialMustData.tarql > rdf/initialMustData.ttl
