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

  describe '#lettered_shifts' do
    it 'returns an array of lettered shifts keys' do
      shifts = Shifts.new({key: '02715', date: '040895'})

      expect(shifts.lettered_shifts.length).to eq 4
      expect(shifts.lettered_shifts).to eq ['A shift', 'B shift', 'C shift', 'D shift']
    end
  end

  describe 'keys' do
    it 'returns a hash of keys' do
      shifts = Shifts.new({key: '02715', date: '040895'})
  
      expected = {
        'A key' => 91,
        'B key' => 10,
        'C key' => 3,
        'D key' => 34
      }
  
      expect(shifts.keys).to eq expected
    end
  end
end