require 'airport'

describe Airport do

  let(:boeing) {Plane.new}

  context '#land' do
    xit 'plane in as argument lands at airport' do
      expect(subject.land("plane")).to eq "plane"
    end

    xit 'returns plane object in #land at airport' do
      expect(subject.land(boeing)).to be_an_instance_of(Plane)
    end

    it 'plane stored in hangar' do
      subject.store(boeing)
      expect(subject.hangar).to include(boeing)
    end

    it 'stores plane in hangar' do
      subject.land(boeing)
      expect(subject.hangar).to include(boeing)
    end
  end

  context '#take off' do
    xit 'plane can #take off from airport' do
      expect(subject.take_off(boeing)).to eq boeing
    end

    it 'plane removed from hanger on take off' do
      subject.land(boeing)
      subject.take_off(boeing)
      expect(subject.hangar).to_not include(boeing)
    end
  end 


  
end