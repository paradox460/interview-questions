defmodule RomanNumerals do

  @doc """
  Returns a boolean if a string is a valid Roman Numeral
  """
  @spec roman_to_integer!(String.t()) :: boolean()
  def roman_to_integer!(string) do

  end

  @doc """
  Converts an integer to the shortest possible Roman Numeral
  """
  @spec integer_to_roman(pos_integer()) :: String.t
  def integer_to_roman(integer) do

  end

  @doc """
  Converts a string of Roman Numerals to an integer, if it is a valid Roman
  Numeral.
  """
  @spec roman_to_integer!(String.t) :: pos_integer()
  def roman_to_integer!(roman) do

  end
end

# DO NOT EDIT BELOW THIS LINE

ExUnit.start()

defmodule RomanNumeralsTest do
  use ExUnit.Case, async: true

  describe "roman_to_integer!/1" do
    test "confirms a valid roman" do
      assert RomanNumerals.roman_to_integer!("MCMLXVIII")
      assert RomanNumerals.roman_to_integer!("XXX")
      assert RomanNumerals.roman_to_integer!("MDXLIV")
      assert RomanNumerals.roman_to_integer!("_X_XM")
    end

    test "rejects an invalid roman" do
      refute RomanNumerals.roman_to_integer!("")
      refute RomanNumerals.roman_to_integer!("ABCDEFG")
      refute RomanNumerals.roman_to_integer!("CMMLXVIII")
      refute RomanNumerals.roman_to_integer!("XX_X")
      refute RomanNumerals.roman_to_integer!("MXIMIX")
      refute RomanNumerals.roman_to_integer!("MDXLIV")
      refute RomanNumerals.roman_to_integer!("MXMIC")
      refute RomanNumerals.roman_to_integer!("DMXLIV")
      refute RomanNumerals.roman_to_integer!("M_X_X")
    end
  end

  describe "integer_to_roman!/1" do
    test "converts any integer to the shortest roman possible" do
      assert RomanNumerals.integer_to_roman(14) == "XIV"
      assert RomanNumerals.integer_to_roman(1999) == "MCMXCIX"
      assert RomanNumerals.integer_to_roman(1_234_567) == "_M_C_C_X_X_X_I_VDLXVII"
    end
  end

  describe roman_to_integer!/1 do
    test "throws an error if the roman is invalid" do
      assert_raise ArgumentError, RomanNumerals.roman_to_integer!("")
      assert_raise ArgumentError, RomanNumerals.roman_to_integer!("ABCDEFG")
      assert_raise ArgumentError, RomanNumerals.roman_to_integer!("CMMLXVIII")
      assert_raise ArgumentError, RomanNumerals.roman_to_integer!("XX_X")
      assert_raise ArgumentError, RomanNumerals.roman_to_integer!("MXIMIX")
      assert_raise ArgumentError, RomanNumerals.roman_to_integer!("MDXLIV")
      assert_raise ArgumentError, RomanNumerals.roman_to_integer!("MXMIC")
      assert_raise ArgumentError, RomanNumerals.roman_to_integer!("DMXLIV")
      assert_raise ArgumentError, RomanNumerals.roman_to_integer!("M_X_X")
    end

    test "converts a valid roman to an integer" do
      assert RomanNumerals.roman_to_integer!("MCMLXVIII") == 1968
      assert RomanNumerals.roman_to_integer!("XXX") == 30
      assert RomanNumerals.roman_to_integer!("MDXLIV") == 1544
      assert RomanNumerals.roman_to_integer!("_X_XM") == 21_000
      assert RomanNumerals.roman_to_integer!("XIV") == 14
      assert RomanNumerals.roman_to_integer!("MCMXCIX") == 1999
      assert RomanNumerals.roman_to_integer!("_M_C_C_X_X_X_I_VDLXVII") == 1_234_567
    end
  end
end
