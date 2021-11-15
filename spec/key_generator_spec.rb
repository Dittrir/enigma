require 'spec_helper'

module KeyGeneratorable
  def self.create_key
    assigned_key = rand(99999).to_s.rjust(5, "0")
  end
end

RSpec.describe KeyGeneratorable do
  it 'creates a key' do
    expect(KeyGeneratorable.create_key).to be_instance_of(String)
  end

  it 'creates a key' do
    expect(KeyGeneratorable.create_key.length).to eq(5)
  end
end
