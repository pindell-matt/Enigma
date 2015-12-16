require 'date'
require 'pry'

class KeyGen
  attr_reader :key

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
