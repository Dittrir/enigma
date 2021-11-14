require 'spec_helper'

module DateGenerator
  def self.create_date
    date = Date.today.strftime("%m%d%y")
  end
end

RSpec.describe DateGenerator do
  it 'uses todays date' do
    expect(DateGenerator.create_date).to eq(Date.today.strftime("%m%d%y"))
  end
end
