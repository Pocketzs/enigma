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
end