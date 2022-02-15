Future<void> main(List<String> arguments) async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  stream = stream.take(5);
  final data = await stream.toList();
  print(data);
}

int callback(int value) {
  return (value + 1) * 2;
}
