import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dart_api/models/aluno.dart';

class AlunosRepository {
  Future<List<Aluno>> findAll() async {
    final alunosResponse =
        await http.get(Uri.parse('http://localhost:3031/alunos'));
    print(alunosResponse.body);
    final alunosList = jsonDecode(alunosResponse.body);
    alunosList.map<Aluno>((alunoMap) {
      return Aluno.fromMap(alunoMap);
    }).toList();
    return [];
  }

  Future<Aluno> findById(String id) async {
    final alunoResponse =
        await http.get(Uri.parse('http://localhost:3031/alunos/$id'));
    print(alunoResponse.body);
    // final alunoMap = jsonDecode(alunoResponse.body);
    // return Aluno.fromMap(alunoMap);
    return Aluno.fromJson(alunoResponse.body);
  }

  Future<Aluno> update(Aluno aluno) async {
    final alunoResponse = await http.put(
      Uri.parse('http://localhost:3031/alunos/${aluno.id}'),
      body: aluno.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(alunoResponse.body);
    final alunoMap = jsonDecode(alunoResponse.body);
    return Aluno.fromMap(alunoMap);
  }

  Future<void> insert(Aluno aluno) async {
    final alunoResponse = await http.post(
      Uri.parse('http://localhost:3031/alunos/'),
      body: aluno.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(alunoResponse.body);
  }
}
