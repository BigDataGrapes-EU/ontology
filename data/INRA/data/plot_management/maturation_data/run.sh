
#dans terminal écrire bash run.sh

#!/usr/bin/env bash
#bien regarder ce qui est avant gviz, après gid et à la fin fichier tarql
#curl "https://docs.google.com/spreadsheets/d/103zwveRlsPy890GfJKqwlJnUOgfgwdOH/gviz/tq?tqx=out:csv&gid=grape_maturation_silex_v1" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl grapeMaturationData.tarql > grapeMaturationData.ttl


curl "https://docs.google.com/spreadsheets/d/103zwveRlsPy890GfJKqwlJnUOgfgwdOH/gviz/tq?tqx=out:csv&gid=2010910138" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl grapeMaturationBrix.tarql > grapeMaturationBrix.ttl

# curl "https://docs.google.com/spreadsheets/d/103zwveRlsPy890GfJKqwlJnUOgfgwdOH/gviz/tq?tqx=out:csv&gid=2068342678" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl grapeMaturationPh.tarql > grapeMaturationPh.ttl

# curl "https://docs.google.com/spreadsheets/d/103zwveRlsPy890GfJKqwlJnUOgfgwdOH/gviz/tq?tqx=out:csv&gid=796506311" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl grapeMaturationTotalacidity.tarql > grapeMaturationTotalacdity.ttl

# curl "https://docs.google.com/spreadsheets/d/103zwveRlsPy890GfJKqwlJnUOgfgwdOH/gviz/tq?tqx=out:csv&gid=163570199" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl grapeMaturationProbablealcohol.tarql > grapeMaturationProbablealcohol.ttl

# curl "https://docs.google.com/spreadsheets/d/103zwveRlsPy890GfJKqwlJnUOgfgwdOH/gviz/tq?tqx=out:csv&gid=1956426450" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl grapeMaturationSugars.tarql > grapeMaturationSugars.ttl