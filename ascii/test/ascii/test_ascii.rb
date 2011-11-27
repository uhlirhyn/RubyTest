require './lib/ascii/ascii.rb'
require 'test/unit'

class TestASCII < Test::Unit::TestCase

   def test_ascii
        assert_equal(ASCII.shift("1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5",7),"*CDC is the trademark of the Control Data Corporation.")
        assert_equal(ASCII.shift("1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5",7),"*IBM is a trademark of the International Business Machine Corporation.")
        assert_equal(ASCII.shift("1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5",7),"*DEC is the trademark of the Digital Equipment Corporation.")
   end

   def test_ascii_negative
        assert_equal(ASCII.shift(0.chr, 1), 255.chr)
        assert_equal(ASCII.shift(0.chr, 256), 0.chr)
        assert_equal(ASCII.shift(5.chr, 1), 4.chr)
        assert_equal(ASCII.shift(5.chr, 257), 4.chr)
   end

end

