require 'rspec'
require_relative '../roman_numeral_generator.rb'

RSpec.describe RomanNumeralGenerator do
  describe '.generate' do
    it 'returns correct roman numeral for units' do
      expect(described_class.generate(1)).to eq('I')
      expect(described_class.generate(4)).to eq('IV')
      expect(described_class.generate(9)).to eq('IX')
    end

    it 'returns correct roman numeral for tens' do
      expect(described_class.generate(12)).to eq('XII')
      expect(described_class.generate(40)).to eq('XL')
      expect(described_class.generate(76)).to eq('LXXVI')
      expect(described_class.generate(90)).to eq('XC')
    end

    it 'returns correct roman numeral for hundreds' do
      expect(described_class.generate(120)).to eq('CXX')
      expect(described_class.generate(401)).to eq('CDI')
      expect(described_class.generate(769)).to eq('DCCLXIX')
      expect(described_class.generate(990)).to eq('CMXC')
    end

    it 'returns correct roman numeral for thousands' do
      expect(described_class.generate(1000)).to eq('M')
      expect(described_class.generate(2000)).to eq('MM')
      expect(described_class.generate(3000)).to eq('MMM')
    end

    it 'returns correct roman numeral for thousands and hundreds' do
      expect(described_class.generate(1200)).to eq('MCC')
      expect(described_class.generate(3400)).to eq('MMMCD')      
      expect(described_class.generate(3500)).to eq('MMMD')
      expect(described_class.generate(3600)).to eq('MMMDC')
      expect(described_class.generate(1900)).to eq('MCM')
    end

    it 'returns correct roman numeral for thousands, hundreds and tens' do
      expect(described_class.generate(1140)).to eq('MCXL')
      expect(described_class.generate(1150)).to eq('MCL')
      expect(described_class.generate(1170)).to eq('MCLXX')
      expect(described_class.generate(2290)).to eq('MMCCXC')
      expect(described_class.generate(2990)).to eq('MMCMXC')
    end

    it 'returns correct roman numeral for thousands, hundreds, tens and units' do
      expect(described_class.generate(1141)).to eq('MCXLI')
      expect(described_class.generate(1154)).to eq('MCLIV')
      expect(described_class.generate(1175)).to eq('MCLXXV')
      expect(described_class.generate(2296)).to eq('MMCCXCVI')
      expect(described_class.generate(2999)).to eq('MMCMXCIX')
      expect(described_class.generate(3999)).to eq('MMMCMXCIX')
    end

    it 'returns empty strig if number is bigger than 3999' do
      expect(described_class.generate(4000)).to eq('')
    end
  end
end