#!/usr/bin/env bash

curl "https://docs.google.com/spreadsheets/d/1myieRIBZaB_lLWZdNAWd4_GmAO5cZofIC-nhzjOQEzM/gviz/tq?tqx=out:csv&gid=sensory_analysis" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl sensory.tarql > rdf/beforeBottling.ttl