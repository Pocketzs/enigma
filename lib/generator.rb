module Generator
  def today
    Time.now.strftime('%d%m%y')
  end

  def rand_key
    sprintf('%05d', rand(99999))
  end
end
