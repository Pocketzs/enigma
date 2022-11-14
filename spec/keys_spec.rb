require 'rspec'
require './lib/keys'

describe Keys do
  describe '#initialize' do
    it 'exists and has attributes' do
      keys = Keys.new('02715')

      expect(keys).to be_a Keys
      expect(keys.digit_number.length).to eq 5
    end
  end
  
  describe '#keys' do
    it 'splits the digit number into keys' do
      keys = Keys.new('02715')
      expected = 
      {
        'A key' => 02,
        'B key' => 27,
        'C key' => 71,
        'D key' => 15
      }

      expect(keys.keys.length).to eq 4
      expect(keys.keys.values.all?(Integer)).to be true
      expect(keys.keys).to eq expected
    end

    it 'can split a different digit number into keys' do
      keys = Keys.new('91034')
      expected = 
      {
        'A key' => 91,
        'B key' => 10,
        'C key' => 3,
        'D key' => 34
      }

      expect(keys.keys.length).to eq 4
      expect(keys.keys.values.all?(Integer)).to be true
      expect(keys.keys).to eq expected
    end
  end

  describe '#lettered_keys' do
    it 'returns an array of lettered keys' do
      keys1 = Keys.new('02715')
      keys2 = Keys.new('29301')

      expect(keys1.lettered_keys).to eq ['A key', 'B key', 'C key', 'D key']
      expect(keys2.lettered_keys).to eq ['A key', 'B key', 'C key', 'D key']
    end
  end
end
