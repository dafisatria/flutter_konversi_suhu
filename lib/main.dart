import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputUser = TextEditingController();

  double _inputUser = 0.0;
  double _kelvin = 0.0;
  double _reamour = 0.0;

  void konversiSuhu() {
    setState(() {
      _inputUser = double.parse(inputUser.text);
      _reamour = (4 / 5) * _inputUser;
      _kelvin = 273 + _inputUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              input(inputUser: inputUser),
              result(kelvin: _kelvin, reamour: _reamour),
              convert(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton convert() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: konversiSuhu,
      child: const Text('Konversi Suhu'),
    );
  }
}

class result extends StatelessWidget {
  const result({
    Key? key,
    required double kelvin,
    required double reamour,
  })  : _kelvin = kelvin,
        _reamour = reamour,
        super(key: key);

  final double _kelvin;
  final double _reamour;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Column(
        children: [
          const Text("Suhu dalam Kelvin"),
          Text(
            "$_kelvin",
            style: const TextStyle(fontSize: 40),
          )
        ],
      ),
      Column(
        children: [
          const Text("Suhu dalam Reamor"),
          Text('$_reamour', style: const TextStyle(fontSize: 40))
        ],
      ),
    ]);
  }
}

class input extends StatelessWidget {
  const input({
    Key? key,
    required this.inputUser,
  }) : super(key: key);

  final TextEditingController inputUser;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputUser,
      decoration:
          const InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
