require 'spec_helper'

describe DbdOnto::Dbd do

  include Spec::Context

  it 'is a Dbd::Graph' do
    subject.should be_a(Dbd::Graph)
  end

  it 'all facts in the dbd ontology have the meta context as context' do
    subject.all? do |fact|
      begin
        fact.is_a?(Dbd::ContextFact) ||
        check_context?(subject.by_subject(fact.context_subject))
      end
    end.should be_true
  end

  describe 'properties include' do

    let(:rdf_uri_subject) do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'dbd:rdf_uri'
        end
      end.subject
    end

    def assert_uri_present(resource)
      resource.detect do |fact|
        fact.predicate == 'dbd:rdf_uri'
      end.should_not be_nil
    end

    def assert_comment_present(resource)
      resource.detect do |fact|
        fact.predicate == 'rdfs:comment'
      end.should_not be_nil
    end

    describe 'dbd:rdf_uri' do

      let(:rdf_uri_facts) { subject.by_subject(rdf_uri_subject) }

      it 'defines the predicate dbd:rdf_uri' do
        rdf_uri_facts.should_not be_nil
      end

      it 'has label RDF URI' do
        rdf_uri_facts.detect do |fact|
          begin
            fact.predicate == 'rdfs:label' &&
            fact.object == 'RDF URI'
          end
        end.should_not be_nil
      end

      it 'has a uri' do
        assert_uri_present(rdf_uri_facts)
      end

      it 'has a Comment' do
        assert_comment_present(rdf_uri_facts)
      end
    end
  end
end
