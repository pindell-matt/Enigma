require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require_relative '../lib/key'

class KeyGenTest < Minitest::Test

  def test_it_exists
    assert KeyGen
  end

  def test_key_gen
    submitted = 12345
    expected = [12, 23, 34, 45]
    key = KeyGen.new.key_map(submitted)

    assert_equal expected, key
  end

  def test_key_gen_string
    submitted = "99378"
    expected = [99, 93, 37, 78]
    key = KeyGen.new.key_map(submitted)

    assert_equal expected, key
  end

  def test_key_gen_string_with_zero
    submitted = "02340"
    expected = [2, 23, 34, 40]
    key = KeyGen.new.key_map(submitted)

    assert_equal expected, key
  end

  def test_offsets_gen_current_year
    date = (Date.parse("151212")).strftime("%d%m%y").to_i
    expected = [6, 2, 2, 5]
    offsets = KeyGen.new.offsets_map(date)

    assert_equal expected, offsets
  end

  def test_offsets_gen_past_year
    date = (Date.parse("011212")).strftime("%d%m%y").to_i
    expected = [2, 4, 0, 1]
    offsets = KeyGen.new.offsets_map(date)

    assert_equal expected, offsets
  end

end
