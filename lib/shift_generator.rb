module ShiftGenerator
  def offset(date)
    date_squared = date.to_i ** 2
    last_four = (date_squared.to_s).chars.last(4).join
    last_four
  end
end
