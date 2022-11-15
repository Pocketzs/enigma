# frozen_string_literal: true

require './lib/cypher_utilities'

class Offsets
  include CypherUtilities

  attr_reader :date

  def initialize(date)
    @date = date
  end

  def date_cypher
    (date.to_i ** 2).to_s[-4..-1]
  end

  def offsets
    lettered_hash_keys.each_with_object({}).with_index do |(offset, hash), indx|
      hash[offset] = date_cypher[indx].to_i
    end
  end
end
