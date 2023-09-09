// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontSize: 20, height: 1.5);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0xFFBC004A),
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isDark = isDark == false;
                });
              },
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              tooltip: "Mudar para o tema ${isDark ? 'Claro' : 'Escuro'}",
            )
          ],
          title: Text("Application"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinhar à esquerda
              children: [
                Text(
                  "Personal info",
                  style: titleStyle,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "First name",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Last name",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Alinhar os elementos no espaço disponível
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Birthday",
                          helperText: "MM/DD/YYYY",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Social security",
                          helperText: "### - ## - ####",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Residence address",
                  style: titleStyle,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Address",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Alinhar os elementos no espaço disponível
                  children: [
                    Flexible(
                      child: DropdownButtonFormField(
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Natal"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Brasilia"),
                          ),
                        ],
                        onChanged: (value) {},
                        hint: Text("City"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: DropdownButtonFormField(
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Text("RN"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("DF"),
                          ),
                        ],
                        onChanged: (value) {},
                        hint: Text("State"),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Alinhar os elementos no espaço disponível
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Zip code",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 1,
                      child: DropdownButtonFormField(
                        hint: Text("Country"),
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Brasil"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Canada"),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
