import 'package:flutter/material.dart';
import '../model/habito.dart';

class HabitoCard extends StatelessWidget {
  final Habito habito;
  final VoidCallback? onConcluir;

  const HabitoCard({super.key, required this.habito, this.onConcluir});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: Icon(
          habito.concluido ? Icons.check_circle : Icons.radio_button_unchecked,
          color: habito.concluido ? Colors.green : Colors.grey,
        ),
        title: Text(habito.nome),
        trailing: onConcluir != null
            ? ElevatedButton(
                onPressed: onConcluir,
                child: const Text('Concluir'),
              )
            : null,
      ),
    );
  }
}