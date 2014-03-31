# Meta ontology

A first meta ontology is constructed with a few resources as a bootstrap to start defining the rest.

It defines these predicates:

* meta:defines_predicate

As a bootstrap, this ontology defines itself (the predicate is equal to the object).

* meta:predicate_used

This predicate determines if a predicate is used in the UI for new resources (Schema.org
has a lot of predicate (600 +) and I prefer not to start using them all at once in a first
simplistic implementation).

