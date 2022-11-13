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
    lettered_keys = []
    @digit_number.chars.each_with_index do |char, indx|
      break if indx == @digit_number.length - 1
      lettered_keys << "#{(65+indx).chr} key"
    end
    lettered_keys
  end
end