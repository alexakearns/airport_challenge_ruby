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

    xit 'plane can not land if airport is full' do
      subject
      5.times {subject.land(boeing)}
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
  end 

  context 'airport capacity' do
    it 'airport default capacity equals 5' do
      expect(subject.capacity).to eq 5
    end
  end
  
end  
