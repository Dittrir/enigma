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

  it 'can encript a message with symbols' do
    expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

    expect(@enigma.encrypt("hello world!", "02715", "040895")).to eq(expected)
  end

  it 'encrypt a message with a key and uses todays date' do
    #Rather than changing the tests manually daily, I can make variables dynamic
    todays_date = Date.today.strftime("%m%d%y")
    encrypted_result = @enigma.encrypt("hello world", "02715")
    encryption = encrypted_result[:encryption]

    expected = {
      encryption: encryption,
      key: "02715",
      date: todays_date
    }

    expect(@enigma.encrypt("hello world", "02715")).to eq(expected)

  end

  it 'decrypt a message with a key and uses todays date' do
    #In order to know what the encryption is, i need to re-run the encrypt method
    todays_date = Date.today.strftime("%m%d%y")
    encrypted_result = @enigma.encrypt("hello world", "02715")
    encryption = encrypted_result[:encryption]
    decrypted_result = @enigma.decrypt(encryption, "02715")
    decryption = decrypted_result[:decryption]

    expected = {
      decryption: decryption,
      key: "02715",
      date: todays_date
    }

    expect(@enigma.decrypt(encryption, "02715")).to eq(expected)
  end
end
