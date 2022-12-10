import 'package:animation_tests/expanded_tile_animacao_implicita.dart';
import 'package:flutter/material.dart';

import 'botao_flutuante_animacao_implicita.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/ex1': (_) => const DesafioBotaoFlutuanteAnimacaoImplicita(),
        '/ex2': (_) => const DesafioExpandedTileAnimacaoImplicita(),
      },
      initialRoute: '/ex2',
    );
  }
}
