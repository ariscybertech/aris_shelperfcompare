### Running the test server

```
$> dart bin/shelf_perf_compare.dart
```

You will see a list of each individual server configuration and the listening endpoint.

### Using the observatory

```
$> dart --enable-vm-service bin/shelf_perf_compare.dart
```

### Running a benchmark

Try using [wrk](https://github.com/wg/wrk).

Super nice.

Install via [homebrew](http://brew.sh/): `brew install wrk`
