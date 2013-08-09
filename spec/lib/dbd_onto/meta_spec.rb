require 'spec_helper'

describe DbdOnto::Meta do

  include Spec::Context

  it "is a Dbd::Graph" do
    subject.should be_a(Dbd::Graph)
  end

  it "all facts in the meta ontology have the meta context" do
    subject.all? do |fact|
      fact.is_a?(Dbd::ContextFact) ||
        check_context?(subject.by_subject(fact.context_subject))
    end.should be_true
  end

  describe "properties include" do

    let(:meta_defines_predicate_subject) do
      subject.detect do |fact|
        fact.predicate == 'meta:defines_predicate' &&
        fact.object == 'meta:defines_predicate'
      end.subject
    end

    describe "meta:defines_predicate" do

      let(:defines_predicate_facts) { subject.by_subject(meta_defines_predicate_subject) }

      it "defines the predicate meta:defines_predicate" do
        meta_defines_predicate_subject.should_not be_nil
      end

      it "has label 'Defines predicate'" do
        defines_predicate_facts.detect do |fact|
          fact.predicate == 'rdfs:label' &&
          fact.object == 'Defines predicate'
        end.should_not be_nil
      end
    end
  end
end
