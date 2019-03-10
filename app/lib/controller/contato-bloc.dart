import 'dart:async';
import 'dart:convert';

import 'package:app/model/contato.dart';
import 'package:app/service/contato-service.dart';

class ContatoBloc {
  List<Contato> lstContatos = new List<Contato>();

  StreamController<List<Contato>> _lstController =
      new StreamController<List<Contato>>();

  Stream<List<Contato>> get output => _lstController.stream;

  getContatos() {
    this.lstContatos = new List<Contato>();
    _lstController.sink.add(this.lstContatos);
    ContatoService.getContatos().then((response) {
      Iterable l = json.decode(response.body);
      this.lstContatos = l.map((model) => Contato.fromJson(model)).toList();
      _lstController.sink.add(this.lstContatos);
    }).catchError((err) {
      print(err);
    });
  }
}
