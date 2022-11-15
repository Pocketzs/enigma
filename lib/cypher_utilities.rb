# methods common to keys offsets and shifts classes
# frozen_string_literal: true
module CypherUtilities
  def lettered_hash_keys
    [*0..3].map do |int|
      "#{(65 + int).chr} #{format_class_name}"
    end
  end

  def class_name
    self.class.to_s
  end

  def format_class_name
    class_name.downcase.chop
  end
end
