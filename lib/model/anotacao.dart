
import '../help/anotacoes_helper.dart';

class Anotacao {
  int? _id;
  String? _titulo;
  String? _descricao;
  String? _valor;
  String? _categoria;
  String? _data;


  Anotacao({required titulo, required descricao, required valor, required data,id = 0}){
     this.titulo = titulo;
     this.descricao = descricao;
     this.valor = valor;
     this.data = data;
     this.id = id;
  }


  Anotacao.fromMap(Map<String,dynamic> map){
    id = map[AnotacoesHelper.colunaId];
    titulo = map[AnotacoesHelper.titulo];
    descricao = map[AnotacoesHelper.descricao];
    valor = map[AnotacoesHelper.valor];
    categoria = map[AnotacoesHelper.categoria];
    data = map[AnotacoesHelper.data];
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {};
    map['titulo'] = titulo;
    map['descricao'] = descricao;
    map['valor'] = valor;
    map['data'] = data;
    map['categoria'] = 'categoria';
    if(id != null){
      map['id'] = id;
    }
    return map;
  }

  String? get data => _data;

  set data(String? value) {
    _data = value;
  }

  String? get valor => _valor;

  set valor(String? value) {
    _valor = value;
  }

  String? get descricao => _descricao;

  set descricao(String? value) {
    _descricao = value;
  }

  String? get titulo => _titulo;

  set titulo(String? value) {
    _titulo = value;
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }

  String? get categoria => _categoria;

  set categoria(String? value) {
    _categoria = value;
  }
}