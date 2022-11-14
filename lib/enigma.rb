require './lib/encryption_algorithm'
require './lib/decryption_algorithm'
class Enigma
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

  def today
    Time.now.strftime('%d%m%y')
  end

  def rand_key
    sprintf('%05d', rand(99999))
  end
end