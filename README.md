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
2.0.0-p195 :001 > require 'dbd_onto'
 => true
2.0.0-p195 :002 > DbdOnto::Provenance.new.each {|f| puts f.short} ; nil
[ prov ] : 44c2dd0f : prov:context             : public
[ prov ] : 44c2dd0f : prov:source              : https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e6
[ prov ] : 44c2dd0f : dcterms:creator          : Peter Vandenabeele (@peter_v)
[ prov ] : 44c2dd0f : dcterms:created          : 2013-05-26 21:30:00 UTC
[ prov ] : 44c2dd0f : prov:license             : Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), 
44c2dd0f : e350ae17 : meta:defines_predicate   : prov:context
44c2dd0f : e350ae17 : rdfs:label               : Context
44c2dd0f : 5256a1be : meta:defines_predicate   : prov:source
44c2dd0f : 5256a1be : rdfs:label               : Source
44c2dd0f : dd57068f : meta:defines_predicate   : prov:license
44c2dd0f : dd57068f : rdfs:label               : License
44c2dd0f : 5cddba10 : meta:defines_predicate   : dcterms:creator
44c2dd0f : 5cddba10 : rdfs:label               : Creator
44c2dd0f : ece58739 : meta:defines_predicate   : dcterms:created
44c2dd0f : ece58739 : rdfs:label               : Created
 => nil
2.0.0-p195 :003 > DbdOnto::Meta.new.each {|f| puts f.short} ; nil
[ prov ] : b75f3b8c : prov:context             : public
[ prov ] : b75f3b8c : prov:source              : https://github.com/petervandenabeele/dbd_onto/blob/08adb5bf0e
[ prov ] : b75f3b8c : dcterms:creator          : Peter Vandenabeele (@peter_v)
[ prov ] : b75f3b8c : dcterms:created          : 2013-06-03 21:00:00 UTC
[ prov ] : b75f3b8c : prov:license             : Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), 
b75f3b8c : bd07e072 : meta:defines_predicate   : meta:defines_predicate
b75f3b8c : bd07e072 : rdfs:label               : Defines predicate
 => nil 
```

[Dbd]:              https://github.com/petervandenabeele/dbd#readme
