module CypherUtilities
  def lettered_hash_keys
    [*0..3].map do |int|
      "#{(65 + int).chr} #{self.class.to_s.downcase.chop}"
    end
  end
end