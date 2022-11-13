require './lib/shifts'

class EncryptionAlgorithm
  attr_reader :message,
              :key,
              :date,
              :character_set
  
  def initialize(attributes)
    @message        = attributes[:message]
    @key            = attributes[:key]
    @date           = attributes[:date]
    @character_set  = ('a'..'z').to_a << ' '
  end

  # def encrypt_message
  #   chars = @message.downcase.chars
  #   message_index = chars.map do |char| 
  #     next char unless character_set.index(char)
  #     character_set.index(char)
  #   end
  #   encrypted_index = message_index.map do |int|

  #   require 'pry'; binding.pry
  # end

  def shifts
    Shifts.new(key: @key, date: @date).shifts
  end
end