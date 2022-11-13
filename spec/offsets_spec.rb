require 'rspec'
require './lib/offsets'

describe Offsets do
  describe '#initialize' do
    it 'exists and has attributes' do
      offsets = Offsets.new('040895')

      expect(offsets).to be_a Offsets
      expect(offsets.date).to eq '040895'
      expect(offsets.date.length).to eq 6
    end
  end

  describe '#date_cypher' do
    it 'sqaures the date and returns the last four digits' do
      offsets1 = Offsets.new('040895')
      time_now = Time.new(2022, 11, 13)
      allow(Time).to receive(:now).and_return(time_now)
      offsets2 = Offsets.new(Time.now.strftime('%d%m%y'))

      expect(offsets1.date_cypher).to eq '1025'
      expect(offsets2.date_cypher).to eq '8884'
      expect(offsets2.date_cypher.length).to eq 4
    end
  end

  describe '#offsets' do
    it 'splits the date cypher into 4 offsets' do
      offsets = Offsets.new('040895')

      expected = {
        'A offset' => 1,
        'B offset' => 0,
        'C offset' => 2,
        'D offset' => 5
      }

      expect(offsets.offsets).to eq expected
    end
  end

  describe '#lettered_offsets' do
    it 'returns an array of lettered offsets equal to the length of the date cypher' do
      offsets = Offsets.new('040895')

      expect(offsets.date_cypher.length).to eq 4
      expect(offsets.lettered_offsets).to eq ['A offset', 'B offset', 'C offset', 'D offset']
    end
  end
end