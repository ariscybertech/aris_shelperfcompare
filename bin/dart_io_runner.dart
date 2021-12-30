library perf.dart_io;

import 'dart:io';
import 'dart:isolate';

import 'package:shelf_perf_compare/shared.dart';

void main() {
  startServer(serveStream);
  startServer(serveBytes);
  startServer(serveString);
}


void serveStream([SendPort port]) {
  var printFunc = getPrintFunc(port);
  HttpServer.bind(listeningAddress, 0).then((server){
    printFunc('${server.address.host}:${server.port}\tdart:io Stream');
    server.serverHeader = 'dart:io server';
    server.listen((HttpRequest request) {
      request.response.headers.date = new DateTime.now().toUtc();
      getHelloWorldStream().pipe(request.response);
    });
  });
}

void serveBytes([SendPort port]) {
  var printFunc = getPrintFunc(port);
  HttpServer.bind(listeningAddress, 0).then((server){
    printFunc('${server.address.host}:${server.port}\tdart:io Bytes');
    server.serverHeader = 'dart:io server';
    server.listen((HttpRequest request) {
      request.response.headers.date = new DateTime.now().toUtc();
      request.response.add(BYTES);
      request.response.close();
    });
  });
}

void serveString([SendPort port]) {
  var printFunc = getPrintFunc(port);
  HttpServer.bind(listeningAddress, 0).then((server){
    printFunc('${server.address.host}:${server.port}\tdart:io String');
    server.serverHeader = 'dart:io server';
    server.listen((HttpRequest request) {
      request.response.headers.date = new DateTime.now().toUtc();
      request.response.write(HELLO_WORLD);
      request.response.close();
    });
  });
}
