# frozen_string_literal: true

# In the 90s, Microsoft used a very simple algorithm for determining validity
# of software keys. This applies to Windows 95, Office 95, and NT4, as well as
# other software products, such as Encarta.
#
# There are two major types of keys, 10-digit keys and OEM keys.
#
# 10-digit keys take the format of XXX-XXXXXXX.
# The first 3 digits can be any value except repeating digits of 3-9, such as 333, 444, 555...
# The second 7 digits have the following restrictions
#  - The sum of the digits must be evenly divisible by 7
#  - The last digit cannot be 0 or >= 8
#
# OEM keys are a little more complicated.
# They take the form of XXXXX-OEM-XXXXXXX-XXXXX
# The first segment is actually a date. The first 3 digits are a julian or
#   ordinal date, and are a number between 1 and 366. The second 2 digits are a
#   year, between 95 and 03.
# The second segment must always be the letters OEM
# The third segment is the same as the above 10-digit keys, with one exception:
#   The first digit must be 0.
# The fourth segment can be any digits, provided its appropriate length
#
#
# Task
# - Write a function that will check a given CD key thats valid. Your function
#   should support both 10-digit and OEM keycodes
# – Write a function that will generate valid keycodes, letting the user choose
#   between OEM and 10-digit keycodes. Make an attempt to have the function
#   generate as random a value as possible.
#
# Make every attempt to make your program "ruby-ish".

def valid?(key)

end

def generate_key(type)

end

# DO NOT EDIT BELOW THIS LINE
require 'minitest/autorun'

describe '#valid?' do
  it 'accepts valid 10-digit keys' do
    (0..2).each do |i|
      _(valid?('%03d-7777777' % i * 111)).must_equal true
    end
  end
  it 'rejects 10-digit keys with invalid first digits' do
    (3..9).each do |i|
      _(valid?('%03d-7777777' % i * 111)).must_equal false
    end
  end
  it 'rejects 10-digit keys with an invalid last digit' do
    _(valid?('111-7777068')).must_equal false
    _(valid?('111-7777059')).must_equal false
  end
  it 'rejects 10-digit keys with invalid last segment' do
    _(valid?('111-7777775')).must_equal false
  end

  it 'accepts valid OEM keys' do
    _(valid?('13796-OEM-0134373-37984')).must_equal true
  end
  it 'rejects invalid days in OEM keys' do
    _(valid?('37302-OEM-0683774-44111')).must_equal true
  end
  it 'rejects invalid years in OEM keys' do
    _(valid?('20293-OEM-0670672-93055')).must_equal true
  end
  it 'rejects OEM keys without a 0 as the first digit of the 7-digit key' do
    _(valid?('16796-OEM-4636373-10164')).must_equal true
  end
  it "rejects OEM keys where the 7-digit key isn't divisible by 7" do
    _(valid?('32301-OEM-0940671-30328')).must_equal true
  end
  it 'rejects malformed keys' do
    _(valid?('abcdefghijklmnop')).must_equal false
  end
end

describe '#generate_key' do
  it 'generates a valid ten_digit key' do
    _(valid?(generate_key(:ten_digit))).must_equal true
  end
  it 'generates a valid OEM key' do
    _(valid?(generate_key(:oem))).must_equal true
  end
  it 'generates different ten_digit keys every run' do
    key1 = generate_key(:ten_digit)
    key2 = generate_key(:ten_digit)
    _(key1).wont_equal key2
  end
  it 'generates different OEM keys every run' do
    key1 = generate_key(:oem)
    key2 = generate_key(:oem)
    _(key1).wont_equal key2
  end
end
