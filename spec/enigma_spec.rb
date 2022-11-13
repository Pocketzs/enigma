require 'rspec'
require './lib/enigma'

describe Enigma do
  describe '#initialize' do
    it 'exists' do
      enigma = Enigma.new
  
      expect(enigma).to be_a Enigma
    end
  end

  describe 'encrypt' do
    it 'returns a hash with a message key and date' do
      enigma = Enigma.new

      expected = {
        encryption: 'keder ohulw',
        key:        '02715',
        date:       '040895'
      }

      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
    end
  end
end