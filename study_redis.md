# study_redis

## basic cmd

- set & get

```
set name windmill
OK
get name
"windmill"
```

- mget & mset

```
mset name1 windmill1 name2 windmill2
mget name1 name2
1) "windmill1"
2) "windmill2"
```

- expire

```
set name windmill
expire name 3
get name
(nil)

# eq to (set + expire)
setex name 3 windmill
get name
(nil)
```

- setnx (set if not exist)

```
# if name not exist, set it {1: success, 0: fail}
setnx name windmill
(integer) 1
setnx name windmill
(integer) 0
```

- count

```
set age 30
incr age
(integer) 31
incrby age 3
(integer) 34
incrby age -3
(integer) 31
```

- queue

```
rpush books c ruby
(integer) 2
llen books
(integer) 2
lpop books
"c"
lpop books
"ruby"
lpop books
(nil)
```

- stack

```
rpush books c ruby
(integer) 2
rpop books
"ruby"
rpop books
"c"
rpop books
(nil)
```

- hash

```
hset books c c ruby ruby
hlen books
(integer) 2
hgetall books
1) "c"
2) "c"
3) "ruby"
4) "ruby"
hget books c
"c"
hget books ruby
"ruby"

hdel books ruby

# count
hset user age 30
hincrby user age 3
(integer) 33
```

- set

```
sadd books c
(integer) 1 # success
sadd books c
(integer) 0 # failed

sadd books ruby
smembers books
1) "ruby"
2) "c"

# query the value is exist
sismember books c
(integer) 1
sismember books java
(integer) 0

# remove
srem books c
smembers books
1) "ruby"
```

- set

## concurrent lock

```
set key value ex 5 nx
```

- 并发锁
- 可重入锁

支持同一个线程多次加锁
