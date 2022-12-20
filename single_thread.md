# 单线程

Redis 是单线程的。

## 非阻塞 IO & 事件轮询

```ruby
while true
  # select 是操作系统提供的 API，监听用户感兴趣的文件描述符上可读，可写等事件
  # 类似的方法还有 epoll / kqueue
  read_events, write_events = select(read_fds, write_fds, timeout)
  for event in read_events
    handle_read(event.fd)
  end
  for event in write_events
    handle_write(event.fd)
  end
  handle_others() # cron job...
end
```
