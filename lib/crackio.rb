require_relative '../lib/crack'

file_cracker = Crack.new((File.read(ARGV[0])))
crack_file = file_cracker.crack # encrypt file contents and assign file to a variable
File.write(ARGV[1], crack_file) # run program and output product to 2nd created file

puts "Created '#{ARGV[1]}' with the key '#{crack_file.instance_variable_get(:@key)}' and date #{crack_file.instance_variable_get(:@date)}"
