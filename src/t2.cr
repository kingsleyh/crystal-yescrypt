require "openssl"
require "openssl/hmac"
require "openssl/pkcs5"
require "digest"

module Hashing
  PWXSIMPLE = 2
  PWXGATHER = 4
  PWXROUNDS = 6
  SWIDTH    = 8

  PWXBYTES = PWXGATHER * PWXSIMPLE * 8
  PWXWORDS = PWXBYTES / 4
  SBYTES   = 3 * (1 << SWIDTH) * PWXSIMPLE * 8
  SWORDS   = SBYTES / 4
  SMASK    = ((1 << SWIDTH) - 1) * PWXSIMPLE * 8
  RMIN     = (PWXBYTES + 127) / 128.0

  Enum Flags
    Rw
    Worm
    PreHash
  end

  class Yescrypt
    def initialize
      @using_simd = false
    end

    def kdf_body(password : String, salt : String, n : UInt64, r : UInt32, p : UInt32, t : UInt32, flags : Array(Flags), dkLen : UInt21)

      if !flags.empty?
        key = "yescrypt"
        key = key + "-prehash" if flags.include?(Flags::PreHash)
        password = Crypto.hmac_sha256(password, key)
      end

      bytes = 



    end
  end

  class Crypto
    def self.hmac_sha256(key, message)
      OpenSSL::HMAC.digest(:sha256, key, message)
    end
  end

end
