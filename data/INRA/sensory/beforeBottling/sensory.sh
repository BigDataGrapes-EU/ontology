#!/usr/bin/env bash

cat "/home/charlero/GIT/GITLAB/data-integration/csvExample/sensory_analysis.csv" | ../../../bin/my-tarql -v "-d , --stdin" ../../../../model/prefixes.ttl sensory.tarql > sensory.ttl