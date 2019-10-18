# Rules
In the [NIE-INE](http://www.nie-ine.ch)-project we develop an infrastructure to enable scholarly edition projects in the Humanities to express their data in an enriched format, adhering to the FAIR-principles, and ensuring long-term storage of the data.  
The project runs at the Swiss Universities of Basel, Bern, Zürich, and Geneva until end of 2020.

The essence of the infrastructure is that data, stored in e.g. a MySQL relational database, are converted to a different machine-readable format, i.e. one that makes the semantics of the data explicit.  
To enable data expression in this new format a series of vocabularies or [ontologies](https://github.com/nie-ine/Ontologies) are created, representing [Semantic Web technology](https://github.com/nie-ine/Ontologies/wiki/1.-Introduction-to-Semantic-Web-technology).  

Besides these ontologies, rules for machine resoning are developed. They are expressed in the [Notation 3 language](https://www.w3.org/TeamSubmission/n3/), also using elements of NIE and other ontologies. N3-rules serve different purposes.
A first one is the [implementation of the RDF model theory](https://github.com/josd/eye/tree/master/reasoning/rpo). This series of N3-rules is published at 

 is consistency checking.  These rules are to be used with a machine reasoner.  
Notation 3 is an assertion and logic language which is a superset of RDF. N3 extends the RDF datamodel by adding formulae (literals which are graphs themselves), variables, logical implication, and functional predicates, as well as providing a textual syntax (alternative to RDF/XML). In this way Turtle is a subset of N3 syntax.  

An introduction to [N3 rules for machine reasoning](https://github.com/nie-ine/Rules/wiki/Introduction-to-N3-rules-for-machine-reasoning) is on the wiki.
