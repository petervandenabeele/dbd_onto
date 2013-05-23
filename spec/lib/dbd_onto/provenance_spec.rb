require 'spec_helper'

describe DbdOnto::Provenance do

  it "is a Dbd::Graph" do
    subject.should be_a(Dbd::Graph)
  end

end
