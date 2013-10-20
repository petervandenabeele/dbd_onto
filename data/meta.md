# Meta ontology

A first meta ontology is constructed with 1 resource as a bootstrap to start defining the rest.

As a bootstrap, this ontology defines itself (the predicate is equal to the object).

It defines this predicate:

* meta:defines_predicate

This predicate determines if a predicate is used in the UI for new resources (Schema.org
has a lot of predicate (600 +) and I prefer not to start using them all at once in a first
simplistic implementation).

* meta:predicate_used
