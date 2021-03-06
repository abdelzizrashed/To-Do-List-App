import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/use_cases/use_case.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo_project.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo_task.dart';
import 'package:todo_list/features/todo_list/domain/repositories/todo_list_repository.dart';

class GetProjectsUnfinishedTasks implements UseCase<List<TodoTask>, TodoProject> {
  final TodoListRepository todoListRepository;

  GetProjectsUnfinishedTasks(this.todoListRepository);

  @override
  Future<Either<Failure, List<TodoTask>>> call(TodoProject project) {
    return todoListRepository.getProjectsUnfinishedTasks(project);
  }
}
