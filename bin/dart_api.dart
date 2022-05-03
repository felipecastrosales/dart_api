import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dart_api/models/telefone.dart';

void main(List<String> arguments) {
  final cidadeJson = '''
    [{ 
      "id": 1,
      "nome": "Uruburetama",
      "regiao": {
        "nome": "Nordeste"
      }
    },
    { 
      "id": 2,
      "nome": "Tururu",
      "regiao": {
        "nome": "Nordeste"
      }
    }]
  ''';

  // [] -> List
  // {} -> Map<String, dynamic>

  final cidadeMap = json.decode(cidadeJson);

  if (cidadeMap is List) {
    print('éuma lista');
  } else if (cidadeMap is Map) {
    print('éuma map');
  }

  developer.log('${cidadeMap.runtimeType}');
  developer.log('$cidadeMap');
  developer.log('${cidadeMap[0].runtimeType}');

  cidadeMap.forEach((city) {
    developer.log('${city['nome']}');
  });

  cidadeMap.forEach((city) {
    developer.log('${city['regiao']['nome']}');
  });

  final cidadeMapJson = {'id': 1, 'nome': 'Uruburetama', 'uf': 'CE'};
  developer.log(json.encode(cidadeMapJson));
  developer.log('${[json.encode(cidadeMapJson)]}');

  final telefoneJson = '''
    {  
      "ddd":11,
      "telefone":"1216534694"
    }
    ''';

  final telefone = Telefone.fromJson(telefoneJson);
  developer.log('${telefone.ddd}');
  developer.log(telefone.telefone);
  developer.log(telefone.toJson());
  developer.log('${telefone.toMap()}');
}
