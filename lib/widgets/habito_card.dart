import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/habito.dart';
import '../providers/habito_provider.dart';

class HabitoCard extends StatelessWidget {
  final Habito habito;
  final VoidCallback? onConcluir;

  const HabitoCard({super.key, required this.habito, this.onConcluir});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HabitoProvider>();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: Icon(
          habito.concluido ? Icons.check_circle : Icons.radio_button_unchecked,
          color: habito.concluido ? Colors.green : Colors.grey,
        ),
        title: Text(habito.nome),
        trailing: habito.concluido
          //Caso o usuári queira desmarcar
            ? IconButton(
                icon: const Icon(Icons.undo, color: Colors.red),
                onPressed: () {
                  provider.desmarcarHabito(habito);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Eita, o que aconteceu? 🌱'),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              )
            : ElevatedButton(
                onPressed: onConcluir,
                child: const Text('Concluir'),
              ),
      ),
    );
  }
}