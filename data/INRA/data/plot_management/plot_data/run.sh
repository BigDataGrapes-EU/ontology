#!/usr/bin/env bash
curl "https://docs.google.com/spreadsheets/d/1PyZjsRCHFhBbimDR7tomG_yI5wPHMoNAv9zQtjDSKdM/gviz/tq?tqx=out:csv&gid=annualProduction" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl annualProduction.tarql > rdf/annualProduction_data.ttl
curl "https://docs.google.com/spreadsheets/d/1PyZjsRCHFhBbimDR7tomG_yI5wPHMoNAv9zQtjDSKdM/gviz/tq?tqx=out:csv&gid=annualYield" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl annualYield.tarql > rdf/annualYield.ttl
