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
    @message  = attributes[:message]
    @date     = attributes[:date]
  end
end