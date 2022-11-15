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

      expected1 =
        {
          encryption: 'keder ohulw',
          key:        '02715',
          date:       '040895'
        }
      expected2 =
        {
          encryption: 'pysgdmxtlssglgxe',
          key:        '02715',
          date:       '040895'
        }

      expect(enigma.encrypt('hello world', '02715', '040895')).to eq expected1
      expect(enigma.encrypt('my name is nigel', '02715', '040895')).to eq expected2
    end

    it "can encrypt a message with only a key (uses today's date)" do
      enigma = Enigma.new

      allow(Time).to receive(:now).and_return(Time.new(1995, 8, 4))

      expected =
        {
          encryption: 'keder ohulw',
          key:        '02715',
          date:       '040895'
        }

      expect(enigma.encrypt('hello world', '02715')).to eq expected
    end

    it "can encrypt a message with a random key and today's date" do
      enigma = Enigma.new

      allow(Time).to receive(:now).and_return(Time.new(1995, 8, 4))
      allow(enigma).to receive(:rand).and_return(2715)

      expected =
        {
          encryption: 'keder ohulw',
          key:        '02715',
          date:       '040895'
        }

      expect(enigma.encrypt('hello world')).to eq expected
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

      expected1 =
        {
          decryption: 'hello world',
          key:        '02715',
          date:       '040895'
        }
      expected2 =
        {
          decryption: 'my name is nigel',
          key:        '02715',
          date:       '040895'
        }

      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq expected1
      expect(enigma.decrypt('pysgdmxtlssglgxe', '02715', '040895')).to eq expected2
    end

    it "can decrypt a message with only a key (uses today's date" do
      enigma = Enigma.new

      allow(Time).to receive(:now).and_return(Time.new(1995, 8, 4))

      encrypted = enigma.encrypt("hello world", "02715")
      
      expected =
        {
          decryption: 'hello world',
          key:        '02715',
          date:       '040895'
        }

      expect(enigma.decrypt(encrypted[:encryption], '02715')).to eq expected
    end
  end

  describe '#decrypt_message' do
    it 'uses the key and date to decrypt the message' do
      enigma = Enigma.new

      expect(enigma.decrypt_message('keder ohulw!', '02715', '040895')).to eq 'hello world!'
    end
  end

  describe '#today' do
    it "returns a formatted string of today's date" do
      enigma = Enigma.new
      todays_date = Time.now.strftime('%d%m%y')

      expect(enigma.today).to eq todays_date
    end
  end

  describe '#rand_key' do
    it 'returns a 0 padded string of random 5 digit number' do
      enigma = Enigma.new
      allow(enigma).to receive(:rand).and_return(2715)

      expect(enigma.rand_key).to eq '02715'
    end
  end

  describe '#crack' do
    it 'can crack an encryption with a date' do
      enigma = Enigma.new

      encrypted = enigma.encrypt("hello world end", "08304", "291018")
      expected1 =
        {
          encryption: "vjqtbeaweqihssi",
          key:        "08304",
          date:       "291018"
        }

      expect(encrypted).to eq expected1

      expected2 =
        {
          decryption: "hello world end",
          key:        "08304",
          date:       "291018"
        }

      expect(enigma.crack("vjqtbeaweqihssi", "291018")).to eq expected2
    end
  end
end
