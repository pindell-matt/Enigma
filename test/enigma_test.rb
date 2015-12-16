require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test

  def test_key_gen
    key = KeyGen.new.key_map(12345)

    assert_equal [12, 23, 34, 45], key
  end

  def test_offsets_gen
    offset = KeyGen.new.offsets_map((Date.parse("151212")).strftime("%d%m%y").to_i)

    assert_equal [6, 2, 2, 5], offset
  end

  def test_rotations_gen
    e = Enigma.new
    e.encrypt("test ..end..", 12345, Date.parse("151212"))
    rotations = e.rotation_gen

    assert_equal [18, 25, 36, 50], rotations
  end

  def test_rotations_gen
    skip
    e = Encryptor.new("test ..end..", 12345, Date.parse("151212"))
    rotations = e.rotation_gen

    assert_equal [18, 25, 36, 50], rotations
  end

  def test_message_conversion
    e = Enigma.new
    encrypted_name = e.encrypt("horace", 41521, Date.parse("151212"))

    assert_equal "p560kv", encrypted_name
  end

  def test_encrypt_full_message
    e = Enigma.new
    encrypted = e.encrypt("test ..end..", 12345, Date.parse("141108"))

    assert_equal "5 w5j5dqz9dl", encrypted
  end

  def test_decrypt_full_message
   e = Enigma.new
   decrypted = e.decrypt("5 w5j5dqz9dl", 12345, Date.parse("141108"))

   assert_equal "test ..end..", decrypted
  end

  def test_encrypt_message_today
   e = Enigma.new
   encrypted = e.encrypt("hope this works part two ..end..", 41521, Date.today)

   assert_equal "p544f w80o,bz17xxr6gf ,bfqo4vuoz", encrypted
  end

  def test_decrypt_message_today
   e = Enigma.new
   decrypted = e.decrypt("p544f w80o,bz17xxr6gf ,bfqo4vuoz", 41521, Date.today)

   assert_equal "hope this works part two ..end..", decrypted
  end

  def test_encrypt_date_defaults
   e = Enigma.new
   encrypted = e.encrypt("date defaults ..end..", 02666)

   assert_equal "xjflrm3mu3 0.gygyw2gt", encrypted
  end

  def test_decrypt_date_defaults
   e = Enigma.new
   decrypted = e.decrypt("xjflrm3mu3 0.gygyw2gt", 02666)

   assert_equal "date defaults ..end..", decrypted
  end

  def test_encrypt_by_itself
    e = Enigma.new
    message = "..end.."
    expected = "t5dxx5,"

    assert_equal expected, e.encrypt(message, 12345, Date.parse("121212"))
  end

  def test_decrypt_by_itself
    e = Enigma.new
    encrypted_message = "t5dxx5,"
    expected = "..end.."

    assert_equal expected, e.decrypt(encrypted_message, 12345, Date.parse("121212"))
    # e.crack(expected_encrypted, Date.parse("121212"))
  end

  def test_crack_by_itself
    e = Enigma.new
    encrypted_message = "t5dxx5,"
    expected = "..end.."

    assert_equal expected, e.crack(encrypted_message, Date.parse("121212"))
  end

end

# require './lib/enigma'
# > e = Enigma.new
# > my_message = "this is so secret ..end.."
# > output = e.encrypt(my_message)
# => # encrypted message here
# > output = e.encrypt(my_message, 12345, Date.today) #key and date are optional (gen random key and use today's date)
# => # encrypted message here
# > e.decrypt(output, 12345, Date.today)
# => "this is so secret ..end.."
# > e.decrypt(output, 12345) # Date is optional (use today's date)
# => "this is so secret ..end.."

# > e.crack(output, Date.today)
# => "this is so secret ..end.."
# > e.crack(output) # Date is optional, use today's date
# => "this is so secret ..end.."
