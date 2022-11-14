require './lib/shifts'

class DecryptionAlgorithm
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

  def decrypt_message
    sc = shift_cycle
    message_index.map do |int|
      next int unless int.class == Integer
      @character_set[(int - sc.next) % 27]
    end.join
  end

  def message_chars
    @message.downcase.chars
  end

  def message_index
    message_chars.map do |char| 
      next char unless character_set.index(char)
      character_set.index(char)
    end
  end

  def shift_cycle
    shifts.values.cycle
  end

  def shifts
    Shifts.new(key: @key, date: @date).shifts
  end
end
