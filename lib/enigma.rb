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
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @message = "hello world"
    @key = key
    @date = date
    @message_array = [] #breaks every letter into its own string
    @return_hash = Hash.new(0)
  end

  def encrypt(message, key = create_key, date = create_date)

    offset(date)
    a_shift = key.slice(0..1).to_i + offset(date).slice(0).to_i
    b_shift = key.slice(1..2).to_i + offset(date).slice(1).to_i
    c_shift = key.slice(2..3).to_i + offset(date).slice(2).to_i
    d_shift = key.slice(3..4).to_i + offset(date).slice(3).to_i

    final_shifts = [a_shift, b_shift, c_shift, d_shift]

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
      end
    end

    @return_hash[:encryption] = encrypted_message.join
    @return_hash[:key] = key
    @return_hash[:date] = date

    @return_hash
  end

  def decrypt(cypher_text, key = create_key, date = create_date)
    offset(date)
    a_shift = key.slice(0..1).to_i + offset(date).slice(0).to_i
    b_shift = key.slice(1..2).to_i + offset(date).slice(1).to_i
    c_shift = key.slice(2..3).to_i + offset(date).slice(2).to_i
    d_shift = key.slice(3..4).to_i + offset(date).slice(3).to_i

    final_shifts = [a_shift, b_shift, c_shift, d_shift]

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
      end
    end
    
    @return_hash[:decryption] = decrypted_message.join
    @return_hash[:key] = key
    @return_hash[:date] = date

    @return_hash
  end
end
