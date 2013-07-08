require 'spec_helper'

module DbdOnto
  describe MetaProvenance do

    include Spec::Provenance

    let(:meta_provenance_resource) do
      Object.new.tap do |_meta_provenance_resource|
        _meta_provenance_resource.extend(described_class)
      end.meta_provenance
    end

    it "is a Dbd::ProvenanceResource" do
      meta_provenance_resource.should be_a(Dbd::ProvenanceResource)
    end

    it "all facts in the meta_provenance are provenance facts" do
      meta_provenance_resource.all? do |provenance_fact|
        provenance_fact.should be_a(Dbd::ProvenanceFact)
      end
    end

    it "the meta_provenance has all the needed entries" do
      check_provenance?(meta_provenance_resource).should be_true
    end
  end
end
