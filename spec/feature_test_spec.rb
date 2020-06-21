require 'airport'

describe Airport do

  let(:boeing) {Plane.new}
  let(:airbus) {Plane.new}
  let(:concord) {Plane.new}
  let(:stormy_weather) { allow(subject).to receive(:stormy?).and_return true }
  let(:good_weather) { allow(subject).to receive(:stormy?).and_return false }

  it 'lands 2 planes, one plane takes off, one plane cannot take off due to stormy weather' do
    good_weather
    subject.land(boeing)
    subject.land(airbus)
    subject.take_off(airbus)
    stormy_weather
    expect { subject.take_off(boeing) }.to raise_error "cannot take off due to stormy weather"
  end

  it 'change capacity, land 2 planes, 3rd raises error airport is full' do
    good_weather
    subject.change_capacity(2)
    subject.land(boeing)
    subject.land(airbus)
    expect { subject.land(concord) }.to raise_error "airport is full"
  end
end