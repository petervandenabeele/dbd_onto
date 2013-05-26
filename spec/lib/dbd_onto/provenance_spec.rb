require 'spec_helper'

describe DbdOnto::Provenance do

  it "is a Dbd::Graph" do
    subject.should be_a(Dbd::Graph)
  end

  it "all facts in the provenance ontology have a provenance with context public" do
    subject.all? do |fact|
      fact.is_a?(Dbd::ProvenanceFact) ||
        check_provenance?(subject.by_subject(fact.provenance_subject))
    end.should be_true
  end

  def check_provenance?(provenance_facts)
    provenance_facts.detect {|p| p.predicate == 'prov:context' && p.object == 'public'} &&
    provenance_facts.detect {|p| p.predicate == 'prov:source'} &&
    provenance_facts.detect {|p| p.predicate == 'dcterms:creator'} &&
    provenance_facts.detect {|p| p.predicate == 'dcterms:created'} &&
    provenance_facts.detect {|p| p.predicate == 'prov:license'}
  end

  describe "properties include" do

    let(:context_subject) do
      subject.detect do |fact|
        fact.predicate == 'meta:defines_predicate' &&
        fact.object == 'prov:context'
      end.subject
    end

    let(:source_subject) do
      subject.detect do |fact|
        fact.predicate == 'meta:defines_predicate' &&
        fact.object == 'prov:source'
      end.subject
    end

    describe "prov:subject and prov:source" do
      it "are different subjects" do
        context_subject.should_not == source_subject
      end
    end

    describe "prov:context" do

      let(:context_facts) { subject.by_subject(context_subject) }

      it "defines the predicate prov:context" do
        context_subject.should_not be_nil
      end

      it "has label Context" do
        context_facts.detect do |fact|
          fact.predicate == 'rdfs:label' &&
          fact.object == 'Context'
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

    describe "dcterms:creator" do
      it "defines the predicate" do
        subject.detect do |fact|
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'dcterms:creator'
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

    describe "prov:license" do
      it "defines the predicate" do
        subject.detect do |fact|
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'prov:license'
        end.should_not be_nil
      end
    end
  end
end
