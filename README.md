# Enigma

Robin Dittrich: Final Independent Project


## Requirements

You are required to build an Enigma class with the methods described below; you may find it useful to create additional classes and/or modules. All classes, modules and methods should have a single responsibility, and should be well organized and readable.


## Enigma Class

Create an Enigma class with the following methods:

Enigma#encrypt(message, key, date)
The encrypt method takes a message String as an argument. It can optionally take a Key and Date as arguments to use for encryption. If the key is not included, generate a random key. If the date is not included, use today’s date.

The encrypt method returns a hash with three keys:

:encryption => the encrypted String
:key => the key used for encryption as a String
:date => the date used for encryption as a String in the form DDMMYY
Enigma#decrypt(ciphertext, key, date)
The decrypt method takes a ciphertext String and the Key used for encryption as arguments. The decrypt method can optionally take a date as the third argument. If no date is given, this method should use today’s date for decryption.

The decrypt method returns a hash with three keys:

:decryption => the decrypted String
:key => the key used for decryption as a String
:date => the date used for decryption as a String in the form DDMMYY


## Interaction Pattern

The Enigma class should respond to the following interaction pattern:

```
pry(main)> require 'date'
#=> true

pry(main)> require './lib/enigma'
#=> true

pry(main)> enigma = Enigma.new
#=> #<Enigma:0x00007ff90f24cb78...>

# encrypt a message with a key and date
pry(main)> enigma.encrypt("hello world", "02715", "040895")
#=>
#   {
#     encryption: "keder ohulw",
#     key: "02715",
#     date: "040895"
#   }

# decrypt a message with a key and date
pry(main) > enigma.decrypt("keder ohulw", "02715", "040895")
#=>
#   {
#     decryption: "hello world",
#     key: "02715",
#     date: "040895"
#   }

# encrypt a message with a key (uses today's date)
pry(main)> encrypted = enigma.encrypt("hello world", "02715")
#=> # encryption hash here

#decrypt a message with a key (uses today's date)
pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
#=> # decryption hash here

# encrypt a message (generates random key and uses today's date)
pry(main)> enigma.encrypt("hello world")
#=> # encryption hash here
```


### Command Line Interface

$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
Created 'decrypted.txt' with the key 82648 and date 240818


## Iteration_4

Cracking
The following is only required for scoring a 4 on functionality

Enigma#crack(ciphertext, date)
The crack method decrypts a message without being given the key. This method can optionally take a date to use for cracking as a second argument. If no date is given, it should use today’s date for cracking. It should output a hash containing the decrypted message, the date used for encryption in the form of DDMMYY, and the Key used for encryption.

We believe that each enemy message ends with the characters " end". Use this to crack the encryption.

The Enigma class should now respond to the following interaction pattern:

```
pry(main)> require 'date'
#=> true

pry(main)> require './lib/enigma'
#=> true

pry(main)> enigma = Enigma.new
#=> #<Enigma:0x00007ff90f24cb78...>

pry(main)> enigma.encrypt("hello world end", "08304", "291018")
#=>
#   {
#     encryption: "vjqtbeaweqihssi",
#     key: "08304",
#     date: "291018"
#   }

# crack an encryption with a date
pry(main)> enigma.crack("vjqtbeaweqihssi", "291018")
#=>
#   {
#     decryption: "hello world end",
#     date: "291018",
#     key: "08304"
#   }

# crack an encryption (uses today's date)
pry(main)> enigma.crack("vjqtbeaweqihssi")
#=>
#   {
#     decryption: "hello world end",
#     date: # todays date in the format DDMMYY,
#     key: # key used for encryption
#   }
```

### Cracking Interface

$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
Created 'cracked.txt' with the cracked key 82648 and date 240818
