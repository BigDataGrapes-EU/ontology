#!/usr/bin/env bash
cd $(dirname $0)

curl "https://docs.google.com/spreadsheets/d/18HKM-wMLxko53LR9UMUPeOUjfHRhcE20S8Bpb6GdCIE/gviz/tq?tqx=out:csv&gid=84986158" | ../../../../../../bin/my-tarql "-d , --stdin" ../../../../../../../model/prefixes.ttl mustDuringFermentationData.tarql > rdf/mustDuringFermentationData.ttl
