require 'station'

describe Station do
  let(:station) {described_class.new("station", 1)}

  it 'Creates name when initizializing a new instance' do
    expect(station.name).to eq("station")
  end

  it 'Creates a zone when initizializing a new instance' do
    expect(station.zone).to eq(1)
  end
end
