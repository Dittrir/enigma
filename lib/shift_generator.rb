module ShiftGenerator
  def offset(date)
    date_squared = date.to_i ** 2
    last_four = (date_squared.to_s).chars.last(4).join
    last_four
  end

  def a_shift(key, date)
    key.slice(0..1).to_i + offset(date).slice(0).to_i
  end

  def b_shift(key, date)
    key.slice(1..2).to_i + offset(date).slice(1).to_i
  end

  def c_shift(key, date)
    key.slice(2..3).to_i + offset(date).slice(2).to_i
  end

  def d_shift(key, date)
    key.slice(3..4).to_i + offset(date).slice(3).to_i
  end

  def final_shifts(key, date)
    final_shifts = [a_shift(key, date), b_shift(key, date), c_shift(key, date), d_shift(key, date)]
  end
end
