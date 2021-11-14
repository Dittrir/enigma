require 'spec_helper'

module ShiftGeneratorable
  def self.offset(date)
    date_squared = date.to_i ** 2
    last_four = (date_squared.to_s).chars.last(4).join
    last_four
  end
  def self.a_shift(key, date)
    key.slice(0..1).to_i + offset(date).slice(0).to_i
  end

  def self.b_shift(key, date)
    key.slice(1..2).to_i + offset(date).slice(1).to_i
  end

  def self.c_shift(key, date)
    key.slice(2..3).to_i + offset(date).slice(2).to_i
  end

  def self.d_shift(key, date)
    key.slice(3..4).to_i + offset(date).slice(3).to_i
  end

  def self.final_shifts(key, date)
    final_shifts = [a_shift(key, date), b_shift(key, date), c_shift(key, date), d_shift(key, date)]
  end
end

RSpec.describe ShiftGeneratorable do
  it 'creates an offset using the date' do
    expect(ShiftGeneratorable.offset("040895")).to eq("1025")
  end

  it 'creates shifts' do
    expect(ShiftGeneratorable.a_shift("02715", "040895")).to eq(3)
    expect(ShiftGeneratorable.b_shift("02715", "040895")).to eq(27)
    expect(ShiftGeneratorable.c_shift("02715", "040895")).to eq(73)
    expect(ShiftGeneratorable.d_shift("02715", "040895")).to eq(20)
  end

  it 'makes a final shift array' do
    expect(ShiftGeneratorable.final_shifts("02715", "040895")).to eq([3, 27, 73, 20])
  end
end
