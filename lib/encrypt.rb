require './lib/enigma'

enigma = Enigma.new
message = File.readlines(ARGV[0], chomp: true).join(" ") #Terminal command line object 1
output = File.open(ARGV[1], "w") #Terminal command line object 2
encryption = enigma.encrypt(message, "82648", "240818")
File.open(output, "w") do |file|
  file.puts encryption[:encryption]
  puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
end
