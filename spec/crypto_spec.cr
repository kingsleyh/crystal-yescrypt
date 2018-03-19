require "spec"
require "../src/t2.cr"

include Hashing
describe Crypto do
  it "should produce an hmac 256 digest" do
    Crypto.hmac_sha256("key", "message").should eq(Bytes[110, 158, 242, 155, 117, 255, 252, 91, 122, 186, 229, 39, 213, 143, 218, 219, 47, 228, 46, 114, 25, 1, 25, 118, 145, 115, 67, 6, 95, 88, 237, 74])
  end
end
