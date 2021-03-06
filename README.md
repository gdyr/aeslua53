[![Build Status](https://travis-ci.org/gmichael225/aeslua53.svg?branch=master)](https://travis-ci.org/gmichael225/aeslua53)

AES for Lua 5.3
-----------

This library contains an implementation of AES in Lua 5.3.
It is based on Matthias Hilbig's aeslua, which made use of the "bitlib" library, but has been updated to use Lua 5.3's native bitwise operators.

Usage
-----

aeslua provides a simple API to encrypt and decrypt lua strings.

To encrypt the string "secret" with the password "password" use:

require("aeslua");
cipher = aeslua.encrypt("password", "secret");

and to decrypt the string again:

plain = aeslua.decrypt("password", cipher);

You can also specify the key size and the encryption mode. For further examples
look into the file src/testcryptotest.lua.

To use AES directly, have a look at aes.lua and at the example usage in 
testaes.lua.

Speed
-----

The implementation is rather optimized (it uses tables for most AES operations) 
but still cannot compete with AES written in other languages. Typical AES 
implementations reach several 100 MBit per second, this implementation only 
reaches ~500 kBit per second.

So if you need to encrypt much data with AES, do yourself a favor and use a 
C-Implementation. But if you only need to encrypt short strings and you have 
no control over the lua environment, use this library!
