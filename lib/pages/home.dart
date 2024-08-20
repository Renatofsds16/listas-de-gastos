import 'package:flutter/material.dart';
import 'package:lista_de_gastos/generate_route.dart';
import 'package:lista_de_gastos/model/anotacao.dart';
import '../help/anotacoes_helper.dart';
import '../utius/format_date.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AnotacoesHelper _anotacoesHelper = AnotacoesHelper();
  List<Anotacao> _listAnotacao = [];
  late Anotacao _anotacao;
  FormatDate dataFormatada = FormatDate();

  @override
  void initState() {
    _recuperarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Anotações Financeiras',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(onPressed: _recuperarDados, child: const Icon(Icons.refresh))
        ],
      ),
      body: ListView.builder(
          itemCount: _listAnotacao.length,
          itemBuilder: (context, index) {
            Anotacao itemAnotacao = _listAnotacao[index];
            return Card(
              child: ListTile(
                title: Text(itemAnotacao.titulo.toString()),
                subtitle: Text('${itemAnotacao.descricao.toString()} - '
                    '${dataFormatada.formatDate(itemAnotacao.data.toString())}'
                    ' valor ${itemAnotacao.valor.toString()}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: GestureDetector(
                        onTap: () {
                          _anotacao = itemAnotacao;
                          Navigator.pushNamed(
                              context, '/viewEdit', arguments: itemAnotacao);
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: () {
                          _viewAlert(itemAnotacao);
                        },
                        child: const Icon(
                          Icons.remove_circle,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: () {
          Navigator.pushNamed(context, GenerateRoute.annotation);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  _recuperarDados() async {
    List anotacoesRecuperada = await _anotacoesHelper.recuperarDados();
    List<Anotacao>? list = [];
    for (var item in anotacoesRecuperada) {
      print(item.toString());
      Anotacao anotacao = Anotacao.fromMap(item);
      list.add(anotacao);
    }
    setState(() {
      _listAnotacao = list;
    });
  }

  _delete(Anotacao anotacao)async {
    int resultado = await _anotacoesHelper.delete(anotacao);
    print('resultado $resultado');
    _recuperarDados();
  }


  _viewAlert(Anotacao anotacao) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Deletar?'),
            content: const Text('Deseja ralmente deletar essa anotacao? '),
            actions: [
              TextButton(onPressed: (){
                _delete(anotacao);
                Navigator.pop(context);
                }, child: const Text('Sim')),
              TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Não')),
            ],
          );
        });
  }
}
