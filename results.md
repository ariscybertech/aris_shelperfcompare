# Results
## 2014-03-14

* Dart VM version: 1.3.0-dev.3.2 (Mon Mar 10 11:06:13 2014) on "macos_x64"
* Shelf @ v0.2.0
* Using 'wrk' with default settings: 10 seconds, 2 threads
    * wrk 3.1.0 [kqueue] Copyright (C) 2012 Will Glozer

## dart:io basic

    Running 10s test @ http://localhost:8080
      2 threads and 10 connections
      Thread Stats   Avg      Stdev     Max   +/- Stdev
        Latency   474.76us   45.90us   2.44ms   95.78%
        Req/Sec    10.90k   651.27    11.89k    60.33%
      206705 requests in 10.00s, 13.60MB read
    Requests/sec:  20671.58
    Transfer/sec:      1.36MB

## Shelf with sync response

    Running 10s test @ http://localhost:8081
      2 threads and 10 connections
      Thread Stats   Avg      Stdev     Max   +/- Stdev
        Latency   609.78us   35.47us   1.07ms   96.23%
        Req/Sec     8.49k   447.82     9.22k    64.91%
      161277 requests in 10.00s, 14.46MB read
    Requests/sec:  16128.20
    Transfer/sec:      1.45MB

## Shelf with new Future(...)

    Running 10s test @ http://localhost:8082
      2 threads and 10 connections
      Thread Stats   Avg      Stdev     Max   +/- Stdev
        Latency   612.41us   37.85us   1.14ms   96.71%
        Req/Sec     8.51k   459.65     9.22k    62.77%
      160691 requests in 10.00s, 14.41MB read
    Requests/sec:  16069.78
    Transfer/sec:      1.44MB

## Shelf with new Future.value

    Running 10s test @ http://localhost:8083
      2 threads and 10 connections
      Thread Stats   Avg      Stdev     Max   +/- Stdev
        Latency   611.20us   37.31us   1.39ms   96.32%
        Req/Sec     8.52k   456.84     9.22k    61.91%
      161057 requests in 10.00s, 14.44MB read
    Requests/sec:  16106.21
    Transfer/sec:      1.44MB
