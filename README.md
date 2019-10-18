# N3-rules for machine reasoning
In the [NIE-INE](http://www.nie-ine.ch)-project we develop an infrastructure to enable scholarly edition projects in the Humanities to express their data in an enriched format, adhering to the FAIR-principles, and ensuring long-term storage of the data.  
The project runs at the Swiss Universities of Basel, Bern, Zürich, and Geneva until end of 2020.

The essence of the infrastructure is that data, stored in e.g. a MySQL relational database, are converted to a different machine-readable format, i.e. one that makes the semantics of the data explicit.  
To enable data expression in this new format a series of vocabularies or [ontologies](https://github.com/nie-ine/Ontologies) are created, representing [Semantic Web technology](https://github.com/nie-ine/Ontologies/wiki/1.-Introduction-to-Semantic-Web-technology).  

Besides these ontologies, rules for machine resoning are developed. They are expressed in the [Notation 3 language](https://www.w3.org/TeamSubmission/n3/), also using elements of NIE and other ontologies. 
Notation 3 is an assertion and logic language which is a superset of RDF. N3 extends the RDF datamodel by adding formulae (literals which are graphs themselves), variables, logical implication, and functional predicates, as well as providing a textual syntax (alternative to RDF/XML). In this way Turtle is a subset of N3 syntax.  

N3-rules serve different purposes.  

### Implementation of the RDF model theory:
A first one is the [implementation of the RDF model theory](https://github.com/josd/eye/tree/master/reasoning/rpo). This set of N3-rules permits to infer data from data based on the built-in logic in the W3C Semantic Web standard languages.
Examples: rdfs:subClassOf, rdfs:SubPropertyOf, owl:TransitiveProperty, owl:oneOf, owl:unionOf, owl:disjointUnionOf, owl:propertyChainAxiom

### Consistency checking:
User-defined restrictions can be checked upon, e.g. a cardinality restriction for the object value of certain property of a certain subject class instance.

### Temporal reasoning:
Time indicators are uniformly converted to intervals to calculate with. Sets of built-ins and plug-ins in the machine reasoner support several ontologies and the usage of xsd datatyped literals (e.g. xsd:dateTime, xsd:duration).

## Machine Reasoning: e.g. the EYE reasoner:  
Development: https://github.com/josd/eye  
Older resource with extra information: http://eulersharp.sourceforge.net/  
Download site: https://sourceforge.net/projects/eulersharp/files/eulersharp/  
### Basic command example for EYE:
    eye			  # call the machine reasoner  
    			  # one or more options can be used, e.g.  
    --nope		          # option for output without a proof
    --traditional	          # option for N3 syntax, e.g. @prefix instead of PREFIX  
    			  # data references can be added:  
    .../rdf-data.ttl	  # ref. to one or more RDF data sets expressed in Turtle syntax (.ttl, subset of N3); .ttl can be replaced by .n3  
    .../owl-ontology.ttl      # ref. to one or more OWL ontologies expressed in OWL Full or lesser sublanguage, using all possible elements of RDF/S-OWL ontologies  
    .../rule.n3		  # ref. to one or more N3-rules; EYE is a 'stateless' reasoner, meaning that all inferencing formalisms have to be fed to it  
    		          # output as a pass OR an N3-query:  
    --pass		          # output deductive closure: all the stated and inferred triples except the rules 
    --pass-all		  # output deductive closure plus rules  
    --query		          # output filtered with filter rules  
    >			  # output can be written to a file
    .../result.n3		  # result file
