require './lib/enigma'

message_file    = ARGV[0]
encrypted_file  = ARGV[1]

enigma = Enigma.new
message = File.read(message_file)
encrypt_hash = enigma.encrypt(message)

File.write(encrypted_file, encrypt_hash[:encryption])

puts "Created '#{encrypted_file}' with the key #{encrypt_hash[:key]} and date #{encrypt_hash[:date]}"
