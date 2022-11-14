require './lib/keys'
require './lib/offsets'
require './lib/shared_class_methods'

class Shifts
  include SharedClassMethods

  attr_reader :key, 
              :date

  def initialize(attributes)
    @key   = attributes[:key]
    @date  = attributes[:date]
  end

  def shifts
    lettered_shifts.each_with_object({}).with_index do |(shift, hash), indx|
      hash[shift] = keys.values[indx] + offsets.values[indx]
    end
  end

  def lettered_shifts
    [*0..3].map do |int|
      "#{(65 + int).chr} shift"
    end
  end
end
