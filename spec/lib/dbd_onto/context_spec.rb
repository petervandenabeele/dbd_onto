require 'spec_helper'

describe DbdOnto::Context do

  include Spec::Context

  it 'is a Dbd::Graph' do
    subject.should be_a(Dbd::Graph)
  end

  it 'all facts in the context ontology have the meta context as context' do
    subject.all? do |fact|
      begin
        fact.is_a?(Dbd::ContextFact) ||
        check_context?(subject.by_subject(fact.context_subject))
      end
    end.should be_true
  end

  describe 'properties include' do

    let(:visibility_subject) do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'context:visibility'
        end
      end.subject
    end

    let(:encryption_subject) do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'context:encryption'
        end
      end.subject
    end

    let(:source_subject) do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'dc:source'
        end
      end.subject
    end

    let(:creator_subject) do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'dc:creator'
        end
      end.subject
    end


    let(:created_subject) do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'dcterms:created'
        end
      end.subject
    end


    let(:license_subject) do
      subject.detect do |fact|
        begin
          fact.predicate == 'meta:defines_predicate' &&
          fact.object == 'context:license'
        end
      end.subject
    end

    describe 'context:visibility and dc:source' do
      it 'are different subjects' do
        visibility_subject.should_not == source_subject
      end
    end

    def assert_label_present(resource)
      resource.detect do |fact|
        fact.predicate == 'rdfs:label'
      end.should_not be_nil
    end


    def assert_uri_present(resource)
      resource.detect do |fact|
        fact.predicate == 'rdf:uri'
      end.should_not be_nil
    end

    def assert_comment_present(resource)
      resource.detect do |fact|
        fact.predicate == 'rdfs:comment'
      end.should_not be_nil
    end

    describe 'context:visibility' do

      let(:visibility_facts) { subject.by_subject(visibility_subject) }

      it 'defines the predicate context:visibility' do
        visibility_subject.should_not be_nil
      end

      it 'has label Context' do
        visibility_facts.detect do |fact|
          begin
            fact.predicate == 'rdfs:label' &&
            fact.object == 'Visibility'
          end
        end.should_not be_nil
      end

      it 'has a uri' do
        assert_uri_present(visibility_facts)
      end

      it 'has a Comment' do
        assert_comment_present(visibility_facts)
      end
    end

    describe 'context:encryption' do

      let(:encryption_facts) { subject.by_subject(encryption_subject) }

      it 'defines the predicate context:encryption' do
        encryption_subject.should_not be_nil
      end

      it 'has label Encryption' do
        encryption_facts.detect do |fact|
          begin
            fact.predicate == 'rdfs:label' &&
            fact.object == 'Encryption'
          end
        end.should_not be_nil
      end

      it 'has a uri' do
        assert_uri_present(encryption_facts)
      end

      it 'has a Comment' do
        assert_comment_present(encryption_facts)
      end
    end

    describe 'dc:source' do

      let(:source_facts) { subject.by_subject(source_subject) }

      it 'defines the predicate dc:source' do
        source_subject.should_not be_nil
      end

      it 'has label Source' do
        source_facts.detect do |fact|
          begin
            fact.predicate == 'rdfs:label' &&
            fact.object == 'Source'
          end
        end.should_not be_nil
      end

      it 'has a uri' do
        assert_uri_present(source_facts)
      end

      it 'has a Comment' do
        assert_comment_present(source_facts)
      end

    end

    describe 'dc:creator' do

      let(:creator_facts) { subject.by_subject(creator_subject) }

      it 'defines the predicate' do
        creator_subject.should_not be_nil
      end

      it 'has a uri' do
        assert_uri_present(creator_facts)
      end

      it 'has a Comment' do
        assert_comment_present(creator_facts)
      end
    end

    describe 'dcterms:created' do

      let(:created_facts) { subject.by_subject(created_subject) }

      it 'has a uri' do
        assert_uri_present(created_facts)
      end

      it 'has a Comment' do
        assert_comment_present(created_facts)
      end
    end

    describe 'context:license' do

      let(:license_facts) { subject.by_subject(license_subject) }

      it 'has a uri' do
        assert_uri_present(license_facts)
      end

      it 'has a Comment' do
        assert_comment_present(license_facts)
      end
    end
  end
end
