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
    lettered_offsets = []
    date_cypher.chars.each_with_index do |char, indx|
      lettered_offsets << "#{(65+indx).chr} offset"
    end
    lettered_offsets
  end
end