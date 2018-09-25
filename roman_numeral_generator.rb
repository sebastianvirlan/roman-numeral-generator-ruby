# frozen_string_literal: true

# MAP CLASS WITH HELPERS
class RomanNumeralFactory
  attr_reader :unit, :five, :next_place

  def initialize(unit, five = '', next_place = '')
    @unit       = unit
    @five       = five
    @next_place = next_place
  end

  def for_digit(digit)
    return units(digit)                if digit.between?(1, 3)
    return units_with_five(digit - 5)  if digit.between?(6, 8)
    return four                        if digit == 4
    return five                        if digit == 5
    return nine                        if digit == 9
    ''
  end

  private

  def units(times)
    Array.new(times) { @unit }.join
  end

  def units_with_five(times)
    five + Array.new(times) { @unit }.join
  end

  def four
    @unit + @five
  end

  def nine
    @unit + @next_place
  end
end

# GENERATE ROMAN NUMERALS FROM DIGITS
class RomanNumeralGenerator
  MAX_LIMIT = 3999

  def self.generate(number)
    new(number).generate
  end

  def initialize(number)
    @number         = number
    @number_length  = 0
    @result         = []
  end

  def generate
    return result if @number > MAX_LIMIT

    generate_thousands  if thousand_digit
    generate_hundreds   if hundred_digit
    generate_tens       if ten_digit
    generate_units      if unit_digit

    result
  end

  private

  def generate_units
    @result << RomanNumeralFactory.new('I', 'V', 'X').for_digit(unit_digit)
  end

  def generate_tens
    @result << RomanNumeralFactory.new('X', 'L', 'C').for_digit(ten_digit)
  end

  def generate_hundreds
    @result << RomanNumeralFactory.new('C', 'D', 'M').for_digit(hundred_digit)
  end

  def generate_thousands
    @result << RomanNumeralFactory.new('M').for_digit(thousand_digit)
  end

  def digits
    @digits ||= @number.digits
  end

  def result
    @result.join
  end

  def thousand_digit
    digits[3]
  end

  def hundred_digit
    digits[2]
  end

  def ten_digit
    digits[1]
  end

  def unit_digit
    digits[0]
  end
end
