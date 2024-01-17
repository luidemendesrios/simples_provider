import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simples_provider/models/pessoa.dart';

/**
 * Provider = Provedor
 * 
 * Um wrapper para o InheritedWidget tornando-os mais fáceis de usar e reutilizáveis
 * 
 * Um mix entre State Management e Dependency Injection.
 * 
 * O provider nos oferece uma maneira fácil e simplificada de separar a lógica
 * de negócios de nossos widgets em aplicativos.
 * 
 * Para que posso usar o Provider?
 * 
 * Separar seu Estado (State) de sua UI(Interface de usuário)
 * 
 * Gerenciar a reconstrução da UI com base nas mudanças de Estado.
 * 
 * Tornar seu código mais fácil, organiado, testável e escalonável.
 */

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Pessoa(nome: 'Davi', idade: 25),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Consumer<Pessoa>(
        builder: (context,pessoa,child) =>
        
        Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Exemplo de provider simples'),),
          ),
          body: Center(
            child: Text('${pessoa.nome} tem ${pessoa.idade} anos de idade',
            style: const TextStyle(fontSize: 30),),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>  pessoa.incrementIdade(),
            child: const Icon(Icons.plus_one),
            ),
        ),
      ),
    );
  }
}
