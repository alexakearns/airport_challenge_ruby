require 'weather'

describe Weather do
  let(:stormy_weather) { allow(subject).to receive(:stormy?).and_return true }
  let(:good_weather) { allow(subject).to receive(:stormy?).and_return false }

  it 'stormy weather returns true' do
    stormy_weather
    expect(subject.stormy?).to be true
  end

  it 'good weather returns false' do
    good_weather
    expect(subject.stormy?).to be false
  end
end
