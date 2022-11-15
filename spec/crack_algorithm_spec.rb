require 'rspec'
require 'crack_algorithm'

describe CrackAlgorithm do
  describe '#initialize' do
    it 'exists and has attributes' do
      ca = CrackAlgorithm.new(message: 'vjqtbeaweqihssi' , date: '291018')

      expect(ca).to be_a CrackAlgorithm
      expect(ca.message).to eq 'vjqtbeaweqihssi'
      expect(ca.date).to eq '291018'
    end
  end
end