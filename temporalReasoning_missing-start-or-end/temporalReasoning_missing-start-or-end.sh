#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "# Execution date" $(date) > $DIR/temporalReasoning_missing-start-or-end_input/result.n3
./eye.sh --nope --traditional https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/time-ontology.ttl https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/human-ontology.ttl https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/event-ontology.ttl $DIR/temporalReasoning_missing-start-or-end_input/data.ttl https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-domain.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/owl-propertyChainAxiom.n3 $DIR/temporalReasoning_missing-start-or-end_input/maxLifeDuration-rule.n3 $DIR/temporalReasoning_missing-start-or-end_input/missing-start-or-end-rules.n3 --query $DIR/temporalReasoning_missing-start-or-end_input/query.n3 |cwm >> $DIR/temporalReasoning_missing-start-or-end_input/result.n3

# query $DIR/temporalReasoning_missing-start-or-end/query.n3
# pass-all