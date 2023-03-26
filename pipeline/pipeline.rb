# ruby pipeline.rb
require "rubygems"
require "redis"
require "byebug"

r = Redis.new
r.set("x", 0)

result = r.pipelined do |pipeline|
  pipeline.get("x")
  pipeline.get("x")
end
puts result.inspect
# ["0", "0"]
