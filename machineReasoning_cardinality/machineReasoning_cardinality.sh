#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "# Execution date" $(date) > $DIR/machineReasoning_cardinality_input/result.n3
./eye.sh --nope --traditional https://raw.githubusercontent.com/dasch-swiss/knora-api/develop/knora-ontologies/knora-base.ttl https://raw.githubusercontent.com/dasch-swiss/knora-api/develop/webapi/_test_data/ontologies/images-onto.ttl $DIR/machineReasoning_cardinality_input/images-demo-data.ttl https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-subClassOf.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-subPropertyOf.n3 $DIR/machineReasoning_cardinality_input/cardinality-rules.n3 --query $DIR/machineReasoning_cardinality_input/query.n3 |cwm >> $DIR/machineReasoning_cardinality_input/result.n3


# 1. Description of the input for the reasoner:
# ---------------------------------------------
# [1] OWL ontology: knora-base.ttl: knora-base-ontology asserted for its subject class restrictions on properties
# [2] OWL ontology: https://raw.githubusercontent.com/dasch-swiss/knora-api/develop/webapi/_test_data/ontologies/images-onto.ttl :
# Images-ontology asserted for its subsumption of knora and subject class restrictions on properties
# [3] RDF data: https://raw.githubusercontent.com/dasch-swiss/knora-api/develop/webapi/_test_data/demo_data/images-demo-data.ttl
# About images expressed in knora-base-ontology and images-ontology semantics
# Copy of the above in the folder with explanatory comments on the cardinality on some properties as examples for the N3-rules for the reasoning case; also used to trigger an inconsistency, see also 2.
# [4] N3-rules expressing the RDFS subclass model theory, for restriction check on different levels
# [5] N3-rules expressing the RDFS subproperty model theory, for restriction check on different levels
# [6] N3-rules expressing the OWL cardinality model theory, for consitency check on user restrictions
# [7] N3-query: The cardinality N3-rules have a boolean as conclusion, thus no need for a query or pass, but added here as example
# [8] The CWM reasoner (T. Berners-Lee) is used to beautify EYE's output for better readability (elliptical syntax for subject and subject-predicate repetition)


# 2. Description of the output of the reasoner:
# ---------------------------------------------
# When the reasoner detects an inconsistency it gives an "** ERROR ** eam ** inference_fuse" message with explanation in the terminal, cf. the file 'result-inconsistency'.


# 3. Changeables for the command:
# -------------------------------
# query $DIR/machineReasoning_cardinality/query.n3
# pass-all
# https://raw.githubusercontent.com/dasch-swiss/knora-api/develop/webapi/_test_data/demo_data
# $DIR/machineReasoning_cardinality_input