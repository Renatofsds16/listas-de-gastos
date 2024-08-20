import 'package:flutter/material.dart';
import 'package:lista_de_gastos/pages/anotacoes.dart';
import 'package:lista_de_gastos/pages/home.dart';
import 'package:lista_de_gastos/pages/view_update.dart';
class GenerateRoute{

  static const homeInitial = '/';
  static const home = '/home';
  static const annotation = '/anotacao';
  static const viewEdit = '/viewEdit';

  static Route<dynamic>? generateRoute(RouteSettings settings){


    switch(settings.name){
      case homeInitial:
        return MaterialPageRoute(builder: (_){
          return const Home();
        });
      case home:
        return MaterialPageRoute(builder: (_){
          return const Home();
        });
      case annotation:
        return MaterialPageRoute(builder: (_){
          return const Anotacoes();
        });
      case viewEdit:
        return MaterialPageRoute(builder: (_){
          return ViewEditUpdate(anotacao: {'anotacao': settings.arguments},);
        });
      default:
        return _viewError();
    }

  }
  static _viewError(){

    return MaterialPageRoute(builder: (_){
      return const Scaffold(
        body: Center(
          child: Text('Tela nao encontrada'),
        ),
      );
    });
  }
}