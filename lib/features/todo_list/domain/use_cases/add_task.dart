import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/use_cases/use_case.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo_task.dart';
import 'package:todo_list/features/todo_list/domain/repositories/todo_list_repository.dart';

class AddTask implements UseCase<void, TodoTask> {
  final TodoListRepository todoListRepository;

  AddTask(this.todoListRepository);

  @override
  Future<Either<Failure, void>> call(task) {
    return todoListRepository.addTask(task);
  }
}
