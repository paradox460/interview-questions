
# In the 90s, Microsoft used a very simple algorithm for determining validity
# of software keys. This applies to Windows 95, Office 95, and NT4, as well as
# other software products, such as Encarta.
#
# There are two major types of keys, 10-digit keys and OEM keys.
#
# 10-digit keys take the format of XXX-XXXXXXX.
# The first 3 digits can be any value except repeating digits of 3-9.
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
# The fourth segment can be anything, provided its appropriate length
#
#
# Task
# - Write a function that will check a given CD key thats valid. Your function
#   should support both 10-digit and OEM keycodes
# – Write a function that will generate valid keycodes, letting the user choose
#   between OEM and 10-digit keycodes. Make an attempt to have the function
#   generate as random a value as possible.
#
# Make every attempt to make your program "pythonic".

import unittest

class MicrosoftKeys:
  @staticmethod
  def valid(key):
    # YOUR CODE HERE
    return true

  @staticmethod
  def generate_key(type):
    # YOUR CODE HERE
    return true

# DO NOT EDIT BELOW THIS LINE
class TestMicrosoftKeys(unittest.TestCase):
  def testTenDigit(self):
    # Valid 10-digit keys
    for i in range(0,2):
      site = "%03d" % i * 111
      self.assertTrue(MicrosoftKeys.valid(f"{site}-7777777"), "valid 10-digit marked as invalid")

    # Invalid first digit 10-digit keys
    for i in range(3..9):
      site = "%03d" % i * 111
      self.assertFalse(MicrosoftKeys.valid(f"{site}-7777777"), "10-digit with  prefix marked as valid")

    # Invalid last digit 10-digit keys
    self.assertFalse(MicrosoftKeys.valid("111-7777068"), "10-digit with invalid last digit marked as valid")
    self.assertFalse(MicrosoftKeys.valid("111-7777059"), "10-digit with invalid last digit marked as valid")

    # Invalid last-segment 10-digit keys
    self.assertFalse(MicrosoftKeys.valid("111-7777775"), "10-digit with invalid last segment marked as valid")

  def testOem(self):
    # Valid OEM
    self.assertTrue(MicrosoftKeys.valid("13796-OEM-0134373-37984"), "valid OEM key marked as invalid")
    # OEM with invalid day
    self.assertFalse(MicrosoftKeys.valid("37302-OEM-0683774-44111"), "OEM key with invalid day marked as valid")
    # OEM with invalid year
    self.assertFalse(MicrosoftKeys.valid("20293-OEM-0670672-93055"), "OEM key with invalid year marked as valid")
    # OEM with invalid first digit in 7 digit
    self.assertFalse(MicrosoftKeys.valid("16796-OEM-4636373-10164"), "OEM key with invalid first-digit in 7-digit marked as valid")
    # OEM with invalid 7-digit
    self.assertFalse(MicrosoftKeys.valid("32301-OEM-0940671-30328"), "OEM key with invalid 7-digit marked as valid")

  def testMalformed(self):
    self.assertFalse(MicrosoftKeys.valid("abcdefghijklmnop"), "Malformed key marked as valid")

  def testGenerateTenDigit(self):
    self.assertTrue(MicrosoftKeys.valid(MicrosoftKeys.generate_key("ten_digit")), "Generated 10-digit key was marked invalid")

    key1 = MicrosoftKeys.generate_key("ten_digit")
    key2 = MicrosoftKeys.generate_key("ten_digit")
    self.assertNotEqual(key1, key2, "Sequential runs of generate_key with 10-digit key are not unique")

  def testGenerateOem(self):
    self.assertTrue(MicrosoftKeys.valid(MicrosoftKeys.generate_key("oem")), "Generated OEM key was marked invalid")

    key1 = MicrosoftKeys.generate_key("oem")
    key2 = MicrosoftKeys.generate_key("oem")
    self.assertNotEqual(key1, key2, "Sequential runs of generate_key with OEM key are not unique")

if __name__ == '__main__':
  unittest.main()
