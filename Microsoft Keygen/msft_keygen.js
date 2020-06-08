// In the 90s, Microsoft used a very simple algorithm for determining validity
// of software keys. This applies to Windows 95, Office 95, and NT4, as well as
// other software products, such as Encarta.
//
// There are two major types of keys, 10-digit keys and OEM keys.
//
// 10-digit keys take the format of XXX-XXXXXXX.
// The first 3 digits can be any value except repeating digits of 3-9, such as 333, 444, 555...
// The second 7 digits have the following restrictions
// 	- The sum of the digits must be evenly divisible by 7
// 	- The last digit cannot be 0 or >= 8
//
// OEM keys are a little more complicated.
// They take the form of XXXXX-OEM-XXXXXXX-XXXXX
// The first segment is actually a date. The first 3 digits are a julian or ordinal date, and are a number between 1 and 366. The second 2 digits are a year, between 95 and 03.
// The second segment must always be the letters OEM
// The third segment is the same as the above 10-digit keys, with one exception: The first digit must be 0.
// The fourth segment can be any digits, provided its appropriate length
//
//
// Task
// - Write a function that will check a given CD key thats valid. Your function should support both 10-digit and OEM keycodes
// – Write a function that will generate valid keycodes, letting the user choose between OEM and 10-digit keycodes. Make an attempt to have the function generate as random a value as possible.

const validKey = function(key) {

}

const generateKey = function(kind) {

}

// DO NOT EDIT BELOW THIS LINE

["000", "111", "222"].forEach(e => {
  console.assert(validKey(`${e}-7777777`), "valid first section of 10-digit key marked as invalid")
});

[4,5,6,7,8,9].forEach(e => {
  console.assert(!validKey(`${e * 111}-7777777`), "invalid first section of 10-digit key marked as valid")
});

console.assert(!validKey(`111-7777068`), "invalid last digit of 10-digit key marked as valid")
console.assert(!validKey(`111-7777059`), "invalid last digit of 10-digit key marked as valid")

console.assert(!validKey("`111-7777775"), "invalid last segment of 10-digit key marked as valid");

console.assert(validKey("13796-OEM-0134373-37984"), "valid oem key marked as invalid");
console.assert(!validKey("37302-OEM-0683774-44111"), "oem key with invalid day marked as valid");
console.assert(!validKey("20293-OEM-0670672-93055"), "oem key with invalid year marked as valid");
console.assert(!validKey("16796-OEM-4636373-10164"), "oem key without 0 as first digit in 7-digit marked as valid");
console.assert(!validKey("32301-OEM-0940671-30328"), "oem key with 7-digit non-divisible by 7 marked as valid");

console.assert(!validKey("abcdefghijklmnop"), "malformed key marked as valid")

console.assert(validKey(generateKey("ten_digit")));
console.assert(validKey(generateKey("oem")));

var key1 = generateKey("ten_digit");
var key2 = generateKey("ten_digit");
console.assert(key1 != key2);

key1 = generateKey("oem");
key2 = generateKey("oem");
console.assert(key1 != key2);
