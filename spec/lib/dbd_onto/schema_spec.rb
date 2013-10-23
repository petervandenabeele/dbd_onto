require 'spec_helper'

describe DbdOnto::Schema do

  include Spec::Context

  it 'is a Dbd::Graph' do
    subject.should be_a(Dbd::Graph)
  end

  context 'performance optimalisation: loads from file only once per class load' do
    it "when calling new twice it does not receive the file load at all" do
      described_class.should_not_receive(:filename)
      described_class.new
      described_class.new
    end
  end

  it 'all facts in the Schema ontology have the schema_context as context' do
    subject.all? do |fact|
      begin
        fact.is_a?(Dbd::ContextFact) ||
        check_schema_context?(subject.by_subject(fact.context_subject))
      end
    end.should be_true
  end

  describe 'properties include' do

    it 'defines predicate schema:about' do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'schema:about'
        end
      end.should_not be_nil
    end

    it 'defines predicate dbd:rdf_uri' do
      subject.detect do |fact|
        begin
          fact.predicate == 'dbd:rdf_uri' &&
          fact.object == 'http://schema.org/unitCode'
        end
      end.should_not be_nil
    end

    it 'defines predicate rdfs:label' do
      subject.detect do |fact|
        begin
          fact.predicate == 'rdfs:label' &&
          fact.object == 'tickerSymbol'
        end
      end.should_not be_nil
    end

    it 'defines predicate rdfs:comment' do
      subject.detect do |fact|
        begin
          fact.predicate == 'rdfs:comment' &&
          fact.object == 'The type of tissue sample required for the test.'
        end
      end.should_not be_nil
    end

    it 'defines predicate meta:predicate_used' do
      subject.detect do |fact|
        fact.predicate == 'meta:predicate_used'
      end.should_not be_nil
    end
  end
end
