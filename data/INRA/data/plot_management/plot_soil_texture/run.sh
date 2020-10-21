#!/usr/bin/env bash
cd $(dirname $0)
curl "https://docs.google.com/spreadsheets/d/1KwJQKEBFc019T5qkrMjy9zyHnozs4rmVpbkX6wRvvEw/gviz/tq?tqx=out:csv&gid=2017_Harvest_Forms" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl plotSoilTexture.tarql > rdf/plotSoilTexture.ttl