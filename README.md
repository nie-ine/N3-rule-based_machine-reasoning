Dear visitor, we are in the process of transferring information from this repository to the [e-editiones.ch website](e-editiones.ch), to bring together all the SWT parts (and more).
There will be the authoritative publication of our ontologies, and also the functional parts (microservices) for SPARQL1.1 (Jena-Fuseki-TDB2) and N3-rule-machine reasoning (EYE) on the RDF-graphs of a few edition projects.

# N3-rule based machine reasoning
In the [NIE-INE](http://www.nie-ine.ch)-project we develop an infrastructure to enable scholarly edition projects in the Humanities to express their data in an enriched format, adhering to the FAIR-principles, and ensuring long-term storage of the data.  
The project runs at the Swiss Universities of Basel, Bern, Zürich, and Geneva until the end of 2020.

The essence of the infrastructure is that data, stored in e.g. a MySQL relational database, are converted to a different machine-readable format, i.e. one that makes the semantics of the data explicit.  
To enable data expression in this new format a series of vocabularies or [ontologies](https://github.com/nie-ine/Ontologies) are created, representing [Semantic Web technology](https://github.com/nie-ine/Ontologies/wiki/1.-Introduction-to-Semantic-Web-technology).  

Besides these ontologies, rules for machine resoning are developed. They are expressed in the [Notation 3 language](https://www.w3.org/TeamSubmission/n3/), also using elements of NIE and external ontologies. 
Notation 3 is an assertion and logic language which is a superset of RDF. N3 extends the RDF datamodel by adding formulae (literals which are graphs themselves), variables, logical implication, and functional predicates, as well as providing a textual syntax (alternative to RDF/XML). In this way Turtle is a subset of N3.  

The general external ontologies for N3-rule declaration are in following namespaces:  
	<http://www.w3.org/2000/10/swap/string#>  
	<http://www.w3.org/2000/10/swap/list#>  
	<http://www.w3.org/2000/10/swap/log#>  
	<http://www.w3.org/2000/10/swap/math#>  
	<http://www.w3.org/2000/10/swap/crypto#>  
	<http://eulersharp.sourceforge.net/2003/03swap/log-rules#>  
	<http://eulersharp.sourceforge.net/2003/03swap/xsd-rules#>  


They provide class and property declarations for built-ins representing an extensive variety of functionalities.  
These built-ins are mentioned in some of the following rule examples.

## N3-rules serve different purposes: 
Note: also mentioned in the use case catalogue.
### Implementation of the RDF model theory:
A set of [N3-rules implementing the RDF model theory](https://github.com/josd/eye/tree/master/reasoning/rpo) permits to infer data from data based on the built-in logic of the W3C Semantic Web standard languages.
Examples are rules for the implementation of:

		@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>.
		@prefix owl: <http://www.w3.org/2002/07/owl#>.

			rdfs:subClassOf
			rdfs:subPropertyOf
			owl:TransitiveProperty
			owl:disjointWith
			owl:oneOf
			owl:unionOf
			owl:disjointUnionOf
			owl:propertyChainAxiom

A complete reasoning example on transitivity for the 'is part of' property for text and text structures as prosodic entities is given in the repository, also involving a series of other RDFS- and OWL-rules. The data and query files are commented.

### Consistency check for user defined restrictions:
User-defined restrictions can be checked upon, e.g. a cardinality restriction for the object value of a certain property of a certain subject class instance. Figure 1 shows part of the 'human' class declaration in Turtle with a cardinality restriction of maximum 1 on the property 'has biological sex', IOW a human can only have exactly 1 biological sex, i.e. female, male or intersexual (see [human-ontology](https://github.com/nie-ine/Ontologies/blob/master/Nie-ontologies/Generic-ontologies/human.ttl)).

		@prefix human: <http://www.e-editiones.ch/ontology/human#>.

			human:Human rdfs:subClassOf [
				a owl:Restriction;
				owl:onProperty human:hasBiologicalSex;
				owl:maxCardinality "1"^^xs:nonNegativeInteger].
<div align="center">

##### Figure 1: Class declaration with a cardinality restriction of maximum 1
</div>

A reasoning example on cardinality is given in the repository, using 2 external ontologies and an RDF data set on images of the [Knora server application](https://www.knora.org/), developed by the [DHLab (DHL)](https://dhlab.philhist.unibas.ch/en/home/) at the University of Basel and the [Data and Service Center for humanities (DaSCH)](https://dasch.swiss/).

### Temporal reasoning:
This type of reasoning is crucial for formal data to be reusable and interchangeable, because its first step is a unification of time expressions in different calendars and/or with different accuracy.  
Time expressions with the accuracy of a day (date) from different calendars are converted to the respective Julian Day Numbers, and in this way comparable.  
A time expression with less accuracy than a day, i.e. a year or year-month, is converted to the period with the start and end date of the specific calendar, and with the start and end Julian Day Number.
For this process the machine reasoner provides an extensive set of [Time and RIF Built-ins](https://raw.githubusercontent.com/josd/eye/master/eye-builtins.n3) based on W3C standards [RIF Datatypes and Built-Ins 1.0](https://www.w3.org/TR/2013/REC-rif-dtb-20130205/), using for instance literals typed with e.g. xsd:date, xsd:dateTime, and xsd:duration from the <http://www.w3.org/2001/XMLSchema#> namespace.
Further functionality is provided by the [time-ontology](https://github.com/nie-ine/Ontologies/blob/master/Nie-ontologies/Generic-ontologies/time.ttl), and the [calendar-ontology](https://github.com/nie-ine/Ontologies/blob/master/Nie-ontologies/Generic-ontologies/calendar.ttl), declaring the properties used in N3-rules.

A temporal reasoning example is given in the repository, converting calendrical time expressions to a unifying Julian Day Number.  
Another example deals with an event without a start or end date, with the specific example of missing birth- or death date.

### Miscellaneous functionalities and calculations:
Also for this type of N3-rules a large set of [built-ins](https://raw.githubusercontent.com/josd/eye/master/eye-builtins.n3) is available, dealing with e.g. logical and mathematical operators, lists, and strings.
For example string manipulation, e.g. parsing using regular expressions, is possible with formal expressions, offering the advantage of staying in the formal N3/RDF environment until a fully reasoned upon data set or deductive closure is obtained, which can be stored in an RDF database and queried with SPARQL, or which can be transformed to JSON(-LD) for GUI application.  

The repository contains a reasoning example on sequence numbers or ordinals, derived from entity identifiers, using following properties declared in the respective ontology:

		@prefix math: <http://www.e-editiones.ch/ontology/mathematics#>.

			math:hasOrdinalLiteral  
			math:hasOrdinalNumeral  

and a set of rules that can be made as general as possible, but very likely only within a certain project, considering the numerous possible combinations in creating alphanumeric identifiers.

## Machine Reasoner EYE (Euler Yet another proof Engine):
Development: https://github.com/josd/eye  
Download site: https://sourceforge.net/projects/eulersharp/files/eulersharp/  
EYE comes with syntax check and intrinsic functionality provided by [built-ins](https://raw.githubusercontent.com/josd/eye/master/eye-builtins.n3), 
All other reasoning material has to be input, i.e. OWL-ontologies, RDF-data, N3-rules.  

## Basic command example for EYE:

Note: the command for the reasoner is written for Unix OS, but can be easily converted for Windows OS.

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
