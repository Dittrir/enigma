module EncryptDecryptable #name other modules with -able at the end
  def encrypt_decryptable(message, final_shifts, encr_or_decr)
    new_message = []
    message_raw = message.downcase.split(//)
    message_array = symbol_smasher(message_raw)
    operator = operator_assigner(encr_or_decr)
    message_array.each_with_index do |character, index|
      new_message << character_return(index % 4, character, operator, final_shifts)
    end
    new_message.join
  end

  def character_return(index_modulo, character, operator, final_shifts)
    char = @alphabet.index(character).send(operator, (final_shifts[index_modulo]))
    @alphabet.rotate(char)[0]
  end

  def operator_assigner(encr_or_decr)
    if encr_or_decr == "encrypt"
      operator = '+'
    elsif encr_or_decr == "decrypt"
      operator = '-'
    else
    end
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
