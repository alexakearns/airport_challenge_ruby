require 'airport'

describe Airport do

  let(:boeing) {Plane.new}

  it 'plane in as argument lands at airport' do
    expect(subject.land("plane")).to eq "plane"
  end

  it 'returns plane object in #land at airport' do
    expect(subject.land(boeing)).to be_an_instance_of(Plane)
end
end