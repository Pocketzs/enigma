require 'rspec'
require './lib/keys'

describe Keys do
  describe '#initialize' do
    it 'exists and has attributes' do
      keys = Keys.new('02715')

      expect(keys).to be_a Keys
      expect(keys.five_digit_number.length).to eq 5
    end
  end
end