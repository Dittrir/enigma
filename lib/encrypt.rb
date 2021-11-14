require './lib/enigma'

enigma = Enigma.new
message = File.open(ARGV[0], chomp: true)
output = File.open(ARGV[1], 'w')
encryption = enigma.encrypt("hello world", "02715", "040895")
key = enigma.key
date = enigma.date
File.open(output, "w") do |file|
  file.puts encryption[:encryption]
  puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
end
