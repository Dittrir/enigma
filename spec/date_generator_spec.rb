require 'spec_helper'

module DateGeneratorable
  def self.create_date
    date = Date.today.strftime("%m%d%y")
  end
end

RSpec.describe DateGeneratorable do
  it 'uses todays date' do
    expect(DateGeneratorable.create_date).to eq(Date.today.strftime("%m%d%y"))
  end
end
