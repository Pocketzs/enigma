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
      offsets = Offsets.new('040895')

      expect(offsets.date_cypher).to eq '1025'
    end
  end
end