import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/habito_provider.dart';
import 'screens/splash_screen.dart';

//Ponto de entrada do app. Inicializa o Provider e define qual tela abre primeiro (SplashScreen).
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => HabitoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitoProvider>(
      builder: (context, provider, _) {
        return MaterialApp(
          title: 'EcoTrack',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorSchemeSeed: Colors.green,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            colorSchemeSeed: Colors.green,
            brightness: Brightness.dark,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
