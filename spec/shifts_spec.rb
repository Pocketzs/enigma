require 'rspec'
require './lib/shifts'

describe Shifts do
  describe '#initialize' do
    it 'exists and has attributes' do
      shifts = Shifts.new({key: '02715', date: '040895'})

      expect(shifts).to be_a Shifts
      expect(shifts.key).to eq '02715'
      expect(shifts.date).to eq '040895'
    end
  end
end