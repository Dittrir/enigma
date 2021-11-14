require 'spec_helper'

module ShiftGenerator
  def self.offset(date)
    date_squared = date.to_i ** 2
    last_four = (date_squared.to_s).chars.last(4).join
    last_four
  end

RSpec.describe ShiftGenerator do
  it 'creates an offset using the date' do
    expect(ShiftGenerator.offset("040895")).to eq("1025")
    end
  end
end
