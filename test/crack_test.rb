require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require_relative '../lib/crack'

class CrackTest < Minitest::Test

  def test_it_exists
    assert Crack
  end

  def test_find_final_rotation_set
    output = ",3p4py9p529k,"
    message = ["5", "2", "9", "k"]
    example = Crack.new(output, Date.parse("151212"))
    assert_equal message, example.find_final_rotation_set(output)
  end

  def test_output_cipher_rotations
    output = ",3p4py9p529k,"
    expected = [31, 28, 35, 10]
    example = Crack.new(output, Date.parse("151212"))

    assert_equal expected, example.output_cipher_rotations
  end

  def test_decrypt_with_crack
    output = ",3p4py9p529k,"
    expected = "test ..end.."
    example = Crack.new(output, Date.parse("151212"))

    assert_equal expected, example.decrypt_with_crack
  end

end
