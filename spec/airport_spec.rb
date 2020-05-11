require 'airport'

describe Airport do


  it 'plane in as argument lands at airport' do
    expect(subject.land("plane")).to eq "plane"
  end
end