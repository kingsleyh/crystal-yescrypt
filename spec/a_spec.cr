require "spec"
require "../src/t2.cr"

N = 1_u64 << 16
R =   1_u32
P =   1_u32
T =   0_u32
G =   0_u32

include Hashing
describe Yescrypt do

  describe "constants" do

    it "should have the correct values for each constant" do
      PWXSIMPLE.should eq(2)
      PWXGATHER.should eq(4)
      PWXROUNDS.should eq(6)
      SWIDTH.should eq(8)

      PWXBYTES.should eq(64)
      PWXWORDS.should eq(16)
      SBYTES.should eq(12288)
      SWORDS.should eq(3072)
      SMASK.should eq(4080)
      RMIN.should eq(1.4921875)

      YESCRYPT_RW.should eq(1)
      YESCRYPT_WORM.should eq(2)
      YESCRYPT_PREHASH.should eq(1048576)
    end

    # describe "calculate" do
    #
    #   it "works" do
    #     y = Yescrypt.new
    #     y.calculate("password", "salt", N, R, P, T, G, 0_u32, 512)
    #
    # end


   describe "kdf_body" do

     it "w" do
       y = Yescrypt.new
       y.kdf_body("password", "salt", N, R, P, T, G, 0_u32, 512)
     end

   end

  end
end
