require './lib/enigma'

enigma = Enigma.new
message = File.readlines(ARGV[0], chomp: true).join(" ") #Terminal message text file
output = File.open(ARGV[1], "w") #Terminal command line object 2
key = ARGV[2] #Terminal command line object 3
date = ARGV[3] #Terminal command line object 4
decryption = enigma.decrypt(message, key, date)
File.open(output, "w") do |file|
  file.puts decryption[:decryption]
  puts "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}"
end
