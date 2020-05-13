require 'airport'

describe Airport do

  let(:boeing) { Plane.new }

  context '#land' do
    it 'stores plane in hangar' do
      subject.land(boeing)
      expect(subject.hangar).to include(boeing)
    end

    it 'landed plane show not in flight' do
      subject.land(boeing)
      expect(boeing).to_not be_flying
    end

    it 'plane can not land if airport is full' do
      5.times {subject.land(boeing) }
      expect { subject.land(boeing) }.to raise_error "airport is full"
    end
  end

  context '#take off' do

    it 'plane removed from hanger on take off' do
      subject.land(boeing)
      subject.take_off(boeing)
      expect(subject.hangar).to_not include(boeing)
    end

    it 'plane taken off shown to be in flight' do
      subject.land(boeing)
      subject.take_off(boeing)
      expect(boeing).to be_flying
    end

    it 'will not let plane take off if not in hanger' do
      expect { subject.take_off(boeing) }.to raise_error "plane not in hangar"
    end

    # it 'plane can not take off if weather is stormy' do
    #   subject.land(boeing)
      
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
      subject.change_capacity(2)
      2.times { subject.land(boeing) }
      expect { subject.land(boeing) }.to raise_error "airport is full"
    end
  end

  context 'plane in hangar?' do
    it 'confirms plane is in hangar' do
      subject.land(boeing)
      expect(subject.in_hangar?(boeing)).to be true
    end
  end  

  context '#is_stormy?' do
    it 'stormy weather returns true' do
      expect(subject).to receive(:rand).and_return(0.9)
      expect(subject.is_stormy?).to be true
    end
  end
end  
