#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "# Execution date" $(date) > $DIR/machineReasoning_pet_input/result.n3
./eye.sh --nope --traditional /home/changeme/Documents/NIE/NIE_ontology/ontologies_W3C_foundational/rdf-schema.ttl $DIR/machineReasoning_pet_input/pet-ontology.ttl $DIR/machineReasoning_pet_input/data.ttl https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-domain.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-range.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-subClassOf.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/owl-disjointWith.n3 $DIR/machineReasoning_pet_input/likesForDinnerRule.n3 $DIR/machineReasoning_pet_input/keptSeparateFromRule.n3 --query $DIR/machineReasoning_pet_input/query.n3 |cwm >> $DIR/machineReasoning_pet_input/result.n3

# query /home/changeme/Documents/IT/ST/machineReasoning/machineReasoning_pet/petQuery.n3
# pass-all
# |cwm
