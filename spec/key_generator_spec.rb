require 'spec_helper'

module KeyGeneratorable
  def self.create_key
    keys = [*(0..99999)]
    assigned_key = keys.sample.to_s.rjust(5, "0")
  end
end

RSpec.describe KeyGeneratorable do
  it 'creates a key' do
    expect(KeyGeneratorable.create_key).to be_instance_of(String)
  end
end
