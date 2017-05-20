#!/bin/bash
./eye.sh --nope --traditional
.../owl-cardinality/images-demo-data.ttl
.../owl-cardinality/knora-base.ttl
.../owl-cardinality/images.ttl
http://eulersharp.sourceforge.net/2003/03swap/rdfs-subClassOf
http://eulersharp.sourceforge.net/2003/03swap/rdfs-subPropertyOf
.../owl-cardinality/cardinality.n3
--query .../owl-cardinality/cardinalityQuery.n3
|cwm > .../owl-cardinality/cardinalityResult.n3