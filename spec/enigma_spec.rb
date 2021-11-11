require 'date'
require './lib/enigma'
require './spec_helper'
require 'simplecov'

RSpec.describe Enigma do
  before (:each) do
    @enigma = Enigma.new("hello world", "02715", "040895")
  end

  it 'exists' do
    expect(@enigma).to be_instance_of(Enigma)
  end

  it 'has attributes' do
    @enigma.encrypt("hello world", "02715", "040895")

    expect(@enigma.encrypt.encryption).to eq("hello world")
    expect(@enigma.encrypt.key).to eq("02715")
    expect(@enigma.encrypt.date).to eq("040895")
  end
end
