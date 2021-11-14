module ShiftGenerator
  def offset(date)
    date_squared = date.to_i ** 2
    last_four = (date_squared.to_s).chars.last(4).join
    last_four
  end

  def a_shift(date)
    date = date
    key.slice(0..1).to_i + offset(date.to_i).slice(0).to_i
  end

  def b_shift(date)
    date = date
    key.slice(1..2).to_i + offset(date.to_i).slice(1).to_i
  end

  def c_shift(date)
    date = date
    key.slice(2..3).to_i + offset(date.to_i).slice(2).to_i
  end

  def d_shift(date)
    date = date
    key.slice(3..4).to_i + offset(date.to_i).slice(3).to_i
  end
end
