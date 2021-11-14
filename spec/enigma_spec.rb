require './spec/spec_helper'
require './lib/enigma'
require 'simplecov'

RSpec.describe Enigma do
  before (:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of(Enigma)
  end

  it 'can encript a message' do
    expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message' do
    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  xit 'encrypt a message with a key and uses todays date' do
    # expected = {
    #   decryption: "hello world",
    #   key: "02715",
    #   date: "040895"
    # }
    expect(@enigma.encrypt("hello world", "02715")).to eq()
  end

  xit 'decrypt a message with a key and uses todays date' do
    # expected = {
    #   decryption: "this encryption works!",
    #   key: #02715",
    #   date: #040895"
    # }
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
  end
end
