curl "https://docs.google.com/spreadsheets/d/1e3KHXUCC6jwM7tTQURYPWi5OEkXRvyTH6J3orL8btlA/gviz/tq?tqx=out:csv&gid=Climatic_Data_PechRouge_2012_2018" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl climaticData.tarql > rdf/climatic_data.ttl