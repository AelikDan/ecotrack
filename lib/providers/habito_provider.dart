import 'package:flutter/material.dart';
import '../model/habito.dart';

class HabitoProvider extends ChangeNotifier {
  // Lista de hábitos pendentes
  final List<Habito> _pendentes = [
    Habito(nome: 'Separar lixo reciclável'),
    Habito(nome: 'Economizar água no banho'),
    Habito(nome: 'Usar garrafa reutilizável'),
    Habito(nome: 'Desligar luzes desnecessárias'),
    Habito(nome: 'Usar transporte coletivo ou bicicleta'),
  ];

  final List<Habito> _concluidos = [];

  bool _modoEscuro = false;

  List<Habito> get pendentes => _pendentes;
  List<Habito> get concluidos => _concluidos;
  bool get modoEscuro => _modoEscuro;

  // Pontuação: 20 pontos por hábito concluído
  int get pontuacao => _concluidos.length * 20;

  // Meta semanal de 5 hábitos
  double get progressoMeta => _concluidos.length / 5;

  // Marcar hábito como concluído
  void concluirHabito(Habito habito) {
    _pendentes.remove(habito);
    habito.concluido = true;
    _concluidos.add(habito);
    notifyListeners();
  }

  // Redefinir progresso
  void redefinirProgresso() {
    _concluidos.clear();
    _pendentes.addAll([
      Habito(nome: 'Separar lixo reciclável'),
      Habito(nome: 'Economizar água no banho'),
      Habito(nome: 'Usar garrafa reutilizável'),
      Habito(nome: 'Desligar luzes desnecessárias'),
      Habito(nome: 'Usar transporte coletivo ou bicicleta'),
    ]);
    notifyListeners();
  }

  // Alternar tema
  void alternarTema() {
    _modoEscuro = !_modoEscuro;
    notifyListeners();
  }
}