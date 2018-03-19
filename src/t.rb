 # value = "12131212132"

# p value.unpack("V")
# p value.getbyte(0)

def get_int32_le(data, i=0)
    (data.getbyte(i) + data.getbyte(i+1) * 256 +
     data.getbyte(i+2) * 65536 + data.getbyte(i+3) * 16777216)
  end

  # def append_int32_le!(str, *ints)
  #      str ||= ''.force_encoding(BINARY)
  #      ints = ints[0] if ints.size == 1 && Array === ints[0]
  #      i = 0
  #      sz = ints.size
  #      while i < sz
  #        int = ints[i]
  #        str << (int & 255) << ((int>>8) & 255) <<
  #               ((int>>16) & 255) << ((int>>24) & 255)
  #        i += 1
  #      end
  #      str
  #    end

# p get_int32_le(value)

# p append_int32_le!(value, [1,2])

p "Ruby".unpack("C C C C")
v = [82, 117, 98, 121]
p v.pack("C C C C")

p b = "Ruby".unpack("V")
p b.pack("V")
