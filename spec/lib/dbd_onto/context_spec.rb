require 'spec_helper'

describe DbdOnto::Context do

  include Spec::Context

  it "is a Dbd::Graph" do
    subject.should be_a(Dbd::Graph)
  end

  it "all facts in the context ontology have the meta context as context" do
    subject.all? do |fact|
      fact.is_a?(Dbd::ContextFact) ||
        check_context?(subject.by_subject(fact.context_subject))
    end.should be_true
  end

  describe "properties include" do

    let(:visibility_subject) do
      subject.detect do |fact|
        fact.predicate == 'meta:defines_predicate' &&
        fact.object == 'context:visibility'
      end.subject
    end

    let(:encryption_subject) do
      subject.detect do |fact|
        fact.predicate == 'meta:defines_predicate' &&
        fact.object == 'context:encryption'
      end.subject
    end

    let(:source_subject) do
      subject.detect do |fact|
        fact.predicate == 'meta:defines_predicate' &&
        fact.object == 'dc:source'
      end.subject
    end

    describe "prov:subject and prov:source" do
      it "are different subjects" do
        visibility_subject.should_not == source_subject
      end
    end

    describe "context:visibility" do

      let(:visibility_facts) { subject.by_subject(visibility_subject) }

      it "defines the predicate context:visibility" do
        visibility_subject.should_not be_nil
      end

      it "has label Context" do
        visibility_facts.detect do |fact|
          fact.predicate == 'rdfs:label' &&
          fact.object == 'Visibility'
        end.should_not be_nil
      end
    end

    describe "prov:encryption" do

      let(:encryption_facts) { subject.by_subject(encryption_subject) }

      it "defines the predicate prov:encryption" do
        encryption_subject.should_not be_nil
      end

      it "has label Encryption" do
        encryption_facts.detect do |fact|
          fact.predicate == 'rdfs:label' &&
          fact.object == 'Encryption'
        end.should_not be_nil
      end
    end

    describe "prov:source" do

      let(:source_facts) { subject.by_subject(source_subject) }

      it "defines the predicate prov:source" do
        source_subject.should_not be_nil
      end

      it "has label Source" do
        source_facts.detect do |fact|
          fact.predicate == 'rdfs:label' &&
          fact.object == 'Source'
        end.should_not be_nil
      end
    end

    describe "dc:creator" do
      it "defines the predicate" do
        subject.detect do |fact|
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'dc:creator'
        end.should_not be_nil
      end
    end

    describe "dcterms:created" do
      it "defines the predicate" do
        subject.detect do |fact|
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'dcterms:created'
        end.should_not be_nil
      end
    end

    describe "context:license" do
      it "defines the predicate" do
        subject.detect do |fact|
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'context:license'
        end.should_not be_nil
      end
    end
  end
end
