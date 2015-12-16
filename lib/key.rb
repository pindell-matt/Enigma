require 'date'
require 'pry'

class KeyGen
  attr_reader :key

  # change name
  def key_map(key)
    a_key = key.to_s[0..1].to_i
    b_key = key.to_s[1..2].to_i
    c_key = key.to_s[2..3].to_i
    d_key = key.to_s[3..-1].to_i
    raw_keys = [a_key, b_key, c_key, d_key]
  end

  def offsets_map(date)
    squared_date = ((date ** 2).to_s)[-4..-1]
    a_offset = squared_date[0].to_i
    b_offset = squared_date[1].to_i
    c_offset = squared_date[2].to_i
    d_offset = squared_date[3].to_i
    raw_offsets = [a_offset, b_offset, c_offset, d_offset]
  end

end

#
# def encrypt(message)
#   # 1. Cut the input string into letters
#   chars = message.split("")
#
#   initial_chars = chars.map do |char|
#     encrypt_letter(char, 50)
#   end
#   puts initial_chars
#   # 2. initial encryption to cipher table
#   # 3. create unique ABCD rotations / Hash table
#   # 4. in groups of 4 - look up new position based on Hash table
#   # 5. Join results back together in one string
# end
# def encrypt(message)
#   encrypted_message = []
#   chars = message.split("")
#   # increase size of rotations to match # of characters in message
#   rotations = rotation_gen
#   4.times do |i|
#     letter = encrypt_letter(chars[i], rotations[i])
#     encrypted_message << letter
#   end
#   encrypted_message.join("")
# end

# def encrypt(message)
#   encrypted_message = []
#   chars = message.split("")
#   rotations = rotation_gen
#   # increase size of rotations to match # of characters in message
#   # until (message.length) == rotations.length
#   rotations.push(rotations[0..(message.length - 4)])
#   rotations.push(rotations[0..(message.length)])
#   # loop until rotations_two.length == message.length?
#   rotations_two = rotations.flatten
#   # require 'pry'
#   # binding.pry
#   (rotations_two.count).times do |i|
#     letter = encrypt_letter(chars[i], rotations_two[i])
#     encrypted_message << letter
#   end
#   encrypted_message.join("")
# end
