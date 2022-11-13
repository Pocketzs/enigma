require 'rspec'
require './lib/keys'

describe Keys do
  describe '#initialize' do
    it 'exists and has attributes' do
      keys = Keys.new('02715')

      expect(keys).to be_a Keys
      expect(keys.five_digit_number.length).to eq 5
      expect(keys.a_key).to eq 2
      expect(keys.b_key).to eq 27
      expect(keys.c_key).to eq 71
      expect(keys.d_key).to eq 15
    end
  end
end