# DbdOnto

Ontologies for [Dbd].

First a limited Provenance ontology is constructed, because it is required for all facts. This provenance ontology also has a provenance resource (using the provenance predicates defined in itself, to bootstrap the system).

The Provenance ontology uses one meta:defines_predicate attribute from a new Meta ontology. This is needed to describe the definition of predicates, since predicates cannot be the subject of Fact (in Dbd, a subject is an abstract UUID, not a URI, so a link is needed between a resource (all facts with the same subject) and the predicate (that is then the object for this fact that defines the predicate)).

[![Gem Version](https://badge.fury.io/rb/dbd_onto.png)](http://badge.fury.io/rb/dbd_onto)
[![Build Status](https://travis-ci.org/petervandenabeele/dbd_onto.png?branch=master)](http://travis-ci.org/petervandenabeele/dbd_onto)

## Installation

Add this line to your application's Gemfile:

    gem 'dbd_onto'

## Usage

Used by Dbd and applications that use Dbd.

## Examples

The ontology is stored as a [Dbd]::Graph. Displaying it in short format:

```
dbd_onto $ irb
2.0.0p247 :001 > require 'dbd_onto'
 => true
2.0.0p247 :002 > DbdOnto::Provenance.new.each {|f| puts f.short} ; nil
[ prov ] : 9a5f4645 : prov:context             : public
[ prov ] : 9a5f4645 : prov:encryption          : clear
[ prov ] : 9a5f4645 : prov:source              : https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a15
[ prov ] : 9a5f4645 : dcterms:creator          : Peter Vandenabeele (@peter_v)
[ prov ] : 9a5f4645 : dcterms:created          : 2013-05-26 21:30:00 UTC
[ prov ] : 9a5f4645 : prov:license             : Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT
9a5f4645 : 07ed816a : meta:defines_predicate   : prov:context
9a5f4645 : 07ed816a : rdfs:label               : Context
9a5f4645 : 73e8c183 : meta:defines_predicate   : prov:encryption
9a5f4645 : 73e8c183 : rdfs:label               : Encryption
9a5f4645 : 29fe4cd7 : meta:defines_predicate   : prov:source
9a5f4645 : 29fe4cd7 : rdfs:label               : Source
9a5f4645 : d42ae754 : meta:defines_predicate   : prov:license
9a5f4645 : d42ae754 : rdfs:label               : License
9a5f4645 : 7a5009e5 : meta:defines_predicate   : dcterms:creator
9a5f4645 : 7a5009e5 : rdfs:label               : Creator
9a5f4645 : 9b2102c1 : meta:defines_predicate   : dcterms:created
9a5f4645 : 9b2102c1 : rdfs:label               : Created
 => nil
2.0.0p247 :003 > DbdOnto::Meta.new.each {|f| puts f.short} ; nil
[ prov ] : bc51eaa4 : prov:context             : public
[ prov ] : bc51eaa4 : prov:encryption          : clear
[ prov ] : bc51eaa4 : prov:source              : https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a15
[ prov ] : bc51eaa4 : dcterms:creator          : Peter Vandenabeele (@peter_v)
[ prov ] : bc51eaa4 : dcterms:created          : 2013-05-26 21:30:00 UTC
[ prov ] : bc51eaa4 : prov:license             : Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT
bc51eaa4 : ecfef395 : meta:defines_predicate   : meta:defines_predicate
bc51eaa4 : ecfef395 : rdfs:label               : Defines predicate
 => nil
```

[Dbd]:              https://github.com/petervandenabeele/dbd#readme
