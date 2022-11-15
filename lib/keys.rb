# frozen_string_literal: true

require './lib/cypher_utilities'

class Keys
  include CypherUtilities

  attr_reader :digit_number

  def initialize(digit_number)
    @digit_number = digit_number
  end

  def keys
    lettered_hash_keys.each_with_object({}).with_index do |(key, hash), indx|
      hash[key] = digit_number[indx..(indx + 1)].to_i
    end
  end
end
