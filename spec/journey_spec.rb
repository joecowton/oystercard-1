require 'journey'


describe Journey do
  subject(:journey) {described_class.new(:entry_station, :exit_station)}
end
#   describe 'attributes' do
#     it 'sets instance variable to entry station' do
#       expect(subject.entry_station).to eq(:entry_station)
#     end
#
#     it 'sets instance variable exit station' do
#       expect(subject.exit_station).to eq(:exit_station)
#    end
#   end
# end
