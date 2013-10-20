require 'spec_helper'

describe DbdOnto::Schema do

  include Spec::Context

  it 'is a Dbd::Graph' do
    subject.should be_a(Dbd::Graph)
  end

  it 'all facts in the Schema ontology have the schema_context as context' do
    subject.all? do |fact|
      fact.is_a?(Dbd::ContextFact) ||
        check_schema_context?(subject.by_subject(fact.context_subject))
    end.should be_true
  end

  describe 'properties include' do

    it 'defines predicate schema:about' do
      subject.detect do |fact|
        fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'schema:about'
      end.should_not be_nil
    end

    it 'defines predicate rdf:uri' do
      subject.detect do |fact|
        fact.predicate == 'rdf:uri' &&
          fact.object == 'http://schema.org/unitCode'
      end.should_not be_nil
    end

    it 'defines predicate rdfs:label' do
      subject.detect do |fact|
        fact.predicate == 'rdfs:label' &&
          fact.object == 'tickerSymbol'
      end.should_not be_nil
    end

    it 'defines predicate rdfs:comment' do
      subject.detect do |fact|
        fact.predicate == 'rdfs:comment' &&
          fact.object == 'The type of tissue sample required for the test.'
      end.should_not be_nil
    end
  end
end
