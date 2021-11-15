require 'spec_helper'

RSpec.describe DateGeneratorable do
  before (:each) do
    @enigma = Enigma.new
  end

  it 'uses todays date' do
    expect(@enigma.create_date).to eq(Date.today.strftime("%m%d%y"))
  end
end
