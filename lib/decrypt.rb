require_relative '../lib/decryptor'
require 'date'
require 'pry'

pre_date = ARGV[3]
date_format = [ARGV[3][4], ARGV[3][5], ARGV[3][2], ARGV[3][3], ARGV[3][0], ARGV[3][1]].join("")
date = Date.parse(date_format)
final_date = date.strftime("%d%m%y").to_i

file_decryptor = Decryptor.new(File.read(ARGV[0]), ARGV[2], (date))
decrypt_file = file_decryptor.decrypt # decrypt file contents and assign file to a variable
File.write(ARGV[1], decrypt_file) # run program and output product to 2nd created file

puts "Created '#{ARGV[1]}' with the key '#{file_decryptor.instance_variable_get(:@key)}' and date #{final_date}"
