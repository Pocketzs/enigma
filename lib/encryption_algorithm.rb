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
end