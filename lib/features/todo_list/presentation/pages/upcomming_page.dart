import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/widgets/side_menu_drawer.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo_task.dart';
import 'package:todo_list/features/todo_list/presentation/bloc/todo_list_bloc.dart';
import 'package:todo_list/features/todo_list/presentation/widgets/display_message.dart';
import 'package:todo_list/features/todo_list/presentation/widgets/loading_widget.dart';
import 'package:todo_list/features/todo_list/presentation/widgets/new_task_floating_button.dart';
import 'package:todo_list/features/todo_list/presentation/widgets/task_card.dart';
import 'package:todo_list/injection_container.dart';

class UpCommingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcomming'),
      ),
      drawer: SideMenuDrawer(),
      body: buildBody(context),
      floatingActionButton: NewTaskFloatingButton(
        route: '/',
      ),
    );
  }

  BlocProvider<TodoListBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TodoListBloc>(),
      child: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          print('I have a new state');
          if (state is Empty) {
            BlocProvider.of<TodoListBloc>(context)
                .add(GetAllUnfinishedTasksEvent());
            return DisplayMessage(message: 'EmptyState');
          } else if (state is AllUnfinishedTasksState) {
            if (state.tasksList.length == 0) {
              return DisplayMessage(message: 'You are all done!');
            } else {
              return buildTasksList(context, state.tasksList);
            }
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }

  Widget buildTasksList(BuildContext context, List<TodoTask> tasks) {
    List<Widget> tasksList = [];
    tasks.forEach((task) {
      tasksList.add(TaskCard(task: task, route: '/'));
    });
    return ListView(
      children: tasksList,
    );
  }
}
