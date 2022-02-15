Future<void> main(List<String> arguments) async {
  final interval = Duration(seconds: 1);
  var stream = Stream<int>.periodic(interval, callback);

  stream = stream.skipWhile((int numero) => numero < 10);

  // stream = stream.take(5).skip(2);

  await for (var i in stream) {
    print(i);
  }
}

int callback(int value) {
  return (value + 1) * 2;
}
