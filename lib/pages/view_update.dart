
import 'package:flutter/material.dart';
import 'package:lista_de_gastos/model/anotacao.dart';
import '../help/anotacoes_helper.dart';

class ViewEditUpdate extends StatefulWidget {
  Map<String,dynamic>? anotacao;
  ViewEditUpdate({super.key,required this.anotacao});

  @override
  State<ViewEditUpdate> createState() => _ViewjEditUpdateState();
}

class _ViewjEditUpdateState extends State<ViewEditUpdate> {
  final AnotacoesHelper _anotacoesHelper = AnotacoesHelper();
  final TextEditingController _controllerDescricao = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();
  final TextEditingController _controllerTitulo = TextEditingController();
  late Anotacao _anotacao;
  int _id = 0;
  @override
  void initState() {
    _recuperarDados();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _id = _anotacao.id!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('atualizar anotacao'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: TextField(
                  controller: _controllerTitulo,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: TextField(
                  controller: _controllerDescricao,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: TextField(
                  controller: _controllerValor,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  children: [
                    Expanded(child: TextButton(onPressed: (){
                      // atualizar
                      _update();
                      Navigator.pop(context);
                    },child: const Text('Atualizar'),)),
                    Expanded(child: TextButton(onPressed: (){

                      // deletar
                      _delete();
                    },child: const Text('Excluir'),)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _recuperarDados(){
    if(widget.anotacao != null){
      _anotacao = widget.anotacao?['anotacao'];
      _controllerValor.text = _anotacao.valor.toString();
      _controllerDescricao.text = _anotacao.descricao.toString();
      _controllerTitulo.text = _anotacao.titulo.toString();
    }
  }
  _update() async {
    String titulo = _controllerTitulo.text;
    String descricao = _controllerDescricao.text;
    String valor = _controllerValor.text;
    DateTime dateTime = DateTime.now();
    Anotacao novaAnotacao = Anotacao(
        titulo: titulo,
        descricao: descricao,
        valor: valor,
        data: dateTime.toString(),
      id: _id,
    );
    print('${novaAnotacao.id} ${novaAnotacao.titulo} ${novaAnotacao.descricao}'
        '${novaAnotacao.valor} ${novaAnotacao.data}');
    int resultado = await _anotacoesHelper.update(novaAnotacao);
    print('resultado $resultado');
  }
  _delete(){

  }
}

