require_relative 'encryptor'
require_relative 'decryptor'
require 'date'
require 'pry'

class Crack < Decryptor
  attr_reader :output, :remainder
  attr_accessor :solved_message

  def initialize(output, date = Date.today)
    @output = output
    @date = date.strftime("%d%m%y").to_i
    @stnrd_end_cipher = [38, 38, 4, 13, 3, 38, 38]
    @remainder = output.length % 4
    @decrypted_message = []
  end

  # finds output's final complete set of ABCD rotations
  def find_final_rotation_set(output)
    cracked = output.chars
    cracked.pop(remainder)
    cracked[-4..-1]
  end

  # generates standard cipher numbers for output (encrypted message)
  def output_cipher_rotations
    abcd = find_final_rotation_set(output)
    cipher = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ",", "."]
    origal_output = abcd.map do |i|
      cipher.index(i)
    end
  end

  # subtracts the output rotations from the standard cipher rotations
  def rotation_gen
    range = (-4-remainder)..(-1-remainder)
    [@stnrd_end_cipher[range], output_cipher_rotations].transpose.map {|rotation| rotation.reduce(:-)}
  end

  # decrypts the output with the generated rotations
  def crack
    rotations = rotation_gen
    (output.chars).each_with_index do |char, i|
      letter = decrypt_letter(char, rotations[(i % 4)])
      decrypted_message << letter
    end
    decrypted_message.join("")
  end

end
