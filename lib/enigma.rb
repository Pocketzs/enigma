require './lib/encryption_algorithm'
require './lib/decryption_algorithm'
require './lib/generator'
require './lib/shared_class_methods'

class Enigma
  include Generator,
          SharedClassMethods

  def encrypt(message, key = rand_key, date = today)
    {
      encryption: encrypt_message(message, key, date),
      key:        key,
      date:       date
    }
  end

  def decrypt(message, key, date = today)
    {
      decryption: decrypt_message(message, key, date),
      key:        key,
      date:       date
    }
  end
end
