# transaction 事务

## reference

- https://redis.io/docs/manual/transactions/
- https://www.cnblogs.com/kismetv/p/10787228.html

## atomicity 原子性

原子性定义：transaction 中的所有 operation 全部执行成功，否则数据将回滚到 transaction 执行之前的状态。

redis transaction 并不具有原子性，其中的某个 cmd 执行失败的话，其他的 cmd 会继续执行，数据也不会回滚。

## rollback 回滚

redis 不支持回滚。

## optimistic lock check-and-set WATCH

在 transaction 执行之前，通过 watch 方法来监视某些 keys。在 transaction 执行的时候，redis 会检查 watched keys 是否被修改了。如果被改动过，那么 exec 指令会返回 NULL 告知客户端事务执行失败。

WATCH 是乐观锁。

## transaction vs lua script

为了保证原子性，请使用 lua 脚本
