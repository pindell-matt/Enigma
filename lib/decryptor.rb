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

end
