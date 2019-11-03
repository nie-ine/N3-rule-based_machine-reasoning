#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "# Execution date" $(date) > $DIR/machineReasoning_sequence-number_input/result.n3
./eye.sh --nope --traditional $DIR/machineReasoning_sequence-number_input/data.ttl $DIR/machineReasoning_sequence-number_input/sequence-number-rule.n3 --query $DIR/machineReasoning_sequence-number_input/query.n3 |cwm >> $DIR/machineReasoning_sequence-number_input/result.n3


# 1. Description of the input for the reasoner:
# ---------------------------------------------
# sequence-number-rule.n3: project-specific; to be generalized
# Other functionality is provided with the built-ins of the reasoner.
# See respective online ontologies for built-in declarations.


# 2. Description of the output of the reasoner:
# ---------------------------------------------
# See comments in the query file.


# 3. Changeables for the command:
# -------------------------------
# query $DIR/machineReasoning_sequence-number_input/query.n3
# pass-all