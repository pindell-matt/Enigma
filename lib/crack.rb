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

  # provides output's final complete set of ABCD
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

  # def decrypt_with_crack
  #   range = (-4-remainder)..(-1-remainder)
  #   cracked_rotations = [@stnrd_end_cipher[range], output_cipher_rotations].transpose.map {|rotation| rotation.reduce(:-)}
  #   cracking = output.chars
  #   decrypted_message = []
  #   cracking.each_with_index do |char, i|
  #     letter = decrypt_letter(char, cracked_rotations[(i % 4)])
  #     decrypted_message << letter
  #   end
  #   decrypted_message.join("")
  # end

  def rotation_gen
    range = (-4-remainder)..(-1-remainder)
    [@stnrd_end_cipher[range], output_cipher_rotations].transpose.map {|rotation| rotation.reduce(:-)}
  end

  def crack
    rotations = rotation_gen
    message = output.chars
    # binding.pry
    message.each_with_index do |char, i|
      letter = decrypt_letter(char, rotations[(i % 4)])
      decrypted_message << letter
    end
    decrypted_message.join("")
  end

end

# message: "test ..end.."
# e = Crack.new(",3p4py9p529k,")
# puts e.find_final_rotation(",3p4py9p529k,")
# puts "\nFinal complete four"
# puts e.find_final_rotation_set(",3p4py9p529k,")
# puts "\nStndrd Output Cipher"
# puts e.output_cipher_rotations
# puts "\nOutput Rotations"
# # puts e.generate_crack_rotations
# puts "\n"
# puts e.decrypt_with_crack
#
# a = Crack.new("wez7374z7pibaov w9kw.akr", Date.today)
# puts a.decrypt_with_crack
