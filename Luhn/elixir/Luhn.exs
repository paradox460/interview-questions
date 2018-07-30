# The Luhn test is used by some credit card companies to distinguish valid
# credit card numbers from what could be a random selection of digits.
#
# These companies use credit card numbers that pass the following test:
#
# 1. Reverse the order of the digits in the number.
# 2. Take the first, third, fifth... (and so on) digits in the reversed digits.
# 3. Sum these to form the partial sum s1.
# 4. Now take the second, fourth, sixth... (and so on) digits in the reversed digits.
# 5. For each of these digits:
#    - Multiply the digit by 2
#    - If the result is greater than 9, sum the digits of the result.
#    - Otherwise, just take the result as is.
# 6. Sum the results generated in step 5 to get a new partial sum, s2.
# 7. If (s1 + s2) ends in a 0, the number passes the Luhn test! Otherwise, it fails.
#
# For example, if the trial number is 49927398716:
#
# 1. Reverse the digits:
#   61789372994
# 2. Take the first, third, fifth... digits:
#   6, 7, 9, 7, 9, 4
# 3. Sum these digits to get s1:
#   s1 = 6 + 7 + 9 + 7 + 9 + 4 = 42
# 4. Take the second, fourth, sixth... digits:
#   1,  8,  3,  2,  9
# 5. Multiply each digit by 2:
#   2, 16,  6,  4, 18
#    And sum the digits of the results which are greater than 9:
#   2,  7,  6,  4,  9
# 6. Sum these results to get s2:
#   s2 = 2 + 7 + 6 + 4 + 9 = 28
# 7. Check whether (s1 + s2) ends in 0:
#   s1 + s2 = 42 + 28 = 70, which ends in 0.
# So 49927398716 passes the Luhn test.
#
#
# Task
# Write a function/method/procedure/subroutine that will validate a number with
# the Luhn test, and use it to validate the following numbers:
#
#    49927398716
#    49927398717
#    1234567812345678
#    1234567812345670

defmodule Luhn do
  def valid?(cc) do

  end
end
# DO NOT EDIT BELOW THIS LINE
ExUnit.start()
defmodule LuhnTest do
  use ExUnit.Case, async: true

  test "49927398716" do
    assert Luhn.valid?(49927398716)
  end
  test "49927398717" do
    refute Luhn.valid?(49927398717)
  end
  test "1234567812345678" do
    refute Luhn.valid?(1234567812345678)
  end
  test "1234567812345670" do
    assert Luhn.valid?(1234567812345670)
  end
end
