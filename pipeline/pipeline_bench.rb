# ruby 3.0.4p208 (2022-04-12 revision 3fa771dded) [x86_64-darwin22]
# redis (5.0.6)
# redis-client (0.14.0)

# ruby pipeline_bench.rb
# without pipelining 2.740386 seconds
# with pipelining 0.087388 seconds
require "rubygems"
require "redis"

def bench(desc)
  start = Time.now
  yield
  puts "#{desc} #{Time.now - start} seconds"
end

def without_pipilining
  r = Redis.new
  10_000.times do
    r.ping
  end
end

def with_pipelining
  r = Redis.new
  r.pipelined do |pipeline|
    10_000.times do
      pipeline.ping
    end
  end
end

bench("without pipelining") { without_pipilining }
bench("with pipelining") { with_pipelining }
