require 'rspec'
require 'encryption_algorithm'

describe EncryptionAlgorithm do
  describe '#initialize' do
    it 'exists' do
      ea = EncryptionAlgorithm.new({message: 'hello world', key: '02715', date: '040895'})

      expect(ea).to be_a EncryptionAlgorithm
    end

    it 'has a character set' do
      ea = EncryptionAlgorithm.new({message: 'hello world', key: '02715', date: '040895'})

      expected = [
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
        's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '
      ]

      expect(ea.character_set).to be_a Array
      expect(ea.character_set).to eq expected
      expect(ea.character_set.length).to eq 27
    end

    it 'has attributes' do
      ea = EncryptionAlgorithm.new({message: 'hello world', key: '02715', date: '040895'})
      ea2 = EncryptionAlgorithm.new({message: 'my name is nigel', key: '91034', date: '131122'})

      expect(ea.message).to eq 'hello world'
      expect(ea.key).to eq '02715'
      expect(ea.date).to eq '040895'
      expect(ea2.message).to eq'my name is nigel'
      expect(ea2.key).to eq '91034'
      expect(ea2.date).to eq '131122'
    end
  end

  describe '#encrypt_message' do
    it 'uses the key and date to encrypt the message' do
      ea = EncryptionAlgorithm.new({message: 'Hello World!', key: '02715', date: '040895'})

      expect(ea.encrypt_message).to eq 'keder ohulw!'
    end
  end

  describe '#shifts' do
    it 'returns a hash of shifts based on key and date' do
      ea = EncryptionAlgorithm.new({message: 'Hello World!', key: '02715', date: '040895'})

      expected = {
        'A key' => 2,
        'B key' => 27,
        'C key' => 71,
        'D key' => 15
      }

      expect(ea.shifts).to eq expected
    end
  end
end