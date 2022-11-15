require './lib/enigma'

encrypted_file  = ARGV[0]
cracked_file    = ARGV[1]
date            = ARGV[2]

enigma = Enigma.new
encrypted_message = File.read(encrypted_file)
crack_hash = enigma.crack(encrypted_message, date)

File.write(cracked_file, crack_hash[:decryption])
puts "Created '#{cracked_file}' with the key #{crack_hash[:key]} and date #{crack_hash[:date]}"