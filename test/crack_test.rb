require 'simplecov'
SimpleCov.start
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
    output = ",3p4py9p529k"
    message = ["5", "2", "9", "k"]
    example = Crack.new(output, Date.parse("151212"))

    assert_equal message, example.find_final_rotation_set(output)
  end

  def test_output_cipher_rotations
    output = ",3p4py9p529k"
    expected = [31, 28, 35, 10]
    example = Crack.new(output, Date.parse("151212"))

    assert_equal expected, example.output_cipher_rotations
  end

  def test_rotation_gen
    output = ",3p4py9p529k"
    expected = [-18, -25, 3, 28]
    example = Crack.new(output, Date.parse("151212"))

    assert_equal expected, example.rotation_gen
  end

  def test_crack
    output = ",3p4py9p529k"
    expected = "test ..end.."
    example = Crack.new(output, Date.parse("151212"))

    assert_equal expected, example.crack
  end

  def test_longer_message_crack
    output = "26f3g7pijwizw5b2g3ulvbipgy9pw29k"
    expected = "this is a longer example ..end.."
    example = Crack.new(output, Date.parse("151212"))

    assert_equal expected, example.crack
  end

end
