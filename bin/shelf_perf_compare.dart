library shelf_perf_compare;

import 'dart_io_runner.dart' as io;
import 'package:shelf_perf_compare/shared.dart';
import 'package:shelf_perf_compare/shelf_runner.dart' as shelf;

void main() {
  startServer(io.serveStream);
  startServer(io.serveBytes);
  startServer(io.serveString);

  startServer(shelf.syncResponse);
  startServer(shelf.syncStreamResponse);
  startServer(shelf.futureResponse);
  startServer(shelf.futureValueResponse);
}
