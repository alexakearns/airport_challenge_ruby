require 'plane'

describe Plane do

  it 'plane defaults to in_flight' do
    expect(subject.in_flight).to eq true
  end
end