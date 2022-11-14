require './lib/encryption_algorithm'
require './lib/decryption_algorithm'
require './lib/generator'
class Enigma
  include Generator

  def encrypt(message, key = rand_key, date = today)
    {
      encryption: encrypt_message(message, key, date),
      key:        key,
      date:       date
    }
  end

  def encrypt_message(message, key, date)
    EncryptionAlgorithm.new(message: message, key: key, date: date).encrypt_message
  end

  def decrypt(message, key, date = today)
    {
      decryption: decrypt_message(message, key, date),
      key:        key,
      date:       date
    }
  end

  def decrypt_message(message, key, date)
    DecryptionAlgorithm.new(message: message, key: key, date: date).decrypt_message
  end
end
