require 'spec_helper'

module EncryptDecryptable
  def self.encrypt_decryptable(message, final_shifts, encr_or_decr)
    alphabet = ("a".."z").to_a << " "
    new_message = []
    message_raw = message.downcase.split(//)
    message_array = symbol_smasher(message_raw)

    operator = operator_assigner(encr_or_decr)

    message_array.each_with_index do |character, index|
      if index % 4 == 0
        char_1 = alphabet.index(character).send(operator, (final_shifts[0]))
          new_message << alphabet.rotate(char_1)[0]
      elsif index % 4 == 1
        char_2 = alphabet.index(character).send(operator, (final_shifts[1]))
          new_message << alphabet.rotate(char_2)[0]
      elsif index % 4 == 2
        char_3 = alphabet.index(character).send(operator, (final_shifts[2]))
          new_message << alphabet.rotate(char_3)[0]
      elsif index % 4 == 3
        char_4 = alphabet.index(character).send(operator, (final_shifts[3]))
          new_message << alphabet.rotate(char_4)[0]
      end
    end
    new_message.join
  end

  def self.operator_assigner(encr_or_decr)
    if encr_or_decr == "encrypt"
      operator = '+'
    elsif encr_or_decr == "decrypt"
      operator = '-'
    end
  end

  def self.symbol_smasher(message_array)
    alphabet = ("a".."z").to_a << " "
    symbols = []
    message_array.each do |character|
      if alphabet.include? character
      else
        symbols << character
      end
    end
    message_array.reject { |symbol| symbols.include? (symbol)}
  end
end

RSpec.describe EncryptDecryptable do
  it 'encrypts a message' do
    final_shifts = [3, 27, 73, 20]

    expect(EncryptDecryptable.encrypt_decryptable("hello world", final_shifts, "encrypt")).to eq("keder ohulw")
  end

  it 'decrypts a message' do
    final_shifts = [3, 27, 73, 20]

    expect(EncryptDecryptable.encrypt_decryptable("keder ohulw", final_shifts, "decrypt")).to eq("hello world")
  end

  it 'strips symbols' do
    expect(EncryptDecryptable.symbol_smasher(["a", "!", "&", "b", "#", "c"])).to eq(["a", "b", "c"])
  end

  it 'assigns + as an operator' do
    expect(EncryptDecryptable.operator_assigner("encrypt")).to eq("+")
  end

  it 'assigns - as an operator' do
    expect(EncryptDecryptable.operator_assigner("decrypt")).to eq("-")
  end
end
