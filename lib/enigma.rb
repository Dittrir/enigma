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
    message_array = message.downcase.split(//) #breaks every letter into its own string
  end

  def encrypt(message, key = create_key, date = create_date)
    key = "02715"

    #Index Positions
    a_key = key.slice(0..1)
    b_key = key.slice(1..2)
    c_key = key.slice(2..3)
    d_key = key.slice(3..4)

    key_index = [a_key, b_key, c_key, d_key] #global var in main class

    #date

    date = "040895"
    date_squared = date.to_i ** 2
    last_four = (date_squared.to_s).chars.last(4).join

    a_offset = last_four.slice(0)
    b_offset = last_four.slice(1)
    c_offset = last_four.slice(2)
    d_offset = last_four.slice(3)

    offsets = [a_offset, b_offset, c_offset, d_offset] #global var in main class


    a_shift = key_index[0].to_i + offsets [0].to_i
    b_shift = key_index[1].to_i + offsets [1].to_i
    c_shift = key_index[2].to_i + offsets [2].to_i
    d_shift = key_index[3].to_i + offsets [3].to_i

    final_shifts = [a_shift, b_shift, c_shift, d_shift]


    encrypted_message = []

    message_array.each_with_index do |character, index|
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

    encrypted_message.join("")


    #DECRYPTION: need to know the key and date provided
    cypher_text = "keder ohulw"
    decryption_key = "02715"
    decryption_date = "040895"
    cypher_text_array = cypher_text.downcase.split(//)

    a_key_decryption = decryption_key.slice(0..1)
    b_key_decryption = decryption_key.slice(1..2)
    c_key_decryption = decryption_key.slice(2..3)
    d_key_decryption = decryption_key.slice(3..4)

    decryption_key_index = [a_key, b_key, c_key, d_key]

    decryption_date_squared = decryption_date.to_i ** 2
    decryption_last_four = (decryption_date_squared.to_s).chars.last(4).join

    a_offset_decryption = decryption_last_four.slice(0)
    b_offset_decryption = decryption_last_four.slice(1)
    c_offset_decryption = decryption_last_four.slice(2)
    d_offset_decryption = decryption_last_four.slice(3)

    decryption_offsets = [a_offset_decryption, b_offset_decryption, c_offset_decryption, d_offset_decryption]


    a_shift = decryption_key_index[0].to_i + decryption_offsets[0].to_i
    b_shift = decryption_key_index[1].to_i + decryption_offsets[1].to_i
    c_shift = decryption_key_index[2].to_i + decryption_offsets[2].to_i
    d_shift = decryption_key_index[3].to_i + decryption_offsets[3].to_i

    decryption_final_shifts = [a_shift, b_shift, c_shift, d_shift]

    decrypted_message = []

    cypher_text_array.each_with_index do |character, index|
      if index % 4 == 0
        decr_char_1 = @alphabet.index(character) - (decryption_final_shifts[0])
          decrypted_message << @alphabet.rotate(decr_char_1)[0]
      elsif index % 4 == 1
        decr_char_2 = @alphabet.index(character) - (decryption_final_shifts[1])
          decrypted_message << @alphabet.rotate(decr_char_2)[0]
      elsif index % 4 == 2
        decr_char_3 = @alphabet.index(character) - (decryption_final_shifts[2])
          decrypted_message << @alphabet.rotate(decr_char_3)[0]
      elsif index % 4 == 3
        decr_char_4 = @alphabet.index(character) - (decryption_final_shifts[3])
          decrypted_message << @alphabet.rotate(decr_char_4)[0]
      else
      end
    end

    decrypted_message.join("")
  end
end
