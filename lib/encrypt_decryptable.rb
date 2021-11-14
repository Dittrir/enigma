module EncryptDecryptable #name other modules with -able at the end
  def encrypt_decryptable(message, final_shifts, encr_or_decr)
    alphabet = ("a".."z").to_a << " "
    new_message = []
    message_array = message.downcase.split(//)

    if encr_or_decr == "encrypt" #https://stackoverflow.com/questions/39608461/how-to-convert-to-operator-in-ruby
      operator = '+'
    elsif encr_or_decr == "decrypt"
      operator = '-'
    else
      puts "Not a valid encrypt/decrypt argument"
    end

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
      else
        puts "ERROR DURING ENCRYPTION: check your code and try again."
      end
    end
    new_message
  end
end
