require 'spec_helper'

describe DbdOnto::MetaContext do

  include Spec::Context

  let(:meta_context) do
    Object.new.tap do |_meta_context|
      _meta_context.extend(described_class)
    end.meta_context
  end

  it 'is a Dbd::Context' do
    meta_context.should be_a(Dbd::Context)
  end

  it 'all facts in the meta_context are context facts' do
    meta_context.all? do |context_fact|
      context_fact.should be_a(Dbd::ContextFact)
    end
  end

  it 'the meta_context has all the needed entries' do
    check_context?(meta_context).should be_true
  end
end
