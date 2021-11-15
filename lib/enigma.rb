require 'date'
require './lib/key_generatorable'
require './lib/date_generatorable'
require './lib/shift_generatorable'
require './lib/encrypt_decryptable'

class Enigma
  include KeyGeneratorable
  include DateGeneratorable
  include ShiftGeneratorable
  include EncryptDecryptable

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @key = create_key
    @date = create_date
  end

  def encrypt(message, key = @key, date = @date)
    offset(date)
    final_shifts = final_shifts(key, date)
    encrypted_message = encrypt_decryptable(message, final_shifts, "encrypt")
    {:encryption => encrypted_message, :key => key, :date => date}
  end

  def decrypt(message, key = @key, date = @date)
    offset(date)
    final_shifts = final_shifts(key, date)
    decrypted_message = encrypt_decryptable(message, final_shifts, "decrypt")
    {:decryption => decrypted_message, :key => key, :date => date}
  end
end
