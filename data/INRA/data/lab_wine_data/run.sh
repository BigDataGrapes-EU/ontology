curl "https://docs.google.com/spreadsheets/d/1yWSZ8pz5XkOHJkyHE3agha_d9TG2lk_W/gviz/tq?tqx=out:csv&gid=1339982375" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl labWineData.tarql > labWine.ttl

