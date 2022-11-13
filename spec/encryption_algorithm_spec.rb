require 'rspec'
require 'encryption_algorithm'

describe EncryptionAlgorithm do
  describe '#initialize' do
    it 'exists' do
      ea = EncryptionAlgorithm.new

      expect(ea).to be_a EncryptionAlgorithm
    end
  end
end