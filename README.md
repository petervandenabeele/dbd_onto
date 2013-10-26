# DbdOnto

Ontologies for [Dbd].

First a limited context ontology is constructed, because it is required for all facts. This context ontology also has a "meta" context itself (using the context predicates defined in itself, to bootstrap the system).

The context ontology uses one meta:defines_predicate attribute from a new Meta ontology. This is needed to describe the definition of predicates, since predicates cannot be the subject of Fact (in Dbd, a subject is an abstract UUID, not a URI, so a link is needed between a resource (all facts with the same subject) and the predicate (that is then the object for this fact that defines the predicate)).

[![Gem Version](https://badge.fury.io/rb/dbd_onto.png)](http://badge.fury.io/rb/dbd_onto)
[![Build Status](https://travis-ci.org/petervandenabeele/dbd_onto.png?branch=master)](http://travis-ci.org/petervandenabeele/dbd_onto)

## Installation

Add this line to your application's Gemfile:

    gem 'dbd_onto'

## Usage

E.g. use the predicates defined in DbdOnto::Context to fully populate a Context.

## Examples

The ontology is stored as a [Dbd]::Graph. Displaying it in short format:

```
$ irb
2.0.0p247 :001 > require 'dbd_onto'
 => true
2.0.0p247 :002 > DbdOnto::Meta.new.each {|f| puts f.short} ; nil
 cont ] : 36c0b50f : context:visibility       : public
[ cont ] : 36c0b50f : context:encryption       : clear
[ cont ] : 36c0b50f : context:license          : Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT
[ cont ] : 36c0b50f : dc:source                : https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a15
[ cont ] : 36c0b50f : dc:creator               : Peter Vandenabeele (@peter_v)
[ cont ] : 36c0b50f : dcterms:created          : 2013-08-09 21:45:00 UTC
[ cont ] : 36c0b50f : rdfs:comment             : This meta context covers a creation period starting Aug 2013 until ...
36c0b50f : 619e69d4 : meta:defines_predicate   : meta:defines_predicate
36c0b50f : 619e69d4 : rdfs:label               : Defines predicate
36c0b50f : 619e69d4 : dbd:rdf_uri              : https://github.com/petervandenabeele/dbd_onto/blob/master/data/meta.md
36c0b50f : 619e69d4 : rdfs:comment             : Needed to bootstrap ontology definitions
36c0b50f : 619e69d4 : meta:defines_predicate   : meta:predicate_used
36c0b50f : 619e69d4 : rdfs:label               : Predicate used
36c0b50f : 619e69d4 : dbd:rdf_uri              : https://github.com/petervandenabeele/dbd_onto/blob/master/data/meta.md
36c0b50f : 619e69d4 : rdfs:comment             : Is this predicate used in the UI for creating new resources?
 => nil
2.0.0p247 :005 >   DbdOnto::Context.new.each {|f| puts f.short} ; nil
[ cont ] : 36c0b50f : context:visibility       : public
[ cont ] : 36c0b50f : context:encryption       : clear
[ cont ] : 36c0b50f : context:license          : Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT
[ cont ] : 36c0b50f : dc:source                : https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a15
[ cont ] : 36c0b50f : dc:creator               : Peter Vandenabeele (@peter_v)
[ cont ] : 36c0b50f : dcterms:created          : 2013-08-09 21:45:00 UTC
[ cont ] : 36c0b50f : rdfs:comment             : This meta context covers a creation period starting Aug 2013 until ...
36c0b50f : 03e72b0c : meta:defines_predicate   : context:visibility
36c0b50f : 03e72b0c : rdfs:label               : Visibility
36c0b50f : 03e72b0c : dbd:rdf_uri              : https://github.com/petervandenabeele/dbd_onto/blob/master/data/context.md
36c0b50f : 03e72b0c : rdfs:comment             : E.g. public, private, professional, ...
36c0b50f : 735ae2a2 : meta:defines_predicate   : context:encryption
36c0b50f : 735ae2a2 : rdfs:label               : Encryption
36c0b50f : 735ae2a2 : dbd:rdf_uri              : https://github.com/petervandenabeele/dbd_onto/blob/master/data/context.md
36c0b50f : 735ae2a2 : rdfs:comment             : E.g. clear, encrypted, AES-256, my_very_secret_key
36c0b50f : 5b2c73e5 : meta:defines_predicate   : context:license
36c0b50f : 5b2c73e5 : rdfs:label               : License
36c0b50f : 5b2c73e5 : dbd:rdf_uri              : https://github.com/petervandenabeele/dbd_onto/blob/master/data/context.md
36c0b50f : 5b2c73e5 : rdfs:comment             : E.g. Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under
36c0b50f : ffc41d9c : meta:defines_predicate   : dc:source
36c0b50f : ffc41d9c : rdfs:label               : Source
36c0b50f : ffc41d9c : dbd:rdf_uri              : https://github.com/petervandenabeele/dbd_onto/blob/master/data/context.md
36c0b50f : ffc41d9c : rdfs:comment             : E.g. Entered manually by @peter_v (also see Dublin Core)
36c0b50f : 2b5008b0 : meta:defines_predicate   : dc:creator
36c0b50f : 2b5008b0 : rdfs:label               : Creator
36c0b50f : 2b5008b0 : dbd:rdf_uri              : https://github.com/petervandenabeele/dbd_onto/blob/master/data/context.md
36c0b50f : 2b5008b0 : rdfs:comment             : E.g. @peter_v (also see Dublin Core)
36c0b50f : 4aba46de : meta:defines_predicate   : dcterms:created
36c0b50f : 4aba46de : rdfs:label               : Created
36c0b50f : 4aba46de : dbd:rdf_uri              : https://github.com/petervandenabeele/dbd_onto/blob/master/data/context.md
36c0b50f : 4aba46de : rdfs:comment             : E.g. 2013-10-20 (also see Dublin Core Terms)
 => nil
2.0.0p247 :007 >   DbdOnto::Dbd.new.each {|f| puts f.short} ; nil
[ cont ] : 36c0b50f : context:visibility       : public
[ cont ] : 36c0b50f : context:encryption       : clear
[ cont ] : 36c0b50f : context:license          : Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT
[ cont ] : 36c0b50f : dc:source                : https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a15
[ cont ] : 36c0b50f : dc:creator               : Peter Vandenabeele (@peter_v)
[ cont ] : 36c0b50f : dcterms:created          : 2013-08-09 21:45:00 UTC
[ cont ] : 36c0b50f : rdfs:comment             : This meta context covers a creation period starting Aug 2013 until ...
36c0b50f : 619e69d4 : meta:defines_predicate   : dbd:rdf_uri
36c0b50f : 619e69d4 : rdfs:label               : RDF URI
36c0b50f : 619e69d4 : dbd:rdf_uri              : https://github.com/petervandenabeele/dbd_onto/blob/master/data/dbd.md
36c0b50f : 619e69d4 : rdfs:comment             : points to an RDF URI type, without the <> characters
 => nil
2.0.0p247 :011 > DbdOnto::Schema.new.take(14).each {|f| puts f.short} ; nil
[ cont ] : 37c0b50f : context:visibility       : public
[ cont ] : 37c0b50f : context:encryption       : clear
[ cont ] : 37c0b50f : context:license          : Copyright the sponsors of Schema.org: Google, Inc., Yahoo, Inc., and Microsoft C
[ cont ] : 37c0b50f : dc:source                : http://schema.org
[ cont ] : 37c0b50f : dc:creator               : Peter Vandenabeele (@peter_v)
[ cont ] : 37c0b50f : dcterms:created          : 2013-10-15 21:56:00 UTC
37c0b50f : d00871dc : meta:defines_predicate   : schema:about
37c0b50f : d00871dc : dbd:rdf_uri              : http://schema.org/about
37c0b50f : d00871dc : rdfs:label               : about
37c0b50f : d00871dc : rdfs:comment             : The subject matter of the content.
37c0b50f : fb6b6a77 : meta:defines_predicate   : schema:acceptedPaymentMethod
37c0b50f : fb6b6a77 : dbd:rdf_uri              : http://schema.org/acceptedPaymentMethod
37c0b50f : fb6b6a77 : rdfs:label               : acceptedPaymentMethod
37c0b50f : fb6b6a77 : rdfs:comment             : The payment method(s) accepted by seller for this offer.
 => nil
```

[Dbd]:              https://github.com/petervandenabeele/dbd#readme
