require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_it_exists
    assert Encryptor
  end

  def test_rotation_gen
    message = "test"
    expected = [12, 32, 43, 51]
    example = Encryptor.new(message, 12345, Date.parse("141108"))

    assert_equal expected, example.rotation_gen
  end

  def test_rotation_gen_class_example
    message = "test"
    expected = [50, 17, 54, 26]
    example = Encryptor.new(message, 41521, Date.parse("150302"))

    assert_equal expected, example.rotation_gen
  end

  def test_cipher_zero_rotation
    message = "test"
    rotation = 0
    expected = {"a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e",
                "f"=>"f", "g"=>"g", "h"=>"h", "i"=>"i", "j"=>"j",
                "k"=>"k", "l"=>"l", "m"=>"m", "n"=>"n", "o"=>"o",
                "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t",
                "u"=>"u", "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y",
                "z"=>"z", "0"=>"0", "1"=>"1", "2"=>"2", "3"=>"3",
                "4"=>"4", "5"=>"5", "6"=>"6", "7"=>"7", "8"=>"8",
                "9"=>"9", " "=>" ", ","=>",", "."=>"."}
    example = Encryptor.new(message, 41521, Date.parse("150302"))

    assert_equal expected, example.cipher(rotation)
  end

  def test_cipher_one_rotation
    message = "test"
    rotation = 1
    expected = {"a"=>"b", "b"=>"c", "c"=>"d", "d"=>"e", "e"=>"f",
                "f"=>"g", "g"=>"h", "h"=>"i", "i"=>"j", "j"=>"k",
                "k"=>"l", "l"=>"m", "m"=>"n", "n"=>"o", "o"=>"p",
                "p"=>"q", "q"=>"r", "r"=>"s", "s"=>"t", "t"=>"u",
                "u"=>"v", "v"=>"w", "w"=>"x", "x"=>"y", "y"=>"z",
                "z"=>"0", "0"=>"1", "1"=>"2", "2"=>"3", "3"=>"4",
                "4"=>"5", "5"=>"6", "6"=>"7", "7"=>"8", "8"=>"9",
                "9"=>" ", " "=>",", ","=>".", "."=>"a"}
    example = Encryptor.new(message, 41521, Date.parse("150302"))

    assert_equal expected, example.cipher(rotation)
  end

  def test_cipher_ten_rotation
    message = "test"
    rotation = 10
    expected = {"a"=>"k", "b"=>"l", "c"=>"m", "d"=>"n", "e"=>"o",
                "f"=>"p", "g"=>"q", "h"=>"r", "i"=>"s", "j"=>"t",
                "k"=>"u", "l"=>"v", "m"=>"w", "n"=>"x", "o"=>"y",
                "p"=>"z", "q"=>"0", "r"=>"1", "s"=>"2", "t"=>"3",
                "u"=>"4", "v"=>"5", "w"=>"6", "x"=>"7", "y"=>"8",
                "z"=>"9", "0"=>" ", "1"=>",", "2"=>".", "3"=>"a",
                "4"=>"b", "5"=>"c", "6"=>"d", "7"=>"e", "8"=>"f",
                "9"=>"g", " "=>"h", ","=>"i", "."=>"j"}
    example = Encryptor.new(message, 41521, Date.parse("150302"))

    assert_equal expected, example.cipher(rotation)
  end

  def test_cipher_negative_one_rotation
    message = "test"
    rotation = -1
    expected = {"a"=>".", "b"=>"a", "c"=>"b", "d"=>"c", "e"=>"d",
                "f"=>"e", "g"=>"f", "h"=>"g", "i"=>"h", "j"=>"i",
                "k"=>"j", "l"=>"k", "m"=>"l", "n"=>"m", "o"=>"n",
                "p"=>"o", "q"=>"p", "r"=>"q", "s"=>"r", "t"=>"s",
                "u"=>"t", "v"=>"u", "w"=>"v", "x"=>"w", "y"=>"x",
                "z"=>"y", "0"=>"z", "1"=>"0", "2"=>"1", "3"=>"2",
                "4"=>"3", "5"=>"4", "6"=>"5", "7"=>"6", "8"=>"7",
                "9"=>"8", " "=>"9", ","=>" ", "."=>","}
    example = Encryptor.new(message, 41521, Date.parse("150302"))

    assert_equal expected, example.cipher(rotation)
  end

  def test_cipher_negative_one_rotation
    message = "test"
    rotation = -10
    expected = {"a"=>"3", "b"=>"4", "c"=>"5", "d"=>"6", "e"=>"7",
                "f"=>"8", "g"=>"9", "h"=>" ", "i"=>",", "j"=>".",
                "k"=>"a", "l"=>"b", "m"=>"c", "n"=>"d", "o"=>"e",
                "p"=>"f", "q"=>"g", "r"=>"h", "s"=>"i", "t"=>"j",
                "u"=>"k", "v"=>"l", "w"=>"m", "x"=>"n", "y"=>"o",
                "z"=>"p", "0"=>"q", "1"=>"r", "2"=>"s", "3"=>"t",
                "4"=>"u", "5"=>"v", "6"=>"w", "7"=>"x", "8"=>"y",
                "9"=>"z", " "=>"0", ","=>"1", "."=>"2"}
    example = Encryptor.new(message, 41521, Date.parse("150302"))

    assert_equal expected, example.cipher(rotation)
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
    message = "hope this works part two ..end.."
    expected = "p544f w80o,bz17xxr6gf ,bfqo4vuoz"
    example = Encryptor.new(message, 41521, Date.today)

   assert_equal expected, example.encrypt
  end

  def test_encrypt_date_defaults
    message = "date defaults ..end.."
    expected = "xjflrm3mu3 0.gygyw2gt"
    example = Encryptor.new(message, 02666)

   assert_equal expected, example.encrypt
  end

end
