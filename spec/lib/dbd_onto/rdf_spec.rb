require 'spec_helper'

describe DbdOnto::Rdf do

  include Spec::Context

  it 'is a Dbd::Graph' do
    subject.should be_a(Dbd::Graph)
  end

  it 'all facts in the rdf ontology have the rdf_context' do
    subject.all? do |fact|
      fact.is_a?(Dbd::ContextFact) ||
        check_rdf_context?(subject.by_subject(fact.context_subject))
    end.should be_true
  end

  describe 'properties include' do

    let(:rdf_type_subject) do
      subject.detect do |fact|
        fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'rdf:type'
      end.subject
    end

    describe 'rdf_type' do

      let(:rdf_type_facts) { subject.by_subject(rdf_type_subject) }

      it 'defines the predicate rdf_type' do
        rdf_type_subject.should_not be_nil
      end

      it 'has label "RDF type"' do
        rdf_type_facts.detect do |fact|
          begin
            fact.predicate == 'rdfs:label' &&
            fact.object == 'RDF type'
          end
        end.should_not be_nil
      end

      it 'has a URI' do
        rdf_type_facts.detect do |fact|
          fact.predicate == 'dbd:rdf_uri'
        end.should_not be_nil
      end

      it 'has a comment' do
        rdf_type_facts.detect do |fact|
          fact.predicate == 'rdfs:comment'
        end.should_not be_nil
      end

      it 'is used' do
        rdf_type_facts.detect do |fact|
          fact.predicate == 'meta:predicate_used'
        end.should_not be_nil
      end
    end
  end
end
