require_relative '../lib/encryptor'

file_encryptor = Encryptor.new((File.read(ARGV[0])))
encrypt_file = file_encryptor.encrypt # encrypt file contents and assign file to a variable
File.write(ARGV[1], encrypt_file) # run program and output product to 2nd created file

puts "Created '#{ARGV[1]}' with the key '#{file_encryptor.instance_variable_get(:@key)}' and date #{file_encryptor.instance_variable_get(:@date)}"
