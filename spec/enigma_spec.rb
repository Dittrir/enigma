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

  it 'encrypt a message with a key and uses todays date' do

    todays_date = Date.today.strftime("%m%d%y")

    expected = {
      decryption: " cjpgyusjjb", #<<<<<<<< needs to be changed daily
      key: "02715",
      date: todays_date
    }

    expect(@enigma.decrypt("keder ohulw", "02715")).to eq(expected)

  end

  xit 'decrypt a message with a key and uses todays date' do #key cracker

    # expected = {
    #   decryption: "this encryption works!",
    #   key: #02715",
    #   date: #040895"
    # }

    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
  end
end
