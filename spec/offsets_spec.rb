require 'rspec'
require './lib/offsets'

describe Offsets do
  describe '#initialize' do
    it 'exists and has attributes' do
      offsets = Offsets.new('040895')

      expect(offsets).to be_a Offsets
      expect(offsets.date).to eq '040895'
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
    end
  end
end