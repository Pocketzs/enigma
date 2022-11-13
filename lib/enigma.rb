class Enigma
  def encrypt(message, key, date)
    {
      encryption: encrypt_message(message),
      key: key,
      date: date
    }
  end
end