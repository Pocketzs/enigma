require './lib/encryption_algorithm'
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
end