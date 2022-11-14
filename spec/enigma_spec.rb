require 'rspec'
require './lib/enigma'

describe Enigma do
  describe '#initialize' do
    it 'exists' do
      enigma = Enigma.new
  
      expect(enigma).to be_a Enigma
    end
  end

  describe '#encrypt' do
    it 'returns a hash with an encrypted message key and date' do
      enigma = Enigma.new

      expected1 = {
        encryption: 'keder ohulw',
        key:        '02715',
        date:       '040895'
      }
      expected2 = {
        encryption: 'pysgdmxtlssglgxe',
        key:        '02715',
        date:       '040895'
      }

      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected1)
      expect(enigma.encrypt('my name is nigel', '02715', '040895')).to eq(expected2)
    end
  end

  describe '#encrypt_message' do
    it 'uses the key and date to encrypt the message' do
      enigma = Enigma.new

      expect(enigma.encrypt_message('Hello World!', '02715', '040895')).to eq 'keder ohulw!' 
    end
  end

  describe '#decrypt' do
    it 'returns a hash with the encrypted message decrypted' do
      enigma = Enigma.new

      expected1 = {
        encryption: 'hello world',
        key:        '02715',
        date:       '040895'
      }
      expected2 = {
        encryption: 'my name is nigel',
        key:        '02715',
        date:       '040895'
      }

      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected1)
      expect(enigma.decrypt('pysgdmxtlssglgxe', '02715', '040895')).to eq(expected2)
    end
  end

  describe '#decrypt_message' do
    it 'uses the key and date to decrypt the message' do
      enigma = Enigma.new

      expect(enigma.decrypt('keder ohulw!', '02715', '040895')).to eq 'hello world!'
    end
  end
end