#!/usr/bin/env bash
cd $(dirname $0)
curl "https://docs.google.com/spreadsheets/d/1KIsMtOsJuUxukIqmurzDULTt_zZQOJG7texa3UuVkZU/gviz/tq?tqx=out:csv&gid=pressing_2017" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl pressingObjects.tarql > rdf/pressingObjects.ttl
curl "https://docs.google.com/spreadsheets/d/1KIsMtOsJuUxukIqmurzDULTt_zZQOJG7texa3UuVkZU/gviz/tq?tqx=out:csv&gid=pressing_2017" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl pressingObjectsLink.tarql > rdf/pressingObjectsLink.ttl
