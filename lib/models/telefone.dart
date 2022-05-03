import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;

  Telefone({
    required this.ddd,
    required this.telefone,
  });

  // éun metodo que pega o objeto e transforma en um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  // é um CONSTRUTOR ele vai pegar um MAP e transformar em um objeto telefone
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  // é um método que retorna uma string json do meu objeto Telefone
  String toJson() => jsonEncode(toMap());

  // é um método que baseado em umu string json retorna um objeto Telefone
  factory Telefone.fromJson(String source) =>
      Telefone.fromMap(jsonDecode(source));
}
