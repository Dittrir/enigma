module EncryptDecryptable #name other modules with -able at the end
  def encrypt_decryptable(message, final_shifts, encr_or_decr)
    new_message = []
    message_raw = message.downcase.split(//)
    message_array = symbol_smasher(message_raw)
    #This conditional adds or removes the shifts depending on encrypt/decrypt
    #https://stackoverflow.com/questions/39608461/how-to-convert-to-operator-in-ruby
    if encr_or_decr == "encrypt"
      operator = '+'
    elsif encr_or_decr == "decrypt"
      operator = '-'
    else
      puts "Not a valid encrypt/decrypt argument"
    end

    message_array.each_with_index do |character, index|
      if index % 4 == 0
        char = @alphabet.index(character).send(operator, (final_shifts[0]))
          new_message << @alphabet.rotate(char)[0]
      elsif index % 4 == 1
        char = @alphabet.index(character).send(operator, (final_shifts[1]))
          new_message << @alphabet.rotate(char)[0]
      elsif index % 4 == 2
        char = @alphabet.index(character).send(operator, (final_shifts[2]))
          new_message << @alphabet.rotate(char)[0]
      elsif index % 4 == 3
        char = @alphabet.index(character).send(operator, (final_shifts[3]))
          new_message << @alphabet.rotate(char)[0]
      else
        puts "ERROR DURING ENCRYPTION: check your code and try again."
      end
    end
    new_message.join
  end

  def symbol_smasher(message_array)
    symbols = []
    message_array.each do |character|
      if @alphabet.include? character
      else
        symbols << character
      end
    end
    #reject is like .map (it pulls out anything that fits the parameters)
    message_array.reject { |symbol| symbols.include? (symbol)}
  end
end
