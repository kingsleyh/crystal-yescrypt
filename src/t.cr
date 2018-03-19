# https://github.com/funny-falcon/bin_utils
# def get_int32_le(data, i=0)
#     a = (data.bytes[0] + data.bytes[i+1] * 256 +
#      data.bytes[i+2] * 65536 + data.bytes[i+3] * 16777216)
# p a
#      a
#   end
#
#  value = "12131212132"
#
# require "big"
#
# p (BigInt.new(value.bytes[0] + value.bytes[0+1]) * 256 + BigInt.new(value.bytes[0+2]) * 65536 + BigInt.new(value.bytes[0+3]) * 16777216)

# p get_int32_le(value)

# p v =  "Ruby".to_slice
# p String.new(v)

# p b = UInt64.slice("Ruby".to_slice)

class SimpleSliceIO < IO
  def initialize(@slice : Bytes)
  end

  def read(slice : Bytes)
    slice.size.times { |i| slice[i] = @slice[i] }
    @slice += slice.size
    slice.size
  end

  def write(slice : Bytes)
    slice.size.times { |i| @slice[i] = slice[i] }
    @slice += slice.size
    nil
  end
end

p slice = Slice.new(9) { |i| ('a'.ord + i).to_u8 }
p Slice.new(1) { "Ruby".to_slice }
p String.new(slice) # => "abcdefghi"

io = SimpleSliceIO.new(slice)
p io.gets(3) # => "abc"
io.print "xyz"
p String.new(slice) # => "abcxyzghi"
