require 'date'
require './lib/key_generator'
require './lib/date_generator'
require './lib/shift_generator'
require './lib/encrypt_decryptable'

class Enigma
  include KeyGenerator
  include DateGenerator
  include ShiftGenerator
  include EncryptDecryptable

  def encrypt(message, key = create_key, date = create_date)
    offset(date)
    final_shifts = final_shifts(key, date)
    encrypted_message = encrypt_decryptable(message, final_shifts, "encrypt")
    {:encryption => encrypted_message.join, :key => key, :date => date}
  end

  def decrypt(message, key = create_key, date = create_date)
    offset(date)
    final_shifts = final_shifts(key, date)
    decrypted_message = encrypt_decryptable(message, final_shifts, "decrypt")
    {:decryption => decrypted_message.join, :key => key, :date => date}
  end
end
