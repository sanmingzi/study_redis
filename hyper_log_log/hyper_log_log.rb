MAX = 2 ** 64 - 1

class HyperLogLog
  NUMBER_OF_BUCKETS = 2 ** 10

  def initialize
    @buckets = Array.new(NUMBER_OF_BUCKETS, 0)
  end

  def insert(num)
    index = num & (NUMBER_OF_BUCKETS - 1)
    num >>= 10
    num = num == 0 ? 1 : low_bits(num)
    @buckets[index] = [num, @buckets[index]].max
  end

  def cal_count
    not_zero_buckets = @buckets.select { |num| num > 0 }
    num_of_not_zero = not_zero_buckets.size
    avg = num_of_not_zero / (not_zero_buckets.sum { |num| 1.0 / num })
    num_of_not_zero * avg / 0.7
  end

  private

  def low_bits(x)
    x & -x
  end

  def low_zeros(x)
    # 64 - 14
    return 50 if 0 == x
    # 4 & -4
    # 0100 & 1100
    # 4
    return Math.log(x & -x, 2)
  end
end


for i in 1..10 do
  hyper_log_log = HyperLogLog.new

  uniq_arr = (10000 * i).times.map { rand(1..MAX) }.uniq
  puts uniq_arr.count

  uniq_arr.each { |x| hyper_log_log.insert(x) }
  puts hyper_log_log.cal_count
  puts "#{i}-----------"
end
