# frozen_string_literal: true

# Methods that utilize class instance for functionality
module SharedClassMethods
  def keys
    Keys.new(@key).keys
  end

  def offsets
    Offsets.new(@date).offsets
  end

  def shifts
    Shifts.new(key: @key, date: @date).shifts
  end

  def encrypt_message(message, key, date)
    EncryptionAlgorithm.new(message: message, key: key, date: date).encrypt_message
  end

  def decrypt_message(message, key, date)
    DecryptionAlgorithm.new(message: message, key: key, date: date).decrypt_message
  end

  def crack_message(message, date)
    CrackAlgorithm.new(message: message, date: date).crack_message[0]
  end

  def crack_key(message, date)
    CrackAlgorithm.new(message: message, date: date).crack_message[1]
  end
end
