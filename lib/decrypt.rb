require './enigma'

class Decrypt < Enigma
  attr_reader :encryption, :key, :date
  def initialize(encryption, key, date)
    @encryption = encryption
    @key = key
    @date = date
  end
end
