require './lib/enigma'

encrypted_file = ARGV[0]
decrypted_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]

encrypted_message = File.read(encrypted_file)
decrypt_hash = Enigma.new.decrypt(encrypted_message, key, date = Enigma.new.today)

File.write(decrypted_file, decrypt_hash[:decryption])

puts "Created '#{decrypted_file}' with the key #{decrypt_hash[:key]} and date #{decrypt_hash[:date]}"

