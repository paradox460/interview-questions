In the 90s, Microsoft used a very simple algorithm for determining validity
of software keys. This applies to Windows 95, Office 95, and NT4, as well as
other software products, such as Encarta.

There are two major types of keys, 10-digit keys and OEM keys.

10-digit keys take the format of `XXX-XXXXXXX`.

The first 3 digits can be any value except repeating digits of 3-9, such as 333, 444, 555...

The second 7 digits have the following restrictions
 - The sum of the digits must be evenly divisible by 7
 - The last digit cannot be 0 or >= 8

OEM keys are a little more complicated.

They take the form of `XXXXX-OEM-XXXXXXX-XXXXX`

The first segment is actually a date. The first 3 digits are a julian or ordinal date, and are a number between 1 and 366. The second 2 digits are a year, between 95 and 03.

The second segment must always be the letters OEM

The third segment is the same as the above 10-digit keys, with one exception: The first digit must be 0.

The fourth segment can be any digits, provided its appropriate length


Task
* Write a function that will check a given CD key thats valid. Your function should support both 10-digit and OEM keycodes

* Write a function that will generate valid keycodes, letting the user choose between OEM and 10-digit keycodes. Make an attempt to have the function generate as random a value as possible.
