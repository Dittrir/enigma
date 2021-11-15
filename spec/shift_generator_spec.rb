require 'spec_helper'

RSpec.describe ShiftGeneratorable do
  before (:each) do
    @enigma = Enigma.new
  end

  it 'creates an offset using the date' do
    expect(@enigma.offset("040895")).to eq("1025")
  end

  it 'creates shifts' do
    expect(@enigma.a_shift("02715", "040895")).to eq(3)
    expect(@enigma.b_shift("02715", "040895")).to eq(27)
    expect(@enigma.c_shift("02715", "040895")).to eq(73)
    expect(@enigma.d_shift("02715", "040895")).to eq(20)
  end

  it 'makes a final shift array' do
    expect(@enigma.final_shifts("02715", "040895")).to eq([3, 27, 73, 20])
  end
end
