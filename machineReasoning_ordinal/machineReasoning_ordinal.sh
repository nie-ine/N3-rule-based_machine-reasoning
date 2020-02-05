#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "# Execution date" $(date) > $DIR/machineReasoning_ordinal_input/result.n3
./eye.sh --nope $DIR/machineReasoning_ordinal_input/data.ttl $DIR/machineReasoning_ordinal_input/ordinal-rules.n3 --query $DIR/machineReasoning_ordinal_input/queries.n3 |cwm >> $DIR/machineReasoning_ordinal_input/result.n3


# 1. Description of the input for the reasoner:
# ---------------------------------------------
# ordinal-rules.n3: project-specific
# Other functionality is provided with the built-ins of the reasoner.
# See respective online ontologies for built-in declarations.


# 2. Description of the output of the reasoner:
# ---------------------------------------------
# See comments in the query file.


# 3. Changeables for the command:
# -------------------------------
# query $DIR/machineReasoning_ordinal_input/query.n3
# pass-all