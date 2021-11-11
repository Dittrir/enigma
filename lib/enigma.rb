require 'date'
require './encrypt'
require './decrypt'

class Enigma
  attr_reader :message, :key, :date
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def encrypt(message, key, date)
  end

  def decrypt(cipher_txt, key, date)
  end
end
