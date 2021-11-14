require 'spec_helper'

module KeyGenerator
  def self.create_key
    keys = [*(0..99999)]
    assigned_key = keys.sample.to_s.rjust(5, "0")
  end
end

RSpec.describe KeyGenerator do
  it 'creates a key' do
    expect(KeyGenerator.create_key).to be_instance_of(String)
  end
end
