import 'package:flutter/material.dart';

class Pessoa with ChangeNotifier{
  String nome = '';
  int idade = 0;

  Pessoa({required this.nome, required this.idade});

  void incrementIdade(){
    idade++;
    notifyListeners();
  }
}