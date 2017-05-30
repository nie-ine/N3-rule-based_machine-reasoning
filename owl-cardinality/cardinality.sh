#!/bin/bash
./eye.sh --nope --traditional
.../owl-cardinality/images-demo-data.ttl # RDF data set about images expressed in Knora Base Ontology and Images Ontology semantics
.../owl-cardinality/knora-base.ttl       # Knora Base Ontology [1] for its class restrictions on properties
.../owl-cardinality/images.ttl           # Images Ontology [2] for its class restrictions on properties
http://eulersharp.sourceforge.net/2003/03swap/rdfs-subClassOf # N3 rules expressing the RDFS sub-class model theory [3], for restriction check on different levels
http://eulersharp.sourceforge.net/2003/03swap/rdfs-subPropertyOf # N3 rules expressing the RDFS sub-property model theory [4], for restriction check on different levels
.../owl-cardinality/cardinality.n3       # N3 rules expressing the OWL cardinality model theory
--query .../owl-cardinality/cardinalityQuery.n3 # The cardinality N3 rules have a boolean as conclusion, thus no need for a query or pass, but added here as example
|cwm > .../owl-cardinality/cardinalityResult.n3  
  
# [1] https://github.com/dhlab-basel/Knora/blob/develop/knora-ontologies/knora-base.ttl  
# [2] https://github.com/dhlab-basel/Knora/blob/develop/webapi/_test_data/ontologies/images-onto.ttl  
# [3] http://eulersharp.sourceforge.net/2003/03swap/rdfs-subClassOf  
# [4] http://eulersharp.sourceforge.net/2003/03swap/rdfs-subPropertyOf
