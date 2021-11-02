import 'dart:async';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io' as io;

void main(List<String> arguments) {
  // useFuture2();
  // useStream3();
  startServer();
  // readFile();
}

void useFuture1() {
  print('before future');
  fetchUser(5).then((value) {
    value['processed'] = 'true';
    return value;
  })
      .then((value) => print(value))
  .catchError((e) {
    print(e);
  });
  print('after future');
}

void useFuture2() async {
  print('before future');
  var result = await fetchUser(2);
  print(result);
  print('after future');
}


// Future - value or error in future
Future<Map<String, String>> fetchUser(int userId) async {
  // return Future.delayed(Duration(seconds: 1), () => {'id' : userId.toString(), 'name' : 'Max'});
  
  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));
  var map = json.decode(response.body) as Map;
  return {'id': map['id'].toString(), 'name': map['name']};
}

void useStream1() async {
  var stream = streamOfInts().where((number) => number < 2000).take(2);
  print(stream);
  await for (int number in stream) {
    print(number);
  }
}

void useStream2() {
  streamOfInts().skip(2).listen((number) { print(number); });
}

void useStream3() {
  streamControllerExample().skip(2).listen((number) { print(number); });
}

// Stream
Stream<int> streamOfInts() async* {
  for (var i = 0; i < 5; i++) {
    var randomNumber = Random().nextInt(3000);
    await Future.delayed(Duration(milliseconds: randomNumber));
    yield randomNumber;
  }
}


void readFile() async {
  var content = io.File('bin/file.txt').openRead();

  // 1
  // var stream = content.transform(utf8.decoder).transform(LineSplitter());
  // await for (var line in stream) {
  //   print(line);
  // }

  // 2 Stream to Future
  // var lines = await content.transform(utf8.decoder).transform(LineSplitter()).toList();
  // print(lines);

  // 3 Transform existing stream
  var lines = await transformedFileContent(content.transform(utf8.decoder).transform(LineSplitter())).toList();
  print(lines);
}

Stream<String> transformedFileContent(Stream<String> stream) async* {
  await for (var line in stream) {
    yield '==> $line';
  }
}

// StreamController

Stream<int> streamControllerExample() {
  var controller = StreamController<int>();
  controller.sink.add(Random().nextInt(1000));
  controller.add(Random().nextInt(1000));
  controller.add(Random().nextInt(1000));

  // controller.onListen()

  return controller.stream;
}

void startServer() async {
  var server = await io.HttpServer.bind('localhost', 4444);
  server.listen((io.HttpRequest request) {
    request.response.write('Hello from dart async example');
    request.response.close();
  });
}