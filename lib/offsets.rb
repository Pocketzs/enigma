class Offsets
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def date_cypher
    (date.to_i ** 2).to_s[-4..-1]
  end
end