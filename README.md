# DbdOnto

Ontologies for [Dbd].

First a limited Provenance ontology is constructed, because it is required for all facts. This provenance ontology also has a provenance resource (using the provenance predicates defined in itself, to bootstrap the system).

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
[ prov ] : 44c2dd0f : dcterms:created          : 2013-05-26 19:30:00 UTC
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
```

[Dbd]:              https://github.com/petervandenabeele/dbd#readme
