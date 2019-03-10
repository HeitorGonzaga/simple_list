import 'package:app/controller/contato-bloc.dart';
import 'package:app/model/contato.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  ContatoBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = new ContatoBloc();
    bloc.getContatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Contatos'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.white),
              onPressed: () {
                bloc.getContatos();
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: StreamBuilder(
            stream: bloc.output,
            initialData: List<Contato>(),
            builder: (context, snapshot) {
              if (snapshot.data.length == 0) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${snapshot.data[index].nome}',
                          style:
                              TextStyle(fontSize: 18, color: Colors.black87)),
                      subtitle: Text('${snapshot.data[index].telefone}'),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
