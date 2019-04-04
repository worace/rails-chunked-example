# README

Trying to reproduce [this post](https://coderwall.com/p/kad56a/streaming-large-data-responses-with-rails).

```
bundle
rails s
curl -v localhost:3000
```

Yields:

```
* Rebuilt URL to: localhost:3000/
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 3000 (#0)
> GET / HTTP/1.1
> Host: localhost:3000
> User-Agent: curl/7.47.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Transfer-Encoding: chunked
< X-Accel-Buffering: no
< Cache-Control: no-cache
< Last-Modified: Thu Apr  4 20:08:44 2019
< Content-Disposition: attachment; filename="file.txt"
< Content-Type: text/html; charset=utf-8
< X-Request-Id: 951323ab-b253-4172-b869-a19ccdec6e6e
< X-Runtime: 0.007914
<
* transfer closed with outstanding read data remaining
* Closing connection 0
curl: (18) transfer closed with outstanding read data remaining

```

With server logs:

```
Started GET "/" for 127.0.0.1 at 2019-04-04 13:09:29 -0700
Processing by ApplicationController#index as */*
before
yield row 0
yield row 1
yield row 2
yield row 3
yield row 4
after
Completed 200 OK in 1ms (ActiveRecord: 0.0ms)
```
