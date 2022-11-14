class Keys
  attr_reader :digit_number

  def initialize(digit_number)
    @digit_number = digit_number
  end

  def keys
    lettered_keys.each_with_object({}).with_index do |(key, hash), indx|
      hash[key] = digit_number[indx..(indx + 1)].to_i
    end
  end

  def lettered_keys
    [*0..3].map do |int|
      "#{(65+int).chr} key"
    end
  end
end
