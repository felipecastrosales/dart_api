import 'package:dart_api/models/aluno.dart';
import 'package:dart_api/models/cidade.dart';
import 'package:dart_api/models/curso.dart';
import 'package:dart_api/models/endereco.dart';
import 'package:dart_api/models/telefone.dart';
import 'package:dart_api/repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();
    alunos.forEach(print);
  }

  Future<void> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);
    print(aluno);
  }

  Future<void> update() async {
    final aluno = await _alunosRepository.findById('1');
    aluno.nomeCursos.add('Dart');
    final alunoAlterado = await _alunosRepository.update(aluno);
    print(alunoAlterado);
    print(alunoAlterado.nomeCursos);
  }

  Future<void> insert() async {
    final aluno = Aluno(
      nome: 'Luis Castro',
      nomeCursos: ['Fundamentos'],
      endereco: Endereco(
        cep: '59000-000',
        numero: 169,
        rua: 'Aldeota',
        cidade: Cidade(id: 85, nome: 'Fortaleza'),
        telefone: Telefone(ddd: 85, telefone: '85999999999'),
      ),
      cursos: [
        Curso(id: 1, nome: 'Flutter', isAluno: true),
        Curso(id: 2, nome: 'Dart', isAluno: false),
      ],
    );
    _alunosRepository.insert(aluno);
  }
}
