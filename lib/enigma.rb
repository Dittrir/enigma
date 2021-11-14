require 'date'
require './lib/key_generator'
require './lib/date_generator'
require './lib/shift_generator'

class Enigma
  include KeyGenerator
  include DateGenerator
  include ShiftGenerator
  attr_reader :message,
              :key,
              :date,
              :alphabet
              :return_hash
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @message = "hello world"
    @key = key
    @date = date
    @message_array = [] #breaks every letter into its own string
  end

  def encrypt(message, key = create_key, date = create_date)

    offset(date) #this works, so why wouldnt the _shift work?
    final_shifts = final_shifts(key, date)

    encrypted_message = []
    @message_array = message.downcase.split(//)

    @message_array.each_with_index do |character, index|
      if index % 4 == 0
        encr_char_1 = @alphabet.index(character) + (final_shifts[0])
          encrypted_message << @alphabet.rotate(encr_char_1)[0]
      elsif index % 4 == 1
        encr_char_2 = @alphabet.index(character) + (final_shifts[1])
          encrypted_message << @alphabet.rotate(encr_char_2)[0]
      elsif index % 4 == 2
        encr_char_3 = @alphabet.index(character) + (final_shifts[2])
          encrypted_message << @alphabet.rotate(encr_char_3)[0]
      elsif index % 4 == 3
        encr_char_4 = @alphabet.index(character) + (final_shifts[3])
          encrypted_message << @alphabet.rotate(encr_char_4)[0]
      else
        puts "ERROR DURING ENCRYPTION: check your code and try again."
      end
    end

    encryption = {
      :encryption => encrypted_message.join,
      :key => key,
      :date => date
    }

    encryption
  end

  def decrypt(cypher_text, key = create_key, date = create_date)

    offset(date)
    final_shifts = final_shifts(key, date)

    decrypted_message = []
    cypher_text_array = cypher_text.downcase.split(//)

    cypher_text_array.each_with_index do |character, index|
      if index % 4 == 0
        decr_char_1 = @alphabet.index(character) - (final_shifts[0])
          decrypted_message << @alphabet.rotate(decr_char_1)[0]
      elsif index % 4 == 1
        decr_char_2 = @alphabet.index(character) - (final_shifts[1])
          decrypted_message << @alphabet.rotate(decr_char_2)[0]
      elsif index % 4 == 2
        decr_char_3 = @alphabet.index(character) - (final_shifts[2])
          decrypted_message << @alphabet.rotate(decr_char_3)[0]
      elsif index % 4 == 3
        decr_char_4 = @alphabet.index(character) - (final_shifts[3])
          decrypted_message << @alphabet.rotate(decr_char_4)[0]
      else
        puts "ERROR DURING DECRYPTION: check your code and try again."
      end
    end

    decryption = {
      :decryption => decrypted_message.join,
      :key => key,
      :date => date
    }

    decryption
  end
end
