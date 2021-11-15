# Enigma

Robin Dittrich: Final Independent Project

The Enigma machine is a cypher device used in the early to mid 20th century to protect commercial, diplomatic and millitay communication. In this project, I have recreated a more modern form of the same machine, using ruby methods.

## How It Works:

In the files associated with this project, you will find a text file called `message.txt`. In there, you can write a message that you want to be encrypted.

The next step is to open terminal and run the following command line query:

`$ ruby ./lib/encrypt.rb message.txt encrypted.txt`

This will take the message that you have written in `message.txt` and encrypt it into a new file called `encrypted.txt`. If you would like to change the date or key for the code you want to encrypt, you may do so in the `encrypt.rb` file (on line 6) found in the `/lib` folder.

Lastly, to decrypt the message, you or the person you are sending it to will use the following command line query:

`ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818`

This will take the message that you, or another person in `encrypted.txt` and encrypt it into a new file called `decrypted.txt`. If you would like to change the date or key for the code you want to encrypt, you may do so in the command line for argument 3(key) and 4(date) or in the `decrypt.rb` file found in the `/lib` folder.

## Self Assessment

* Functionality (3) : Enigma Class with encrypt and decrypt methods successfully implemented. Encrypt/decrypt command line interfaces successfully implemented.

* Object Oriented Programming (4) : I have implemented either at least one module in a logical manner. I can speak as to how/why modules made sense, why they improve the organization of the code, and the distinction between the a module and inheritance.

* Ruby Conventions and Mechanics (4) : Classes, methods, and variables are well named so that they clearly communicate their purpose. Code is all properly indented and syntax is consistent. No methods are longer than 10 lines long. Most enumerables/data structures chosen are the most efficient tool for a given job, and I can explain why those enumerables/data structures were chosen.

* Test Driven Development (4) : Mocks and/or stubs are used appropriately to ensure two or more of the following: testing is more robust (i.e., testing methods that might not otherwise be tested due to factors like randomness or user input), testing is more efficient, or that classes can be tested without relying on functionality from other classes. Students are able to speak as to how mocks and/or stubs are fulfilling the above conditions. Test coverage metrics show 100% coverage.

* Version Control (4) : A passing project will have a minimum of 30 commits (I have over 50), and uses a pull request workflow that includes related and logical functionality.
