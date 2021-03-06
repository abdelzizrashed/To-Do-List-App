import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/use_cases/use_case.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo_project.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo_task.dart';
import 'package:todo_list/features/todo_list/domain/repositories/todo_list_repository.dart';

class GetProjectsCompletedTasks
    implements UseCase<List<TodoTask>, TodoProject> {
  final TodoListRepository todoListRepository;

  GetProjectsCompletedTasks(this.todoListRepository);

  @override
  Future<Either<Failure, List<TodoTask>>> call(TodoProject project) {
    return todoListRepository.getProjectsCompletedTasks(project);
  }
}
