require './encrypt'
require './decrypt'

class Enigma
  include Encrypt
  include Decrypt
  attr_reader :encryption, :key, :date
  def initialize(encryption, key, name)
    @encryption = encryption
    @key = key
    @name = name
  end
end
