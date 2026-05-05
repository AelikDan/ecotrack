import 'package:flutter/material.dart';
import 'habitos_screen.dart';

//Primeira tela que o usuário vê. Tem nome do app, descrição, ícone e botão para entrar.

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone do app
              const Icon(Icons.eco, size: 100, color: Colors.green),
              const SizedBox(height: 24),

              // Nome do app
              const Text(
                'EcoTrack',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Descrição
              const Text(
                'Acompanhe seus hábitos sustentáveis e veja seu impacto positivo no planeta.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),

              // Botão para entrar
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HabitosScreen()),
                  );
                },
                child: const Text('Começar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}