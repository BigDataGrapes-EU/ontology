#!/usr/bin/env bash
cd $(dirname $0)
curl "https://docs.google.com/spreadsheets/d/1sgCqGrwN9ULCVvBU39rZ99BMxbYCbLFPlrRnL6GPwBg/gviz/tq?tqx=out:csv&gid=42966062" | ../../../bin/my-tarql "-d , --stdin" ../../../../model/prefixes.ttl accessions.tarql > rdf/accessions.ttl
curl "https://docs.google.com/spreadsheets/d/1Ncg0a5JJlt0OLamJhiz5jU8ox9FMV8UCpLplRDmjptw/gviz/tq?tqx=out:csv&gid=1439917877" | ../../../bin/my-tarql "-d , --stdin" ../../../../model/prefixes.ttl varieties.tarql > rdf/varieties.ttl
