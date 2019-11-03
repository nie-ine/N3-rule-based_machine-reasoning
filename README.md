# N3-rule based machine reasoning
In the [NIE-INE](http://www.nie-ine.ch)-project we develop an infrastructure to enable scholarly edition projects in the Humanities to express their data in an enriched format, adhering to the FAIR-principles, and ensuring long-term storage of the data.  
The project runs at the Swiss Universities of Basel, Bern, Zürich, and Geneva until end of 2020.

The essence of the infrastructure is that data, stored in e.g. a MySQL relational database, are converted to a different machine-readable format, i.e. one that makes the semantics of the data explicit.  
To enable data expression in this new format a series of vocabularies or [ontologies](https://github.com/nie-ine/Ontologies) are created, representing [Semantic Web technology](https://github.com/nie-ine/Ontologies/wiki/1.-Introduction-to-Semantic-Web-technology).  

Besides these ontologies, rules for machine resoning are developed. They are expressed in the [Notation 3 language](https://www.w3.org/TeamSubmission/n3/), also using elements of NIE and other ontologies. 
Notation 3 is an assertion and logic language which is a superset of RDF. N3 extends the RDF datamodel by adding formulae (literals which are graphs themselves), variables, logical implication, and functional predicates, as well as providing a textual syntax (alternative to RDF/XML). In this way Turtle is a subset of N3 syntax.  

N3-rules serve different purposes.  

### Implementation of the RDF model theory:
A first one is the [implementation of the RDF model theory](https://github.com/josd/eye/tree/master/reasoning/rpo). This set of N3-rules permits to infer data from data based on the built-in logic of the W3C Semantic Web standard languages.
Examples are:

	rdfs:subClassOf, rdfs:subPropertyOf, owl:TransitiveProperty, owl:disjointWith, owl:oneOf, owl:unionOf, owl:disjointUnionOf, owl:propertyChainAxiom

A complete reasoning example on transitivity for the 'is part of' property for text and text structures as prosodic entities is given in the repository, also involving a series of other RDFS- and OWL-rules. The data and query files are commented.

### Consistency checking:
User-defined restrictions can be checked upon, e.g. a cardinality restriction for the object value of a certain property of a certain subject class instance. Figure 1 shows the 'human' class declaration in Turtle with a cardinality restriction of maximum 1 on the property 'has biological sex', IOW a human can only have exactly 1 biological sex, i.e. female, male or intersexual (see [human-ontology](https://github.com/nie-ine/Ontologies/blob/master/Nie-ontologies/Generic-ontologies/human-ontology.ttl)). 

	human:Human rdfs:subClassOf [
		a owl:Restriction;
		owl:onProperty human:hasBiologicalSex;
		owl:maxCardinality "1"^^xsd:nonNegativeInteger].
<div align="center">
##### Figure 1: Class declaration with a cardinality restriction of maximum 1
</div>
A complete reasoning example on cardinality is given in the repository, using 2 external ontologies and an RDF data set on images of the [Knora server application](https://www.knora.org/), developed by the [DHLab (DHL)](https://dhlab.philhist.unibas.ch/en/home/) at the University of Basel and the [Data and Service Center for humanities (DaSCH)](https://dasch.swiss/).

### Temporal reasoning:
Generally, time indicators are uniformly converted to intervals to calculate with. Sets of built-ins in the machine reasoner support several ontologies for N3-rule declaration, and the usage of xsd datatyped literals (e.g. xsd:dateTime, xsd:duration).

A complete temporal reasoning example is given in the repository, considering an event without a start or end date, with specific example of missing birth- or death date.

## Machine Reasoning: e.g. the EYE reasoner:  
Development: https://github.com/josd/eye  
Download site: https://sourceforge.net/projects/eulersharp/files/eulersharp/  
EYE comes with intrinsic functionality provided by [built-ins](https://github.com/josd/eye/blob/master/eye-builtins.n3). All other reasoning material has to be input: OWL-ontologies, RDF-data, N3-rules.
 
### Basic command example for EYE:
    eye			  # call the machine reasoner  
    			  # one or more options can be used, e.g.  
    --nope		          # option for output without a proof
    --traditional	          # option for N3 syntax, e.g. @prefix instead of PREFIX  
    			  # local or remote references can be added to assert ontology-, data, or rule graphs:  
    .../rdf-data.ttl	  # ref. to one or more RDF data sets expressed in Turtle syntax (.ttl, subset of N3); .ttl can be replaced by .n3  
    .../owl-ontology.ttl      # ref. to one or more OWL ontologies expressed in OWL Full or lesser sublanguage, using all possible elements of RDF/S-OWL ontologies  
    .../rule.n3		  # ref. to one or more N3-rules; EYE is a 'stateless' reasoner, meaning that all inferencing formalisms have to be fed to it  
    		          # output as a pass OR an N3-query:  
    --pass		          # output deductive closure: all the stated and inferred triples except the rules 
    --pass-all		  # output deductive closure plus rules  
    --query		          # output filtered with N3-query  
    >			  # output can be written to a file
    .../result.n3		  # result file
