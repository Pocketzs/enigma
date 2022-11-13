require 'rspec'
require './lib/keys'

describe Keys do
  describe '#initialize' do
    it 'exists and has attributes' do
      keys = Keys.new('02715')

      expect(keys).to be_a Keys
      expect(keys.five_digit_number.length).to eq 5
    end
  end
  
  describe '#keys' do
    it 'splits the five digit number into 4 keys' do
      keys = Keys.new('02715')
      expected = {
        'A key' => 02,
        'B key' => 27,
        'C key' => 71,
        'D key' => 15
      }
      
      expect(keys.keys.length).to eq 4
      expect(keys.keys.values.all?(Integer)).to be true
      expect(keys.keys).to eq expected
    end
  end
end