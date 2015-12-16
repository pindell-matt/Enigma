require_relative 'key'
require 'date'
require 'pry'

class Encryptor
  attr_reader :message
  attr_accessor :encrypted_message

  def initialize(message, key = Random.rand(10000..99999), date = Date.today)
    @message = message.chars
    @key = key
    @date = date.strftime("%d%m%y").to_i
    @encrypted_message = []
  end

  def encrypt
    rotations = rotation_gen
    message.each_with_index do |char, i|
      letter = encrypt_letter(char, rotations[(i % 4)])
      encrypted_message << letter
    end
    encrypted_message.join("")
  end

  def rotation_gen
    keys = KeyGen.new.key_map(@key)
    offsets = KeyGen.new.offsets_map(@date)
    rotations = [keys, offsets].transpose.map {|rotation| rotation.reduce(:+)}
  end

  def cipher(rotation)
    cipher = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ",", "."]
    rotated_cipher = cipher.rotate(rotation)
    Hash[cipher.zip(rotated_cipher)]
  end

  def encrypt_letter(letter, rotation)
    cipher_lookup = cipher(rotation)
    cipher_lookup[letter]
  end

end

# NEED TO ADD FILE IO
# read a file
# write said file to a variable
# create 2 files
# run program and output product to 2nd created file
