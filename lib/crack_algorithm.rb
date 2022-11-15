class CrackAlgorithm
  attr_reader :message,
              :date

  def initialize(attributes)
    @message  = attributes[:message]
    @date     = attributes[:date]
  end
end