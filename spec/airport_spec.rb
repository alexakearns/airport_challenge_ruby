require 'airport'

describe Airport do

  let(:boeing) {Plane.new}

  context '#land' do
    it 'stores plane in hangar' do
      subject.land(boeing)
      expect(subject.hangar).to include(boeing)
    end
  end

  context '#take off' do

    it 'plane removed from hanger on take off' do
      subject.land(boeing)
      subject.take_off(boeing)
      expect(subject.hangar).to_not include(boeing)
    end
  end 


  
end