import 'dart:async';

Future<void> main(List<String> arguments) async {
  print("Inicio Stream Controller");

  // Controlador da Stream
  final streamController = StreamController<int>.broadcast();

  //  Porta de entrada
  final inStream = streamController.sink;

  // Porta de saida
  final outStream = streamController.stream;

  // Condições na nossa porta de saida
  outStream
      .skip(1)
      .where((numero) => numero % 2 == 0)
      .map((numero) => "numero $numero")
      .listen((strConvertida) {
    print('String recebida');
    print(strConvertida);
  });

  var numeros = List.generate(20, (index) => index);

  for (var numero in numeros) {
    print(numero);

    //Adicionando um evento na stream
    inStream.add(numero);

    await Future.delayed(Duration(milliseconds: 500));
  }

  print("Fim da Stream Controller");
  await streamController.close();
}
