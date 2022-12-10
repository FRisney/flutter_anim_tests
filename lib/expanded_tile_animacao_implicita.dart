import 'dart:math';

import 'package:flutter/material.dart';

class DesafioExpandedTileAnimacaoImplicita extends StatefulWidget {
  const DesafioExpandedTileAnimacaoImplicita({super.key});

  @override
  State<DesafioExpandedTileAnimacaoImplicita> createState() =>
      _DesafioExpandedTileAnimacaoImplicitaState();
}

class _DesafioExpandedTileAnimacaoImplicitaState
    extends State<DesafioExpandedTileAnimacaoImplicita> {
  final items = <Map<String, String>>[];
  @override
  void initState() {
    super.initState();
    List.generate(
        15,
        (index) => items.add({
              'title': 'O Titulo é esse',
              'content': 'e o content é isso aqui!'
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio Expanded Tile Animacao Implicita'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ExpandedTile(
            title: items[index]['title'] ?? '',
            content: items[index]['content'] ?? '',
          );
        },
      ),
    );
  }
}

class ExpandedTile extends StatefulWidget {
  const ExpandedTile({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> {
  late final Color color;
  double fact = 0;
  double turns = 0;

  @override
  void initState() {
    super.initState();
    var i = Random().nextInt(Colors.accents.length);
    color = Colors.accents[i];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 3,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              if (fact == 1) {
                fact = 0;
                turns = 0;
              } else {
                fact = 1;
                turns = 0.5;
              }
            }),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: color, width: 8),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 45,
              child: Row(
                children: [
                  Expanded(child: Text(widget.title)),
                  AnimatedRotation(
                    turns: turns,
                    duration: const Duration(milliseconds: 20000),
                    child: const Icon(
                      Icons.expand_more,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRect(
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 20000),
              alignment: Alignment.topLeft,
              heightFactor: fact,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.black12, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [Expanded(child: Text(widget.content))],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
