require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_it_exists
    assert Encryptor
  end

  def test_encrypt_1char
    message = "t"
    expected = "5"
    example = Encryptor.new(message, 12345, Date.parse("141108"))

    assert_equal expected, example.encrypt
  end

  def test_encrypt_2char
    message = "te"
    expected = "5 "
    example = Encryptor.new(message, 12345, Date.parse("141108"))

    assert_equal expected, example.encrypt
  end

  def test_encrypt_1word
    message = "test"
    expected = "5 w5"
    example = Encryptor.new(message, 12345, Date.parse("141108"))

    assert_equal expected, example.encrypt
  end

  def test_encrypt_1word_alt_key
    message = "test"
    expected = "94qx"
    example = Encryptor.new(message, 55676, Date.parse("141108"))

    assert_equal expected, example.encrypt
  end

  def test_encrypt_full_message_with_end
    message = "test ..end.."
    expected = "5 w5j5dqz9dl"
    example = Encryptor.new(message, 12345, Date.parse("141108"))

    assert_equal expected, example.encrypt
  end

  def test_encrypt_message_today
    skip
   e = Enigma.new
   encrypted = e.encrypt("hope this works part two ..end..", 41521, Date.today)

   assert_equal "p544f w80o,bz17xxr6gf ,bfqo4vuoz", encrypted
  end

  def test_encrypt_date_defaults
    skip
   e = Enigma.new
   encrypted = e.encrypt("date defaults ..end..", 02666)

   assert_equal "xjflrm3mu3 0.gygyw2gt", encrypted
  end

end
