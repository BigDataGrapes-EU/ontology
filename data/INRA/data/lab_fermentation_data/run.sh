#!/usr/bin/env bash
curl "https://docs.google.com/spreadsheets/d/1hOI1eKADaKe7lHwiV7QQ4dYMS8eObbZa/gviz/tq?tqx=out:csv&gid=84986158" | ../../../bin/my-tarql "-d , --stdin" ../../../../model/prefixes.ttl labFermentationData.tarql > labFermentation.ttl
