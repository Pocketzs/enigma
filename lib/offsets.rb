class Offsets
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def date_cypher
    (date.to_i ** 2).to_s[-4..-1]
  end

  def offsets
    lettered_offsets.each_with_object({}).with_index do |(offset,hash), indx|
      hash[offset] = date_cypher[indx].to_i
    end
  end

  def lettered_offsets
    [*0..3].map do |int|
      "#{(65 + int).chr} offset"
    end
  end
end
