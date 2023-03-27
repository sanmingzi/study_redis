# study_redis

- concurrent lock 分布式锁

  在集群环境中，由于主从是异步同步的，如果主从数据不一致的话，分布式锁会出问题。

- [bloom filter 布隆过滤器](./bloom_filter/bloom_filter.md)

  布隆过滤器通过 hash 算法来判断某个元素是否从未出现过，或者可能出现过（存在误判）。

- persistence 持久化
  - [snapshot 快照](./persistence/snapshot.md)

    snapshot 利用 copy on write 技术来实现全量持久化。子进程和父进程共享内存也。子进程负责将 snapshot 写入磁盘。当父进程需要修改数据的时候，才会 copy 该内存也。该方法无法做到实时持久化。

  - [AOF append only file](./persistence/aof.md)

    父进程将操作日志写入 AOF 文件，子进程负责重写 AOF 文件，为其瘦身。当 redis 重启的时候通过 replay AOF 来重新加在数据。该方法几乎能够实时持久化，缺点是 AOF 文件可能会比较大。

- [expiry strategy 过期策略](./expiry_strategy/expiry_strategy.md)

  redis 通过定时扫描来清理 expired keys。如果同时有大量 keys 过期的话，扫描操作会占用 redis 的主线程，导致无法处理 client 发过来的 request。所以设置大量 keys 同时过期的话，一定要给一个范围。

- [pipeline 管道](./pipeline/pipeline.md)

  redis pipeline 是在 redis client 实现的，改变 write(request)-read(response) 顺序，将同步调用变成异步调用，从而减少等待 response 时间，来提高性能。

- [transaction 事务](./transaction/transaction.md)

  redis 的事务并不具备原子性，有可能出现部分 cmd 执行成功的情况。为了保证原子性，请使用 lua script。
