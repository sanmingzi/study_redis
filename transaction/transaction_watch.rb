require "redis"
require "byebug"

r = Redis.new
r.flushdb
r.set("lock", "unlock")

resp = nil
r.watch("lock")
r.pipelined do |p|
  p.set("lock", "unlock") # change the WATCHED key, the transaction will be failed
  resp = p.multi do |t|
    t.set("foo", "foo")
    t.set("bar", "bar")
  end
end
puts resp.value # nil
puts r.get("foo") # nil
puts r.get("bar") # nil

resp = nil
r.pipelined do |p|
  p.set("lock", "unlock")
  resp = p.multi do |t|
    t.set("foo", "foo")
    t.set("bar", "bar")
  end
end
puts resp.value # OK
puts r.get("foo") # foo
puts r.get("bar") # bar
