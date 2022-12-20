# 限流

## 漏斗限流

[funnel.rb](./funnel.rb)

把限流器想象成一个漏斗，漏斗的容量是有限的，如果短时间大量灌水，必然会导致溢出，此时就应该对流量进行限制。同时，漏斗会随时间不断的漏水，这样就会不断地多处新的空间，新的水就能够进来。这就是漏斗限流的原理。

## Redis-Cell

https://github.com/brandur/redis-cell

```
cl.throttle test 1 1 1
```
