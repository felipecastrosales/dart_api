import 'dart:convert';

import 'curso.dart';
import 'endereco.dart';

class Aluno {
  String? id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  Endereco endereco;
  List<Curso> cursos;

  Aluno({
    this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.endereco,
    required this.cursos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'nomeCursos': nomeCursos,
      'endereco': endereco.toMap(),
      'cursos': cursos.map((curso) => curso.toMap()).toList(),
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      idade: map['idade'],
      // nomeCursos: List<String>.from(map['nomeCursos']),
      nomeCursos: map['nomeCursos'].cast<String>(),
      endereco: Endereco.fromMap(map['endereco']),
      cursos:
          map['cursos'].map<Curso>((curso) => Curso.fromMap(curso)).toList(),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Aluno.fromJson(String source) => Aluno.fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'Aluno(id: $id, nome: $nome, idade: $idade, nomeCursos: $nomeCursos, endereco: $endereco, cursos: $cursos)';
  }
}
