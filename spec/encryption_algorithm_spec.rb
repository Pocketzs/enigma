require 'rspec'
require 'encryption_algorithm_spec'

describe EncryptionAlgorithm do
  describe '#initialize' do
    it 'exists' do
      ea = EncryptionAlgorithm.new

      expect(ea).to be_a EncryptionAlgorithm
    end
  end
end