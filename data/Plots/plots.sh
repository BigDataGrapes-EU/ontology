#!/usr/bin/env bash

#Estates
curl "https://docs.google.com/spreadsheets/d/1945ZW7cusemulYEb4w9eHDGDpdPGIS0K_-MXJs6s-Ag/gviz/tq?tqx=out:csv&sheet=Estate" | ../bin/my-tarql "-d , --stdin" ../../model/prefixes.ttl estate.tarql > rdf/estate.ttl

#Plot Cluster
curl "https://docs.google.com/spreadsheets/d/1945ZW7cusemulYEb4w9eHDGDpdPGIS0K_-MXJs6s-Ag/gviz/tq?tqx=out:csv&sheet=PlotCluster" | ../bin/my-tarql "-d , --stdin" ../../model/prefixes.ttl plotCluster.tarql > rdf/plotCluster.ttl

#Plot
curl "https://docs.google.com/spreadsheets/d/1945ZW7cusemulYEb4w9eHDGDpdPGIS0K_-MXJs6s-Ag/gviz/tq?tqx=out:csv&sheet=Plot" | ../bin/my-tarql "-d , --stdin" ../../model/prefixes.ttl plot.tarql > rdf/plot.ttl

#Sub Plot
curl "https://docs.google.com/spreadsheets/d/1945ZW7cusemulYEb4w9eHDGDpdPGIS0K_-MXJs6s-Ag/gviz/tq?tqx=out:csv&sheet=SubPlot" | ../bin/my-tarql "-d , --stdin" ../../model/prefixes.ttl subPlot.tarql > rdf/subPlot.ttl