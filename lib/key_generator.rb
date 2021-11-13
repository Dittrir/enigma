module KeyGenerator
  def create_key
    keys = [*(0..99999)]
    assigned_key = keys.sample.to_s.rjust(5, "0")
  end
end
