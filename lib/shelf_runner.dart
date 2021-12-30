// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library perf.shelf;

import 'dart:async';
import 'dart:isolate';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

import 'shared.dart';

void syncResponse([SendPort port]) {
  _listen('sync - string', _syncHandler, port);
}

void syncStreamResponse([SendPort port]) {
  _listen('sync - stream', (request) {
    return new shelf.Response.ok(getHelloWorldStream());
  }, port);
}

void futureValueResponse([SendPort port]) {
  _listen('new Future.value(response) - string', _futureValueHandler, port);
}

void futureResponse([SendPort port]) {
  _listen('new Future(createResponseFunc)', _futureHandler, port);
}

void _listen(String description, shelf.Handler handler, SendPort port) {
  var printFunc = getPrintFunc(port);

  io.serve(handler, listeningAddress, 0).then((server) {
    printFunc('${server.address.host}:${server.port}\tShelf - $description');
  });
}

shelf.Response _syncHandler(shelf.Request request) => _getResponse();

Future<shelf.Response> _futureValueHandler(shelf.Request request) {
  return new Future.value(_getResponse());
}

Future<shelf.Response> _futureHandler(shelf.Request request) {
  return new Future(_getResponse);
}

shelf.Response _getResponse() => new shelf.Response.ok(HELLO_WORLD);
