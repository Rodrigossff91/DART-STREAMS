Future<void> main(List<String> arguments) async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);
  stream = stream.takeWhile((int numero) => numero < 10);
  // stream = stream.take(5);

  await for (var i in stream) {
    print(i);
  }
}

int callback(int value) {
  return (value + 1) * 2;
}
