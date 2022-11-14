require './lib/encryption_algorithm'
require './lib/decryption_algorithm'
class Enigma
  def encrypt(message, key, date)
    {
      encryption: encrypt_message(message, key, date),
      key:        key,
      date:       date
    }
  end

  def encrypt_message(message, key, date)
    EncryptionAlgorithm.new(message: message, key: key, date: date).encrypt_message
  end

  def decrypt(message, key, date)
    {
      encryption: decrypt_message(message, key, date),
      key:        key,
      date:       date
    }
  end

  def decrypt_message(message, key, date)
    DecryptionAlgorithm.new(message: message, key: key, date: date).decrypt_message
  end
end