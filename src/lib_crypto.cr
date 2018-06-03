# Patch LibCrypto to support more algorithms for pbkdf2 (specifically needed sha256)
lib LibCrypto
  fun pkcs5_pbkdf2_hmac = PKCS5_PBKDF2_HMAC(pass : LibC::Char*, passlen : LibC::Int, salt : UInt8*, saltlen : LibC::Int, iter : LibC::Int, digest : EVP_MD, keylen : LibC::Int, out : UInt8*) : LibC::Int
end
