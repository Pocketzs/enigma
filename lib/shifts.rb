require './lib/keys'
require './lib/offsets'
require './lib/shared_class_methods'
require './lib/cypher_utilities'

class Shifts
  include SharedClassMethods
  include CypherUtilities

  attr_reader :key, 
              :date

  def initialize(attributes)
    @key   = attributes[:key]
    @date  = attributes[:date]
  end

  def shifts
    lettered_hash_keys.each_with_object({}).with_index do |(shift, hash), indx|
      hash[shift] = keys.values[indx] + offsets.values[indx]
    end
  end
end
