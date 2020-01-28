
#dans terminal écrire bash run.sh

#!/usr/bin/env bash
#bien regarder ce qui est avant gviz, après gid et à la fin fichier tarql
curl "https://docs.google.com/spreadsheets/d/103zwveRlsPy890GfJKqwlJnUOgfgwdOH/gviz/tq?tqx=out:csv&gid=grape_maturation_silex_v1" | ../../../../bin/my-tarql "-d , --stdin" ../../../../../model/prefixes.ttl grapeMaturationData.tarql > grapeMaturationData.ttl