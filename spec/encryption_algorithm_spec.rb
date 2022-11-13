require 'rspec'
require 'encryption_algorithm'

describe EncryptionAlgorithm do
  describe '#initialize' do
    it 'exists' do
      ea = EncryptionAlgorithm.new

      expect(ea).to be_a EncryptionAlgorithm
    end

    it 'has a character set' do
      ea = EncryptionAlgorithm.new

      expected = [
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
        's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '
      ]

      expect(ea.character_set).to be_a Array
      expect(ea.character_set).to eq expected
      expect(ea.character_set.length).to eq 27
    end
  end
end