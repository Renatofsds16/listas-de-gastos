
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AnotacoesHelper{
  Database? _db;
  static final AnotacoesHelper _anotacoesHelper = AnotacoesHelper._internal();
  factory AnotacoesHelper(){
    return _anotacoesHelper;
  }
  AnotacoesHelper._internal();

  get db async {
    if(_db != null){
      return _db;
    }else{
      _db = _inicializarDb();
    }
  }

  _inicializarDb() async {
    final caminhoBancoDeDados = await getDatabasesPath();
    final locaDB  = join(caminhoBancoDeDados,'banco_meus_gasto.db');
    var db = await openDatabase(locaDB,version: 1,onCreate: _onCreate);
    return db;
  }
  _onCreate(Database db,int version)async {
    String sql = 'CREATE TABLE banco_meus_gasto (id INTEGER PRIMARY KEY AUTOICREMENT,titulo VARCHAR,descricao TEXT,data DATETIME)';
    await db.execute(sql);
  }
}
