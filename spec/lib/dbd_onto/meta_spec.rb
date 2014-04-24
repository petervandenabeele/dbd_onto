require 'spec_helper'

describe DbdOnto::Meta do

  include Spec::Context

  it 'is a Dbd::Graph' do
    subject.should be_a(Dbd::Graph)
  end

  it 'all facts in the meta ontology have the meta_context' do
    subject.all? do |fact|
      begin
        fact.is_a?(Dbd::ContextFact) ||
        check_context?(subject.by_subject(fact.context_subject))
      end
    end.should be_true
  end

  describe 'properties include' do

    let(:meta_defines_predicate_subject) do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'meta:defines_predicate'
        end
      end.subject
    end

    let(:meta_predicate_used_subject) do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'meta:predicate_used'
        end
      end.subject
    end

    describe 'meta:defines_predicate' do

      let(:defines_predicate_facts) { subject.by_subject(meta_defines_predicate_subject) }

      it 'defines the predicate meta:defines_predicate' do
        meta_defines_predicate_subject.should_not be_nil
      end

      it 'has label "Defines predicate"' do
        defines_predicate_facts.detect do |fact|
          begin
            fact.predicate == 'rdfs:label' &&
            fact.object == 'Defines predicate'
          end
        end.should_not be_nil
      end

      it 'has a URI' do
        defines_predicate_facts.detect do |fact|
          fact.predicate == 'dbd:rdf_uri'
        end.should_not be_nil
      end

      it 'has a comment' do
        defines_predicate_facts.detect do |fact|
          fact.predicate == 'rdfs:comment'
        end.should_not be_nil
      end

      it 'has predicate_used' do
        defines_predicate_facts.detect do |fact|
          begin
            fact.predicate == 'meta:predicate_used' &&
            fact.object == 'true'
          end
        end.should_not be_nil
      end
    end

    describe 'meta:predicate_used' do

      let(:predicate_used_facts) { subject.by_subject(meta_predicate_used_subject) }

      it 'defines the predicate meta:predicate_used' do
        meta_predicate_used_subject.should_not be_nil
      end

      it 'has label "Predicate used"' do
        predicate_used_facts.detect do |fact|
          begin
            fact.predicate == 'rdfs:label' &&
            fact.object == 'Predicate used'
          end
        end.should_not be_nil
      end

      it 'has a URI' do
        predicate_used_facts.detect do |fact|
          fact.predicate == 'dbd:rdf_uri'
        end.should_not be_nil
      end

      it 'has a comment' do
        predicate_used_facts.detect do |fact|
          fact.predicate == 'rdfs:comment'
        end.should_not be_nil
      end

      it 'has predicate_used' do
        predicate_used_facts.detect do |fact|
          begin
            fact.predicate == 'meta:predicate_used' &&
            fact.object == 'true'
          end
        end.should_not be_nil
      end
    end
  end
end
