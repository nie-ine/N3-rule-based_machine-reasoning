#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "# Execution date" $(date) > $DIR/calendarUnification_input/result.ttl
./eye.sh --nope $DIR/calendarUnification_input/data.ttl https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/calendar-ontology.ttl https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-subClassOf.n3 $DIR/calendarUnification_input/data-source-to-domain-conversion-rules.n3 $DIR/calendarUnification_input/calendar-unification-rules.n3 --query $DIR/calendarUnification_input/query.n3 |cwm >> $DIR/calendarUnification_input/result.ttl


# 1. Description of the input for the reasoner:
# ---------------------------------------------
# OWL ontology
# RDF data
# N3-rules


# 2. Description of the output of the reasoner:
# ---------------------------------------------
# Cf. query file


# 3. Changeables for the command:
# -------------------------------
# query $DIR/calendarUnification_input/query.n3
# pass-all
# $DIR/rules/rdfs-subPropertyOf.n3 $DIR/rules/rdfs-domain.n3 $DIR/rules/rdfs-range.n3 $DIR/rules/rdfs-subClassOf.n3
# data_performance-test
# |cwm >> $DIR/calendarUnification_input/result.ttl