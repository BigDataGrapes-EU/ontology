#!/usr/bin/env bash
curl "https://docs.google.com/spreadsheets/d/103zwveRlsPy890GfJKqwlJnUOgfgwdOH/gviz/tq?tqx=out:csv&gid=grape_maturation_silex_Ontorefine" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl initialMustData.tarql > grapeMaturationData.ttl