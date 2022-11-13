require './lib/keys'
require './lib/offsets'

class Shifts
  attr_reader :key, 
              :date

  def initialize(attributes)
    @key = attributes[:key]
    @date = attributes[:date]
  end

  def lettered_shifts
    [*0..3].map do |int|
      "#{(65+int).chr} shift"
    end
  end

  def keys
    Keys.new(@key).keys
  end

  def offsets
    Offsets.new(@date).offsets
  end
end