require 'airport'

describe Airport do

  let(:boeing) { Plane.new }
  let(:good_weather) { allow(subject).to receive(:stormy?).and_return false }
  let(:stormy_weather) { allow(subject).to receive(:stormy?).and_return true }

  context '#land' do
    it 'stores plane in hangar' do
      good_weather
      subject.land(boeing)
      expect(subject.hangar).to include(boeing)
    end

    it 'plane cannot land if already in hangar' do
      good_weather
      subject.land(boeing)
      expect { subject.land(boeing) }.to raise_error "this plane is already in the hangar"
    end

    it 'landed plane show not in flight' do
      good_weather
      subject.land(boeing)
      expect(boeing).to_not be_flying
    end

    it 'plane can not land if airport is full' do
      good_weather
      5.times { subject.land(Plane.new) }
      expect { subject.land(boeing) }.to raise_error "airport is full"
    end

    it 'plane can not land if weather is stormy' do
      stormy_weather
      expect { subject.land(boeing) }.to raise_error "cannot land due to stormy weather"
    end
  end

  context '#take off' do

    it 'plane removed from hanger on take off' do
      good_weather
      subject.land(boeing)      
      subject.take_off(boeing)
      expect(subject.hangar).to_not include(boeing)
    end

    it 'plane taken off shown to be in flight' do
      good_weather
      subject.land(boeing)
      subject.take_off(boeing)
      expect(boeing).to be_flying
    end

    it 'will not let plane take off if not in hanger' do
      good_weather
      expect { subject.take_off(boeing) }.to raise_error "plane not in hangar"
    end

    it 'plane can not take off if weather is stormy' do
      good_weather
      subject.land(boeing)
      stormy_weather
      expect { subject.take_off(boeing) }.to raise_error "cannot take off due to stormy weather"
    end
  end 

  context 'airport capacity' do
    it 'airport default capacity equals 5' do
      expect(subject.capacity).to eq 5
    end

    it 'changes airport capacity' do
      subject.change_capacity(3)
      expect(subject.capacity).to eq 3
    end

    it 'will not let plane land when at new capacity' do 
      good_weather
      subject.change_capacity(2)
      2.times { subject.land(Plane.new) }
      expect { subject.land(boeing) }.to raise_error "airport is full"
    end

    it 'will not let capacity change to less than number of planes in hangar' do
      good_weather
      5.times { subject.land(Plane.new) }
      expect { subject.change_capacity(3) }.to raise_error "more planes in hangar than new capacity, have some take off first"
    end
  end
end  
