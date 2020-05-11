require 'airport'

describe Airport do

  it 'plane lands at airport' do
    expect(subject.land).to eq "plane"
  end

  it 'plane in as argument lands at airport' do
    expect(subject.land(plane)).to eq "plane"
  end
end