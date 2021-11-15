require 'spec_helper'

RSpec.describe KeyGeneratorable do
  before (:each) do
    @enigma = Enigma.new
  end

  it 'creates a key' do
    expect(@enigma.create_key).to be_instance_of(String)
  end

  it 'creates a key' do
    expect(@enigma.create_key.length).to eq(5)
  end
end
