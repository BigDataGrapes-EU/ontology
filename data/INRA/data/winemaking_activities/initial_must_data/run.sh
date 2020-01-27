#!/usr/bin/env bash
curl "https://docs.google.com/spreadsheets/d/16sFekqEiMZ5QDdLADIxyOjtBK73GXAtQHyPVvQD7RYA/gviz/tq?tqx=out:csv&gid=Initial_must_2017" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl initialMustData.tarql > rdf/initialMustData.ttl
