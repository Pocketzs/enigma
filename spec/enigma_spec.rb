require 'rspec'
require './lib/enigma'

describe Enigma do
  describe '#initialize' do
    enigma = Enigma.new

    expect(enigma).to be_a Enigma
  end
end