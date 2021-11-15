module KeyGeneratorable
  def create_key
    assigned_key = rand(99999).to_s.rjust(5, "0")
  end
end
