import 'package:flutter/material.dart';
import 'package:lista_de_gastos/generate_route.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Anotações Financeiras',style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        child: Text('bem vindo'),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: (){
          Navigator.pushNamed(context, GenerateRoute.annotation);
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
