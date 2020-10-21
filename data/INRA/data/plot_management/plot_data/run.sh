#!/usr/bin/env bash
cd $(dirname $0)
curl "https://docs.google.com/spreadsheets/d/1PyZjsRCHFhBbimDR7tomG_yI5wPHMoNAv9zQtjDSKdM/gviz/tq?tqx=out:csv&gid=1448168030" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl annualProduction.tarql > rdf/annualProduction.ttl
curl "https://docs.google.com/spreadsheets/d/1PyZjsRCHFhBbimDR7tomG_yI5wPHMoNAv9zQtjDSKdM/gviz/tq?tqx=out:csv&gid=436356941" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl annualYield.tarql > rdf/annualYield.ttl
