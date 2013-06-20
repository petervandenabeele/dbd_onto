require 'spec_helper'

describe DbdOnto::Meta do

  it "is a Dbd::Graph" do
    subject.should be_a(Dbd::Graph)
  end

  it "all facts in the meta ontology have a provenance with context public" do
    subject.all? do |fact|
      fact.is_a?(Dbd::ProvenanceFact) ||
        check_provenance?(subject.by_subject(fact.provenance_subject))
    end.should be_true
  end

  def check_provenance?(provenance_facts)
    provenance_facts.detect {|p| p.predicate == 'prov:context' && p.object == 'public'} &&
    provenance_facts.detect {|p| p.predicate == 'prov:encryption' && p.object == 'clear'} &&
    provenance_facts.detect {|p| p.predicate == 'prov:source'} &&
    provenance_facts.detect {|p| p.predicate == 'dcterms:creator'} &&
    provenance_facts.detect {|p| p.predicate == 'dcterms:created'} &&
    provenance_facts.detect {|p| p.predicate == 'prov:license'}
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
