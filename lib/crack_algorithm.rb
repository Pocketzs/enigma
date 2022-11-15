require './lib/decryption_algorithm'
require './lib/shared_class_methods'
require './lib/generator'

class CrackAlgorithm
  include Generator
  include SharedClassMethods

  attr_reader :message,
              :date,
              :key,
              :counter,
              :upper_bound,
              :final_key_array

  def initialize(attributes)
    @message          = attributes[:message]
    @date             = attributes[:date]
    @key              = '00000'
    @counter          = 0
    @upper_bound      = 99999
    @final_key_array  = []
  end

  # def crack_message
  #   until decrypt_message(@message, @key, @date)[-4..-1] == " end"
  #     @key = format('%05d', @key.to_i + 1)
  #   end
  #   @final_key = @key
  #   decrypt_message(@message, @key, @date)
  # end

  # def crack_message
  #   until decrypt_message(@message, @key, @date)[-4..-1] == " end"
  #     @key = rand_key
  #   end
  #   @final_key = @key
  #   decrypt_message(@message, @key, @date)
  # end

  def crack_message
    until end_check?
      alternating_series
    end
    [decrypt_message(@message, @key, @date), @key]
  end

  def alternating_series
    plus_minus_switch
    incrementer
  end

  def plus_minus_switch
    @key = format('%05d', @key.to_i + @upper_bound) if @counter.even?
    @key = format('%05d', @key.to_i - @upper_bound) if @counter.odd?
  end

  def incrementer
    @upper_bound -= 1
    @counter += 1
  end

  def end_check?
    decrypt_last_four == " end"
  end

  def decrypt_last_four
    decrypt_message(@message, @key, @date)[-4..-1]
  end
end