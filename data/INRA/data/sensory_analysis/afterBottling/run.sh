#!/usr/bin/env bash

curl "https://docs.google.com/spreadsheets/d/19JIqzGl6Zjqp9wdKo1au9ZzO6PEkeRIfRY1FbnQLyL0/gviz/tq?tqx=out:csv&gid=2017_Inertis_MAC" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl afterBottling.tarql > rdf/afterBottling.ttl