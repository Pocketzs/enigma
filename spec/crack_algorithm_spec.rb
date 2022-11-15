require 'rspec'
require 'crack_algorithm'

describe CrackAlgorithm do
  describe '#initialize' do
    it 'exists and has attributes' do
      ca = CrackAlgorithm.new(message: 'vjqtbeaweqihssi' , date: '291018')

      expect(ca).to be_a CrackAlgorithm
      expect(ca.message).to eq 'vjqtbeaweqihssi'
      expect(ca.date).to eq '291018'
      expect(ca.key).to eq '00000'
      expect(ca.counter).to eq 0
      expect(ca.upper_bound).to eq 99999
      expect(ca.final_key_array).to eq []
    end
  end

  describe '#crack_message' do
    it 'can crack a message with a date' do
      ca = CrackAlgorithm.new(message: 'vjqtbeaweqihssi' , date: '291018')
      ca2 = CrackAlgorithm.new(message: 'cfjoaxlbpyofqvvjiehauxlxpqkopbqn' , date: '151122')

      expect(ca.crack_message).to eq 'hello world end'
    end
  end
end