require_relative 'key'
require_relative 'encryptor'
require 'date'
require 'pry'

class Decryptor < Encryptor
  attr_reader :message
  attr_accessor :decrypted_message

  def initialize(message, key = Random.rand(10000..99999), date = Date.today)
    @message = message.chars
    @key = key
    @date = date.strftime("%d%m%y").to_i
    @decrypted_message = []
  end

  # reverses rotor and decrypts encrypted message
  def decrypt
    rotations_one = rotation_gen
    rotations = rotations_one.map do |rotation|
      rotation * (-1)
    end
    message.each_with_index do |char, i|
      letter = decrypt_letter(char, rotations[(i % 4)])
      decrypted_message << letter
    end
    decrypted_message.join("")
  end

  # decrypt individual letter
  def decrypt_letter(letter, rotation)
    cipher_lookup = cipher(rotation)
    cipher_lookup[letter]
  end

  # def rotation_gen
  #   keys = KeyGen.new.key_map(@key)
  #   offsets = KeyGen.new.offsets_map(@date)
  #   rotations = [keys, offsets].transpose.map {|rotation| rotation.reduce(:+)}
  # end
  #
  # def cipher(rotation)
  #   cipher = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ",", "."]
  #   rotated_cipher = cipher.rotate(rotation)
  #   Hash[cipher.zip(rotated_cipher)]
  # end

end
