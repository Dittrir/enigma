require 'spec_helper'

RSpec.describe EncryptDecryptable do
  before (:each) do
    @enigma = Enigma.new
  end

  it 'encrypts a message' do
    final_shifts = [3, 27, 73, 20]

    expect(@enigma.encrypt_decryptable("hello world", final_shifts, "encrypt")).to eq("keder ohulw")
  end

  it 'decrypts a message' do
    final_shifts = [3, 27, 73, 20]

    expect(@enigma.encrypt_decryptable("keder ohulw", final_shifts, "decrypt")).to eq("hello world")
  end

  it 'strips symbols' do
    expect(@enigma.symbol_smasher(["a", "!", "&", "b", "#", "c"])).to eq(["a", "b", "c"])
  end

  it 'assigns + as an operator' do
    expect(@enigma.operator_assigner("encrypt")).to eq("+")
  end

  it 'assigns - as an operator' do
    expect(@enigma.operator_assigner("decrypt")).to eq("-")
  end
end
