#!/usr/bin/env bash
curl "https://docs.google.com/spreadsheets/d/1uh96o3OOmgTYkRZCI89WXsjl-LmacjM0wnqnccugs-U/gviz/tq?tqx=out:csv&gid=Red_wine_20162017_Pressing" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl pressingData.tarql > rdf/pressing_data.ttl
