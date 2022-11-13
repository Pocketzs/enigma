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

  def encrypt_message
    chars = @message.downcase.chars
    message_index = chars.map do |char| 
      next char unless character_set.index(char)
      character_set.index(char)
    end
    shift_cycle = shifts.values.cycle
    encrypted_message = message_index.map do |int|
      next int unless int.class == Integer
      int = @character_set[(shift_cycle.next+int) % 27]
    end.join
  end

  def shifts
    Shifts.new(key: @key, date: @date).shifts
  end
end