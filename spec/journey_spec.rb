require 'journey'


describe Journey do
  subject(:journey) {described_class.new}

  describe 'attributes' do
    it 'Creates an emty variable entry_station' do
      expect(subject.entry_station).to be_empty?
    end

    it 'Crates an empty variable exit_station' do
      expect(subject.exit_station).to be_empty?
   end
  end
end
