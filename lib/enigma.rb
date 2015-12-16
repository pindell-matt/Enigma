require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'crack'

class Enigma

  def encrypt(my_message, key = Random.rand(10000..99999), date = Date.today)
    machine = Encryptor.new(my_message, key, date)
    machine.encrypt
  end

  def decrypt(my_message, key = Random.rand(10000..99999), date = Date.today)
    machine = Decryptor.new(my_message, key, date)
    machine.decrypt
  end

  def crack(output, date = Date.today)
    machine = Crack.new(output, date = Date.today)
    machine.decrypt_with_crack
  end

end

e = Enigma.new
puts e.encrypt("..end..", 12345, Date.parse("121212"))
puts e.decrypt("t5dxx5,", 12345, Date.parse("121212"))
puts e.crack("t5dxx5,", Date.parse("121212"))
puts "\n"

d = Enigma.new
puts d.encrypt("test ..end..", 12345)
puts d.decrypt(",3p4py9p529k", 12345)
puts d.crack(",3p4py9p529k")
puts "\n"

a = Enigma.new
puts a.encrypt("i hope this works ..end..", 12345)
puts a.decrypt("0wez7374z7pibaov w9kw.akr", 12345)
puts a.crack("0wez7374z7pibaov w9kw.akr")
