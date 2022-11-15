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

  describe '#lettered_hash_keys' do
    it 'returns an array of lettered shifts keys' do
      shifts = Shifts.new({key: '02715', date: '040895'})

      expect(shifts.lettered_hash_keys.length).to eq 4
      expect(shifts.lettered_hash_keys).to eq ['A shift', 'B shift', 'C shift', 'D shift']
    end
  end

  describe '#keys' do
    it 'returns a hash of keys' do
      shifts = Shifts.new({key: '02715', date: '040895'})
  
      expected =
        {
          'A key' => 2,
          'B key' => 27,
          'C key' => 71,
          'D key' => 15
        }
  
      expect(shifts.keys).to eq expected
    end
  end

  describe '#offsets' do
    it 'returns a hash of offsets' do
      shifts = Shifts.new({key: '02715', date: '040895'})
  
      expected =
        {
          'A offset' => 1,
          'B offset' => 0,
          'C offset' => 2,
          'D offset' => 5
        }
  
      expect(shifts.offsets).to eq expected
    end
  end

  describe '#shifts' do
    it 'adds the keys and offsets together to make a shifts hash' do
      shifts = Shifts.new({key: '02715', date: '040895'})
      shifts2 = Shifts.new({key: '91034', date: '131122'})

      expected =
        {
          'A shift' => 3,
          'B shift' => 27,
          'C shift' => 73,
          'D shift' => 20
        }
      expected2 =
        {
          'A shift' => 99,
          'B shift' => 18,
          'C shift' => 11,
          'D shift' => 38
        }

      expect(shifts.shifts).to eq expected
      expect(shifts2.shifts).to eq expected2
    end
  end

  describe '#class_name' do
    it 'returns the class name' do
      shifts = Shifts.new({key: '02715', date: '040895'})

      expect(shifts.class_name).to eq 'Shifts'
    end
  end

  describe '#format_class_name' do
    it 'returns the class name downcased and singular' do
      shifts = Shifts.new({key: '02715', date: '040895'})
      
      expect(shifts.format_class_name).to eq 'shift'
    end
  end
end
