curl "https://docs.google.com/spreadsheets/d/1FHb43S9dH6kw6c6DLDHjqjoLNnZzQZAw/gviz/tq?tqx=out:csv&gid=720708374" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl irrigationData.tarql > rdf/irrigationData.ttl