Future<void> main(List<String> arguments) async {
  final interval = Duration(seconds: 1);
  var stream = Stream<int>.periodic(interval, callback);
  // Mais de um Listener
  stream = stream.asBroadcastStream();
  stream = stream.take(10);

  stream.listen((numero) {
    print(numero);
  });

  stream.listen((numero) {
    print(numero);
  });

  print('fim');
}

int callback(int value) {
  return (value + 1) * 2;
}
