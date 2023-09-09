// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDark = false;

  int img = 0;
  double imc = 0;

  TextEditingController _peso = TextEditingController();
  TextEditingController _altura = TextEditingController();

  Future<dynamic> calcIMC() async {
    double calc = double.parse(_peso.text) /
        ((double.parse(_altura.text) * double.parse(_altura.text))/10000);

    switch (calc) {
      case < 18.5:
        return [1, calc];
      case < 25:
        return [2, calc];
      case < 30:
        return [3, calc];
      case < 35:
        return [4, calc];
      case < 40:
        return [5, calc];
      default:
        return [6, calc];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromRGBO(188, 0, 74, 1.0),
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _peso,
                        decoration: InputDecoration(
                          hintText: 'Peso (Kg)',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _altura,
                        decoration: InputDecoration(
                          hintText: 'Altura (cm)',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 29,
                ),
                OutlinedButton.icon(
                  onPressed: () async {
                    var res = await calcIMC();
                    setState(() {
                      img = res[0];
                      imc = res[1];
                    });
                  },
                  icon: Icon(Icons.done),
                  label: Text("Calcular"),
                  style: OutlinedButton.styleFrom(elevation: 0),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/$img.png",
                      errorBuilder: (context, error, stackTrace) => Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      img == 0
                          ? ''
                          : img == 1
                              ? 'Abaixo de Peso'
                              : img == 2
                                  ? 'Peso Normal'
                                  : img == 3
                                      ? 'Sobrepeso'
                                      : img == 4
                                          ? 'Obesidade Grau I'
                                          : img == 5
                                              ? 'Obesidade Grau II'
                                              : img == 6
                                                  ? 'Obesidade Mórbida'
                                                  : '',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
                if (imc != 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Imc: ${imc.toStringAsFixed(1)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
