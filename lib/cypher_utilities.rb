module CypherUtilities
  def lettered_hash_keys
    [*0..3].map do |int|
      "#{(65 + int).chr} #{self}"
    end
  end
end