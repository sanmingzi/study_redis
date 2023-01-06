# AOF (append only file)

https://www.cnblogs.com/GrimMjx/p/10695512.html

```
bgrewriteaof
# Background append only file rewriting started
```

将客户端的更新指令存储到日志操作文件中。大致流程如下：
- 父进程收到客户端的请求 - 处理请求 - 将请求日志放入 AOF 缓冲区 - (fsync) 内核将缓冲区的内容写入 AOF 文件
- 子进程会不断地重写 AOF 文件，给 AOF 文件进行瘦身
- redis 重启的时候可以通过 AOF 来进行恢复

优点：
- 几乎能够做到实时持久化（可能会丢失 1s 左右的数据，因为 fsync 比较消耗 io 性能，所以 redis 大概 1s 调用一次 fsync）

缺点：
- AOF 文件比 RDB 文件大
