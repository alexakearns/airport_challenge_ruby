require 'airport'

describe Airport do

  let(:boeing) { Plane.new }
  let(:good_weather) { allow(subject).to receive(:is_stormy?).and_return false }
  let(:stormy_weather) { allow(subject).to receive(:is_stormy?).and_return true }

  context '#land' do
    it 'stores plane in hangar' do
      good_weather
      subject.land(boeing)
      expect(subject.hangar).to include(boeing)
    end

    it 'landed plane show not in flight' do
      good_weather
      subject.land(boeing)
      expect(boeing).to_not be_flying
    end

    it 'plane can not land if airport is full' do
      good_weather
      5.times { subject.land(boeing) }
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
      allow(subject).to receive(:is_stormy?).and_return(false)
      expect { subject.take_off(boeing) }.to raise_error "plane not in hangar"
    end

    it 'plane can not take off if weather is stormy' do
      subject.land(boeing)
      allow(subject).to receive(:is_stormy?).and_return(true)
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
      2.times { subject.land(boeing) }
      expect { subject.land(boeing) }.to raise_error "airport is full"
    end
  end

  context 'plane in hangar?' do
    it 'confirms plane is in hangar' do
      good_weather
      subject.land(boeing)
      expect(subject.in_hangar?(boeing)).to be true
    end
  end  

  context '#is_stormy?' do
    it 'stormy weather returns true' do
      allow(subject).to receive(:is_stormy?).and_return(true)
      expect(subject.is_stormy?).to be true
    end

    it 'stormy weather returns true' do
      allow(subject).to receive(:is_stormy?).and_return(false)
      expect(subject.is_stormy?).to be false
    end
  end
end  
