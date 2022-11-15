# frozen_string_literal: true

# Methods for generating dynamic values
module Generator
  def today
    Time.now.strftime('%d%m%y')
  end

  def rand_key
    sprintf('%05d', rand(99_999))
  end
end
