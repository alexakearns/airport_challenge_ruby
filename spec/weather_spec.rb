require 'weather'

describe Weather do
  let(:stormy_weather) { allow(subject).to receive(:stormy?).and_return true }

  it 'stormy weather returns true' do
    stormy_weather
    expect(subject.stormy?).to be true
  end
end
