module DateGeneratorable
  def create_date
    date = Date.today.strftime("%m%d%y")
  end
end
