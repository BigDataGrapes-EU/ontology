#!/usr/bin/env bash
cd $(dirname $0)
curl "https://docs.google.com/spreadsheets/d/1WvSkL11SqPAVRrnLyAcV_t753fKns1Ql5f-u9T0U3NA/gviz/tq?tqx=out:csv&gid=1339982375" | ../../../../../../bin/my-tarql "-d , --stdin"  ../../../../../../../model/prefixes.ttl labWineData.tarql > rdf/labWineData.ttl

