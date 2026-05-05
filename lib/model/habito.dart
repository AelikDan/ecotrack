//Define a classe Habito com seus atributos (nome, concluido). É o molde do objeto que representa cada hábito.

class Habito {
  //Apenas nome e se está concluido ou não
  final String nome;
  bool concluido;

  Habito({required this.nome, this.concluido = false});
}