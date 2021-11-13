require 'spec_helper'

RSpec.describe KeyGenerator do
  it 'exists' do
    @key_generator = KeyGenerator(message, key, date)
    expect(@key_generator).to be_instance_of(KeyGenerator)
  end
end
