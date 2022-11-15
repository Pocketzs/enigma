require './lib/algorithm'

class EncryptionAlgorithm < Algorithm
  def initialize(attributes)
    super
  end

  def encrypt_message
    sc = shift_cycle
    message_index.map do |int|
      next int unless int.class == Integer
      @character_set[(sc.next + int) % 27]
    end.join
  end
end
