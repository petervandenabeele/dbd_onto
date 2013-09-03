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

Used by Dbd and applications that use Dbd.

## Examples

The ontology is stored as a [Dbd]::Graph. Displaying it in short format:

```
/Users/peter_v/dbd_onto $ irb
2.0.0p247 :001 > require 'dbd_onto'
 => true
2.0.0p247 :002 > DbdOnto::Meta.new.each {|f| puts f.short} ; nil
[ cont ] : 36c0b50f : context:visibility       : public
[ cont ] : 36c0b50f : context:encryption       : clear
[ cont ] : 36c0b50f : context:license          : Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT
[ cont ] : 36c0b50f : dc:source                : https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a15
[ cont ] : 36c0b50f : dc:creator               : Peter Vandenabeele (@peter_v)
[ cont ] : 36c0b50f : dcterms:created          : 2013-08-09 21:45:00 UTC
36c0b50f : 619e69d4 : meta:defines_predicate   : meta:defines_predicate
36c0b50f : 619e69d4 : rdfs:label               : Defines predicate
 => nil
2.0.0p247 :003 > DbdOnto::Context.new.each {|f| puts f.short} ; nil
[ cont ] : 6aac5473 : context:visibility       : public
[ cont ] : 6aac5473 : context:encryption       : clear
[ cont ] : 6aac5473 : context:license          : Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT
[ cont ] : 6aac5473 : dc:source                : https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a15
[ cont ] : 6aac5473 : dc:creator               : Peter Vandenabeele (@peter_v)
[ cont ] : 6aac5473 : dcterms:created          : 2013-08-09 21:45:00 UTC
6aac5473 : a2e3ed3f : meta:defines_predicate   : context:visibility
6aac5473 : a2e3ed3f : rdfs:label               : Visibility
6aac5473 : 57ff4dc0 : meta:defines_predicate   : context:encryption
6aac5473 : 57ff4dc0 : rdfs:label               : Encryption
6aac5473 : d3a1fcc9 : meta:defines_predicate   : context:license
6aac5473 : d3a1fcc9 : rdfs:label               : License
6aac5473 : aea4f895 : meta:defines_predicate   : dc:source
6aac5473 : aea4f895 : rdfs:label               : Source
6aac5473 : f60f60ba : meta:defines_predicate   : dc:creator
6aac5473 : f60f60ba : rdfs:label               : Creator
6aac5473 : 225c6fe5 : meta:defines_predicate   : dcterms:created
6aac5473 : 225c6fe5 : rdfs:label               : Created
 => nil
```

[Dbd]:              https://github.com/petervandenabeele/dbd#readme
