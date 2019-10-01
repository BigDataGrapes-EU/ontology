#!/usr/bin/env bash
curl "https://docs.google.com/spreadsheets/d/1KIsMtOsJuUxukIqmurzDULTt_zZQOJG7texa3UuVkZU/gviz/tq?tqx=out:csv&gid=pressing_2017" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl pressingObjects.tarql > rdf/pressing_objects.ttl
curl "https://docs.google.com/spreadsheets/d/1KIsMtOsJuUxukIqmurzDULTt_zZQOJG7texa3UuVkZU/gviz/tq?tqx=out:csv&gid=pressing_2017" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl pressingObjectsLink.tarql > rdf/pressing_objects_link.ttl
