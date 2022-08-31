# study_redis

## concurrent lock

```
set key value ex 5 nx
```

- 并发锁
- 可重入锁

支持同一个线程多次加锁
