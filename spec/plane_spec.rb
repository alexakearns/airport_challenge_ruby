require 'plane'

describe Plane do

  it 'plane defaults to in_flight' do
    expect(subject.flying?).to be true
  end
end