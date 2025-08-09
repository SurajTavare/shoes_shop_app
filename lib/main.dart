import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/Cart_Provider.dart';
import 'pages/home_page_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=> cartProvider(),
      child: const shopApp()
  ),
  );
}

class shopApp extends StatelessWidget {
  const shopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Lato",
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(254, 206, 1, 1),
          primary: Colors.yellow,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      home: HomePageScreen(),
    );
  }
}
