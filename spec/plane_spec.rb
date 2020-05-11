require 'plane'

describe Plane do

  it 'plane defaults to in_flight' do
    expect(subject.flying?).to be true
  end

  it 'plane landing changes flight status to not in flight' do
    subject.land
    expect(subject.flying?).to be false
  end  

  it 'plane taking off changes flight status to in flight' do
    subject.take_off
    expect(subject.flying?).to be true
  end
end
