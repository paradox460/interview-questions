# Introduction
Roman Numerals are the numbering system used by the ancient Romans. They persist today in a few places, such as the copyright years of films, on clocks, and in many other places.
Roman numerals do not have the ability to indicate fractional values, such as floating points, nor do they have the concept of negative numbers.
Modern Roman Numerals consist of seven letters; I, V, X, L, C, D, and M, which hold values of 1, 5, 10, 50, 100, 500, and 1000, respectively. They represent numbers using an additive formation, where digits are repeated to increase the amount of that digit. `XX` is 20, `VII` is 7, and so forth.

# Rules of Roman Numerals
Roman numerals follow a simple set of rules:

+ The letters I, X, and C may be repeated up to three times in immediate succession.
+ If a lower value digit is to the left of a higher value digit, it is subtracted from the higher value digit.
+ If a lower value digit is to the right of a higher value digit, it is added to the higher value digit.
+ Only I, X, and C may be used as subtractive digits
+ Subtractive digits may only be one order of magnitude less than the higher value. I may only subtract from V and X, X from L and C, and so forth.
+ If a bar is placed over a digit, its value is multiplied by 1000 (for the sake of our example, the bar will be an underscore, and will precede the digit it applies to, i.e `_X` is 10,000)

# Task
Write a program that can convert to and from Roman numerals, as well as validating if a string is a valid number in Roman Numeric format.
