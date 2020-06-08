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
# Make every attempt to make your program "elixir-y".

defmodule MicrosoftKeys do
  @moduledoc """
  Generate and validate Microsoft 95-era software keys
  """

  @doc """
  Checks a given key for validity
  """
  @spec valid?(String.t()) :: boolean()
  def valid?(key) do

  end

  @doc """
  Generates a valid key of type type
  """
  @spec generate_key(:ten_digit | :oem) :: String.t()
  def generate_key(type) do

  end
end

# DO NOT EDIT BELOW THIS LINE
ExUnit.start()

defmodule MicrosoftKeysTest do
  use ExUnit.Case, async: true

  describe "valid?/1" do
    test "accepts valid 10-digit keys" do
      for i <- 0..2 do
        site = :io_lib.format("~3..0B", [i * 111]) |> List.to_string()
        assert MicrosoftKeys.valid?("#{site}-7777777")
      end
    end

    test "rejects 10-digit keys with invalid first digits" do
      for i <- 3..9 do
        site = :io_lib.format("~3..0B", [i]) |> List.to_string()
        refute MicrosoftKeys.valid?("#{site}-7777777")
      end
    end

    test "rejects 10-digit keys with an invalid last digit" do
      refute MicrosoftKeys.valid?("111-7777068")
      refute MicrosoftKeys.valid?("111-7777059")
    end

    test "rejects 10-digit keys with invalid last segment" do
      refute MicrosoftKeys.valid?("111-7777775")
    end

    test "accepts valid OEM keys" do
      assert MicrosoftKeys.valid?("13796-OEM-0134373-37984")
    end

    test "rejects invalid days in OEM keys" do
      refute MicrosoftKeys.valid?("37302-OEM-0683774-44111")
    end

    test "rejects invalid years in OEM keys" do
      refute MicrosoftKeys.valid?("20293-OEM-0670672-93055")
    end

    test "rejects OEM keys without a 0 as the first digit of the 7-digit key" do
      refute MicrosoftKeys.valid?("16796-OEM-4636373-10164")
    end

    test "rejects OEM keys where the 7-digit key isn't divisible by 7" do
      refute MicrosoftKeys.valid?("32301-OEM-0940671-30328")
    end

    test "rejects malformed keys" do
      refute MicrosoftKeys.valid?("abcdefghijklmnop")
    end
  end

  describe "generate_key/1" do
    test "generates a valid ten_digit key" do
      assert MicrosoftKeys.generate_key(:ten_digit) |> MicrosoftKeys.valid?()
    end

    test "generates a valid OEM key" do
      assert MicrosoftKeys.generate_key(:oem) |> MicrosoftKeys.valid?()
    end

    test "generates different ten_digit keys each run" do
      key1 = MicrosoftKeys.generate_key(:ten_digit)
      key2 = MicrosoftKeys.generate_key(:ten_digit)
      refute key1 == key2
    end

    test "generates different oem keys each run" do
      key1 = MicrosoftKeys.generate_key(:oem)
      key2 = MicrosoftKeys.generate_key(:oem)
      refute key1 == key2
    end
  end
end
