# 快照

https://www.cnblogs.com/GrimMjx/p/10695512.html

```
bgsave
# Background saving started
```

redis 是单线程处理程序，这个单线程要负责多个客户端套接字的并发读写以及内存数据结构的逻辑读写。redis 使用了操作系统的 COW (copy on write) 来实现数据的持久化。

redis 在持久化的时候会 fork 出一个子进程来处理持久化。该子进程暂时和父进程享用相同的内存空间。不过，子进程不会修改内存数据，只会不断遍历并且将数据写入磁盘中。而父进程仍然需要处理客户端的请求，如果当父进程在修改到某一块内存页的时候，才会 copy 该内存页，然后在新的内存页上进行修改。

优点：
- 全量备份
- 恢复速度快（比 AOF 快）

缺点：
- 无法做到实时持久化
- 版本兼容 RDB 格式问题