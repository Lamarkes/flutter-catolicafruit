
import 'package:app_catolicafruit/models/frutas_modelo.dart';
import 'package:app_catolicafruit/models/legumes_modelo.dart';

class Secoes{
  String? nomeSecao;
  Fruta? frutas;
  Legume? legumes;
  bool? aberto;


  Secoes({
    required this.nomeSecao,
    required this.frutas,
    required this.legumes,
    required this.aberto,
  });

  @override
  String toString(){
    return "<nomeSecao=$nomeSecao>";
  }
}