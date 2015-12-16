require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require_relative '../lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_it_exists
    assert Decryptor
  end

  def test_decrypt_letter
    character = ","
    expected = "t"
    example = Decryptor.new(character, 12345, Date.parse("151212"))

    assert_equal expected, example.decrypt_letter(character, 21)
  end

  def test_decrypt_1char
    character = ","
    expected = "t"
    example = Decryptor.new(character, 12345, Date.parse("151212"))

    assert_equal expected, example.decrypt
  end

  def test_decrypt_2char
    character = ",3"
    expected = "te"
    example = Decryptor.new(character, 12345, Date.parse("151212"))

    assert_equal expected, example.decrypt
  end

  def test_decrypt_3char
    character = "26f"
    expected = "thi"
    example = Decryptor.new(character, 42345, Date.parse("151212"))

    assert_equal expected, example.decrypt
  end

  def test_decrypt_1word_with_end
    message = ",3p4py9p529k"
    expected = "test ..end.."
    example = Decryptor.new(message, 12345, Date.parse("151212"))

    assert_equal expected, example.decrypt
  end

  def test_decrypt_4words_with_end
    message = "0wez7374z7pibaov w9kw.akr"
    expected = "i hope this works ..end.."
    example = Decryptor.new(message, 12345, Date.parse("151212"))

    assert_equal expected, example.decrypt
  end

  def test_decrypt_4words_longer_with_end
    message = "26f3g7pijwizw5b2g3ulvbipgy9pw29k"
    expected = "this is a longer example ..end.."
    example = Decryptor.new(message, 42345, Date.parse("151212"))

    assert_equal expected, example.decrypt
  end

end
