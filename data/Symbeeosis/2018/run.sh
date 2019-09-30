#!/usr/bin/env bash

curl "https://docs.google.com/spreadsheets/d/1Lu7GDd-VuSrXrGuNO-wOmQfrqHZlljJi0fxe8qaSZYc/gviz/tq?tqx=out:csv&sheet=Maceration" | ../../bin/my-tarql "-d , --stdin" ../../../model/prefixes.ttl cosmetics18.tarql > rdf/cosmetics18M.ttl

curl "https://docs.google.com/spreadsheets/d/1Lu7GDd-VuSrXrGuNO-wOmQfrqHZlljJi0fxe8qaSZYc/gviz/tq?tqx=out:csv&sheet=Ultrasound" | ../../bin/my-tarql "-d , --stdin" ../../../model/prefixes.ttl cosmetics18.tarql > rdf/cosmetics18U.ttl

curl "https://docs.google.com/spreadsheets/d/1_kRsyd-bgfZHFi3XhS-g7qxJIp2qkI-7PtNYMMo69Qc/gviz/tq?tqx=out:csv&sheet=2018" | ../../bin/my-tarql "-d , --stdin" ../../../model/prefixes.ttl samples18.tarql > rdf/samples18.ttl

