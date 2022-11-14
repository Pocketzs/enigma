require 'rspec'
require 'decryption_algorithm'

describe DecryptionAlgorithm do
  describe '#initialize' do
    it 'exists' do
      da = DecryptionAlgorithm.new({message: 'keder ohulw', key: '02715', date: '040895'})

      expect(da).to be_a DecryptionAlgorithm
    end

    it 'has a character set' do
      da = DecryptionAlgorithm.new({message: 'keder ohulw', key: '02715', date: '040895'})

      expected = [
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
        's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '
      ]

      expect(da.character_set).to be_a Array
      expect(da.character_set).to eq expected
      expect(da.character_set.length).to eq 27
    end

    it 'has attributes' do
      da = DecryptionAlgorithm.new({message: 'keder ohulw', key: '02715', date: '040895'})
      da2 = DecryptionAlgorithm.new({message: 'pysgdmxtlssglgxe', key: '91034', date: '131122'})

      expect(da.message).to eq 'keder ohulw'
      expect(da.key).to eq '02715'
      expect(da.date).to eq '040895'
      expect(da2.message).to eq'pysgdmxtlssglgxe'
      expect(da2.key).to eq '91034'
      expect(da2.date).to eq '131122'
    end
  end

  describe '#decrypt_message' do
    it 'uses the key and date to encrypt the message' do
      da = DecryptionAlgorithm.new({message: 'keder ohulw!', key: '02715', date: '040895'})
      da2 = DecryptionAlgorithm.new({message: 'pysgdmxtlssglgxe', key: '02715', date: '040895'})
      
      expect(da.decrypt_message).to eq 'hello world!'
      expect(da2.decrypt_message).to eq 'my name is nigel'
    end
  end

  describe 'decrypt_message helper methods' do
    describe '#message_chars' do
      it 'returns an array of the messages characters downcased' do
        da = DecryptionAlgorithm.new({message: 'keder ohulw!', key: '02715', date: '040895'})

        expect(da.message_chars).to eq ['k', 'e', 'd', 'e', 'r', ' ', 'o', 'h', 'u', 'l', 'w', '!']
      end
    end

    describe '#message_index' do
      it 'returns an array of the message characters index based on character set' do
        da = DecryptionAlgorithm.new({message: 'keder ohulw!', key: '02715', date: '040895'})

        expect(da.message_index).to eq [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22, "!"]
      end
    end

    describe '#shift_cycle' do
      it 'loops the shift in a cycle' do
        da = DecryptionAlgorithm.new({message: 'keder ohulw!', key: '02715', date: '040895'})
        expected = [3, 27, 73, 20, 3, 27]
        result = da.shift_cycle.first(6)

        expect(da.shift_cycle).to be_a Enumerator
        expect(result).to eq expected
      end
    end
  end

  describe '#shifts' do
    it 'returns a hash of shifts based on key and date' do
      da = DecryptionAlgorithm.new({message: 'keder ohulw!', key: '02715', date: '040895'})
      da2 = DecryptionAlgorithm.new({message: 'keder ohulw!', key: '91034', date: '131122'})
      
      expected = {
        'A shift' => 3,
        'B shift' => 27,
        'C shift' => 73,
        'D shift' => 20
      }
      expected2 = {
        'A shift' => 99,
        'B shift' => 18,
        'C shift' => 11,
        'D shift' => 38
      }

      expect(da.shifts).to eq expected
      expect(da2.shifts).to eq expected2
    end
  end
end