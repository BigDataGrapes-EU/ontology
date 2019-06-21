#!/usr/bin/env bash

cat "/home/nikola/projects/bdg/gdrive/WP8/Wine Making Pilot - INRA/dataSet/Dataset V1 example for 2016/2016_sensoryAnalysis_ALFColomb.csv" | ../../../bin/my-tarql "-d , --stdin" ../../../../model/prefixes.ttl sensory.tarql > sensory.ttl