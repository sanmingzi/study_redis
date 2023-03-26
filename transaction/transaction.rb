require "redis"
require "byebug"

r = Redis.new
r.set("foo", "foo")

begin
  resps = r.multi do |transaction|
    transaction.set("bar", "bar") # succ
    transaction.incr("foo") # fail
    transaction.set("foo", 0) # succ
  end
rescue => e
  puts "transaction error: #{e.message}"
end

puts resps.inspect
puts r.get("bar")
puts r.get("foo")
# output:
# transaction error: ERR value is not an integer or out of range
# nil
# bar
# 0
