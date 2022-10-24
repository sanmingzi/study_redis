# async job

## use queue (异步任务)

```
rpush queue apple banana pear
lpop queue # apple
lpop queue # banana
lpop queue # pear
```

- 队列空 / 阻塞读

```
blpop / brpop
```

## delay job (延时任务)

zset (有序列表)

将消息序列化成一个字符串作为 zset 的 value，这个消息的到期处理时间作为 score。
然后通过多个线程轮询 zset 获取到期的任务进行处理。多个线程可以保障可用性，但是存在的问题就是多线程争抢任务，需要避免这种情况。

```ruby
Thread.new {
  while true
    value = redis.zget("queue")
    success = redis.zrem("queue", value) # important!!!
    if success
      msg = json.loads(value)
      handle_msg(msg)
    else
      #
    end
  end
}
```

- 优化

上述伪代码中，get / remove 是两个操作，如果有多个线程争抢的话，会出现 get 到了，但是 remove 失败的情况，这样就导致了线程的浪费。可以将这两个操作 get / remove 一同挪到服务器端进行原子化操作。该方法可以使用 lua script 来实现。

- 优缺点

优点
1. 简单，运营成本低，排查问题比较方便

缺点
1. 不能保证消息的可靠性，因为 redis 本身存在丢消息的情况
  - redis 的 AOF 持久化一般是配置成异步的（当然可以配置成同步的，但这样就完全丧失了 redis 内存数据库效率高的优势），所以在持久化之前如果宕机的话，内存中的消息会丢失
  - redis 的主从复制也是异步的，所以在主从切换的时候同样会出现消息丢失的问题
