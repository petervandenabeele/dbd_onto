require 'spec_helper'

describe DbdOnto::Provenance do

  it "is a Dbd::Graph" do
    subject.should be_a(Dbd::Graph)
  end

  describe "properties include" do
    describe "context" do
      it "predicate is prov:context" do
        subject.detect do |fact|
          fact.predicate == 'rdf:predicate' &&
          fact.object == 'prov:context'
        end.should_not be_nil
      end

      it "label is Context" do
        subject.detect do |fact|
          fact.predicate == 'rdfs:label' &&
          fact.object == 'Context'
        end.should_not be_nil
      end
    end
  end
end
