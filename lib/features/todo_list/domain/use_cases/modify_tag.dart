import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/use_cases/use_case.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo_tag.dart';
import 'package:todo_list/features/todo_list/domain/repositories/todo_list_repository.dart';

class ModifyTag implements UseCase<void, TodoTag> {
  final TodoListRepository todoListRepository;

  ModifyTag(this.todoListRepository);

  @override
  Future<Either<Failure, void>> call(tag) {
    return todoListRepository.modifyTag(tag);
  }
}
