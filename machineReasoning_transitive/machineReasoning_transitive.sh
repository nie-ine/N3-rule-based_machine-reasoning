#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "# Execution date" $(date) > $DIR/machineReasoning_transitive_input/result.n3
./eye.sh --nope --traditional https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/human-ontology.ttl https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/concept-ontology.ttl https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/document-ontology.ttl https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/text-ontology.ttl https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/text-structure-ontology.ttl https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/prosodic-structure-ontology.ttl https://raw.githubusercontent.com/nie-ine/Ontologies/master/Nie-ontologies/Generic-ontologies/literature-ontology.ttl $DIR/machineReasoning_transitive_input/data.ttl https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-domain.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-range.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-subClassOf.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/rdfs-subPropertyOf.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/owl-someValuesFrom.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/owl-TransitiveProperty.n3 https://raw.githubusercontent.com/josd/eye/master/reasoning/rpo/owl-disjointWith.n3 --query $DIR/machineReasoning_transitive_input/query.n3 |cwm >> $DIR/machineReasoning_transitive_input/result.n3


# 1. Description of the input for the reasoner:
# ---------------------------------------------
# All OWL-ontologies of NIE and N3-rules of RDFS and OWL are fetched from online publications.

# The whole transitivity-chain for the abstract concept:isPartOf and its subproperties is traced with the owl-TransitiveProperty.n3-rule and the rdfs-subPropertyOf.n3-rule, together with the subsumption-tree inferred with the rdfs-subClassOf.n3-rule in following ontologies:
# human-ontology
# concept-ontology
# document-ontology
# text-ontology
# text-structure-ontology
# prosodic-structure-ontology
# literature-ontology

# Hereby domains and ranges of properties are inferred with the rdfs-domain.n3-rule and rdfs-range.n3-rule.

# The role of the person is inferred with owl-someValuesFrom.n3-rule.

# The owl-disjointWith.n3-rule is used to distinct an agent from a role and a person from an organization (defined by FOAF).

# Other functionality is provided with the built-ins of the reasoner, cf. query.


# 2. Description of the output of the reasoner:
# ---------------------------------------------
# See comments in the query file.


# 3. Changeables for the command:
# -------------------------------
# pass-all
# --query $DIR/machineReasoning_transitive/query.n3