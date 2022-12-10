import 'package:flutter/material.dart';

class DesafioBotaoFlutuanteAnimacaoImplicita extends StatefulWidget {
  const DesafioBotaoFlutuanteAnimacaoImplicita({super.key});
  @override
  State<DesafioBotaoFlutuanteAnimacaoImplicita> createState() =>
      _DesafioBotaoFlutuanteAnimacaoImplicitaState();
}

class _DesafioBotaoFlutuanteAnimacaoImplicitaState
    extends State<DesafioBotaoFlutuanteAnimacaoImplicita> {
  double w = 60;
  double r = 30;
  Alignment align = Alignment.bottomRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio Botão Flutuante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(45),
        child: AnimatedAlign(
          duration: const Duration(seconds: 20),
          alignment: align,
          child: GestureDetector(
            onTap: () {
              setState(() {
                w = (w == 60) ? 320 : 60;
                r = (r == 0) ? 30 : 0;
                align = align == Alignment.topCenter
                    ? Alignment.bottomRight
                    : Alignment.topCenter;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 20),
              width: w,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r),
                color: Colors.blue,
              ),
              child: const Center(child: Text('\\m/')),
            ),
          ),
        ),
      ),
    );
  }
}
