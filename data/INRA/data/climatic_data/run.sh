cd $(dirname $0)
curl "https://docs.google.com/spreadsheets/d/1e3KHXUCC6jwM7tTQURYPWi5OEkXRvyTH6J3orL8btlA/gviz/tq?tqx=out:csv&gid=593919173" |  ../../../bin/my-tarql "-d , --stdin"  ../../../../model/prefixes.ttl climaticData.tarql > rdf/climaticData.ttl
