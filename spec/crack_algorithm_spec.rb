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

      expect(ca.crack_message).to eq ["hello world end", "08304"]
      expect(ca2.crack_message).to eq ["nigel is always there in the end", "89760"]
    end

    # the following is impossible to do if the encrypted message did not use todays date
    # it 'can crack a message with todays date' do 
    #   ca = CrackAlgorithm.new(message: 'vjqtbeaweqihssi' , date: Time.now.strftime('%d%m%y'))

    #   expect(ca.crack_message).to eq 'hello world end'
    # end
  end

  describe '#incrementer' do
    it 'adds one to counter and subtracts one from upper bound' do
      ca = CrackAlgorithm.new(message: 'vjqtbeaweqihssi' , date: '291018')

      expect(ca.counter).to eq 0
      expect(ca.upper_bound).to eq 99999

      ca.incrementer

      expect(ca.counter).to eq 1
      expect(ca.upper_bound).to eq 99998
    end
  end

  describe '#plus_minus_switch' do
    it 'adds upper_bound to key if counter even and subtracts if counter odd' do
      ca = CrackAlgorithm.new(message: 'vjqtbeaweqihssi' , date: '291018')

      expect(ca.counter.even?).to be true
      expect(ca.key).to eq '00000'

      ca.plus_minus_switch

      expect(ca.key).to eq '99999'

      ca.incrementer

      expect(ca.counter.odd?).to be true
      expect(ca.upper_bound).to eq 99998

      ca.plus_minus_switch

      expect(ca.key).to eq '00001'
    end
  end

  describe '#alternating_series' do
    it 'alternates the key value until convergence' do
      ca = CrackAlgorithm.new(message: 'vjqtbeaweqihssi' , date: '291018')

      ca.alternating_series
      expect(ca.key).to eq '99999'
      expect(ca.counter).to eq 1
      ca.alternating_series
      expect(ca.key).to eq '00001'
      expect(ca.counter).to eq 2
    end
  end

  describe '#end_check' do
    it "checks if the last chacters in the message are ' end'" do
      ca = CrackAlgorithm.new(message: 'vjqtbeaweqihssi' , date: '291018')
      allow(ca).to receive(:decrypt_last_four).and_return(' end')

      expect(ca.end_check?).to be true
    end
  end

  describe '#decrypt_last_four' do
    it 'returns the last four characters of decrypted message' do
      ca = CrackAlgorithm.new(message: 'vjqtbeaweqihssi' , date: '291018')
      allow(ca).to receive(:decrypt_message).and_return('hello world end')

      expect(ca.decrypt_last_four).to eq ' end'
    end
  end
end