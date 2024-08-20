import 'package:flutter/material.dart';
import 'package:lista_de_gastos/model/anotacao.dart';

import '../help/anotacoes_helper.dart';

class Anotacoes extends StatefulWidget {
  const Anotacoes({super.key});

  @override
  State<Anotacoes> createState() => _AnotacoesState();
}

class _AnotacoesState extends State<Anotacoes> {
  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerDescricao = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();
  final AnotacoesHelper _db = AnotacoesHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: TextField(
                    controller: _controllerTitulo,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Digite o titulo da anotação'
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 16,bottom: 16),
              child: TextField(
                controller: _controllerDescricao,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  hintText: 'Digite a descrição da anotação'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,bottom: 16),
              child: TextField(
                controller: _controllerValor,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  hintText: 'Digite o valor'
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: _salvar, child: const Text('Salvar'),))
                ],
              ),
            )
          ],
          ),
        ),
      ),
    );
  }
  _salvar()async {
    String titulo = _controllerTitulo.text;
    String descricao = _controllerDescricao.text;
    String valor = _controllerValor.text;
    DateTime dateTime = DateTime.now();
    Anotacao anotacao = Anotacao(
        titulo: titulo,
        descricao: descricao,
        valor: valor,
      data: dateTime.toString()
    );
    int id = await _db.salvarAnotacao(anotacao);
    print('*****************seu id e $id ************************');
    Navigator.pop(context);
  }
}
