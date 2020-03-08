#!/usr/bin/env bash

curl "https://docs.google.com/spreadsheets/d/1myieRIBZaB_lLWZdNAWd4_GmAO5cZofIC-nhzjOQEzM/gviz/tq?tqx=out:csv&gid=1457547787" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl beforeBottling.tarql > rdf/beforeBottling.ttl