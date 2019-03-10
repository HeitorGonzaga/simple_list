import 'package:http/http.dart' as http;

const urlApi = 'http://192.168.0.105:5000';

class ContatoService {
  static Future getContatos() {
    return http.get(urlApi + '/contatos');
  }
}
