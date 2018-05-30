/*
The Luhn test is used by some credit card companies to distinguish valid credit card numbers from what could be a random selection of digits.

Those companies using credit card numbers that can be validated by the Luhn test have numbers that pass the following test:

1. Reverse the order of the digits in the number.
2. Take the first, third, ... and every other odd digit in the reversed digits and sum them to form the partial sum s1
3. Taking the second, fourth ... and every other even digit in the reversed digits:
4. Multiply each digit by two and sum the digits if the answer is greater than nine to form partial sums for the even digits
5. Sum the partial sums of the even digits to form s2
6. If s1 + s2 ends in zero then the original number is in the form of a valid credit card number as verified by the Luhn test.

For example, if the trial number is 49927398716:

1. Reverse the digits:
  61789372994
2. Sum the odd digits:
  6 + 7 + 9 + 7 + 9 + 4 = 42 = s1
3. The even digits:
    1,  8,  3,  2,  9
  4. Two times each even digit:
    2, 16,  6,  4, 18
  5. Sum the digits of each multiplication:
    2,  7,  6,  4,  9
  6. Sum the last:
    2 + 7 + 6 + 4 + 9 = 28 = s2

s1 + s2 = 70 which ends in zero which means that 49927398716 passes the Luhn test

Task
Write a function/method/procedure/subroutine that will validate a number with the Luhn test, and
use it to validate the following numbers:

   49927398716
   49927398717
   1234567812345678
   1234567812345670
*/

const luhn = function(cc) {
  const digits = cc
    .toString()
    .split("")
    .reverse()
    .map(d => parseInt(d));

  let csum = 0;
  for (let idx = 0; idx < digits.length; idx += 2) {
    const [odd=0, even=0] = digits.slice(idx, idx + 2)
    let double = even * 2
    if (double > 9) { double -= 9 }
    csum += double + odd
  }
  return (csum % 10) === 0
}

// DO NOT EDIT BELOW THIS LINE
console.assert(luhn(49927398716), "49927398716 should be valid");
console.assert(luhn(1234567812345670), "1234567812345670 should be valid");
console.assert(!luhn(49927398717), "49927398717 should be invalid");
console.assert(!luhn(1234567812345678), "1234567812345678 should be invalid");
