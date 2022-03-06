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
              TextFormField(
                controller: inputUser,
                decoration: const InputDecoration(
                    hintText: 'Masukkan Suhu Dalam Celcius'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              // const SizedBox(
              //   height: 250,
              // ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
              ]),
              // const SizedBox(
              //   height: 260,
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: konversiSuhu,
                child: const Text('Konversi Suhu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
