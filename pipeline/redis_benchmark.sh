# macos
# 2.6 GHz 6-Core Intel Core i7
# Intel UHD Graphics 630 1536 MB
# 16 GB 2667 MHz DDR4

redis-benchmark -t set -q
# SET: 14166.31 requests per second, p50=1.279 msec

redis-benchmark -t set -P 2 -q
# SET: 28011.21 requests per second, p50=1.279 msec

redis-benchmark -t set -P 3 -q
# SET: 37411.89 requests per second, p50=1.575 msec

redis-benchmark -t set -P 4 -q
# SET: 56242.97 requests per second, p50=1.239 msec

redis-benchmark -t set -P 5 -q
# SET: 73909.83 requests per second, p50=1.191 msec

redis-benchmark -t set -P 6 -q
# SET: 86581.82 requests per second, p50=1.231 msec

redis-benchmark -t set -P 10 -q
# SET: 136798.91 requests per second, p50=1.967 msec

redis-benchmark -t set -P 30 -q
# SET: 275537.19 requests per second, p50=3.263 msec

redis-benchmark -t set -P 50 -q
# SET: 312500.00 requests per second, p50=4.783 msec

redis-benchmark -t set -P 100 -q
# SET: 390624.97 requests per second, p50=8.543 msec

redis-benchmark -t set -P 200 -q
# SET: 408163.25 requests per second, p50=19.327 msec

redis-benchmark -t set -P 500 -q
# SET: 404858.31 requests per second, p50=42.623 msec

redis-benchmark -t set -P 800 -q
# SET: 448430.47 requests per second, p50=48.287 msec

redis-benchmark -t set -P 900 -q
# SET: 450475.31 requests per second, p50=47.999 msec

redis-benchmark -t set -P 1000 -q
# SET: 416666.69 requests per second, p50=48.319 msec
