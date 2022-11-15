require './lib/algorithm'

class DecryptionAlgorithm < Algorithm
  def initialize(attributes)
    super
  end

  def decrypt_message
    sc = shift_cycle
    message_index.map do |int|
      next int unless int.class == Integer
      @character_set[(int - sc.next) % 27]
    end.join
  end
end
