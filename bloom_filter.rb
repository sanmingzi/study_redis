class BloomFilter
  BIT_SIZE = 10 ** 6 + 7

  def initialize
    @hited_value = 0
  end

  def insert(obj)
    bit1 = hash1(obj)
    @hited_value |= (1 << bit1)
  end

  def exist?(obj)
    bit1 = hash1(obj)
    ((1 << bit1) & @hited_value) != 0
  end

  private

  def hash1(obj)
    obj.hash.abs % BIT_SIZE
  end
end

bf = BloomFilter.new

count = 0
for i in 0...10000 do
  if bf.exist? i
    puts "#{i} exist"
    count += 1
  end
  bf.insert(i)
end
puts "wrong judge count #{count}"
