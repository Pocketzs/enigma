class Shifts
  attr_reader :key, :date

  def initialize(attributes)
    @key = attributes[:key]
    @date = attributes[:date]
  end
end