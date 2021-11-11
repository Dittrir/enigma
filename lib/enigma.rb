require './encrypt'
require './decrypt'

class Enigma
  include Encrypt
  include Decrypt
  attr_reader :encryption, :key, :date
  def initialize
    @encryption = encryption
    @key = key
    @date = date
  end

  def encrypt(encryption, key, date)
  end
end
