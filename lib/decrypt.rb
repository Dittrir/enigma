require './lib/enigma'

enigma = Enigma.new
message = ARGV[0] #HOW DO I READ THIS File????
output = File.open(ARGV[1], "w") #Terminal command line object 2
key = ARGV[2]
date = ARGV[3]
decryption = enigma.decrypt("keder ohulw", key, date)
File.open(output, "w") do |file|
  file.puts decryption[:decryption]
  puts "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}"
end
