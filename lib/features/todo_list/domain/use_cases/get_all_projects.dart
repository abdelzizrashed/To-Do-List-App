import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/use_cases/use_case.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo_project.dart';
import 'package:todo_list/features/todo_list/domain/repositories/todo_list_repository.dart';

class GetAllProjects implements UseCase<List<TodoProject>,NoParams> {
  final TodoListRepository todoListRepository;

  GetAllProjects(this.todoListRepository);

  @override
  Future<Either<Failure, List<TodoProject>>> call(NoParams params) {
    return todoListRepository.getAllProjects();
  }
}
