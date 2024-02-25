import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ztmcourse/models/todo.dart';
import 'package:ztmcourse/pages/add.dart';
import 'package:ztmcourse/pages/completed.dart';
import 'package:ztmcourse/providers/todo_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todoProvider);
    List<Todo> activeTodos = todos
        .where(
          (todo) => todo.completed == false,
        )
        .toList();
    List<Todo> completedTodos = todos
        .where(
          (todo) => todo.completed == true,
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do App"),
      ),
      body: ListView.builder(
        itemCount: activeTodos.length+1,
        itemBuilder: (context, index) {
          if (index == activeTodos.length) {
            if (completedTodos.isEmpty)
              return Container();
            else {
              return Center(
                child: TextButton(
                  child:const Text("Completed Todos"),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CompletedTodo())),
                ),
              );
            }
          } else {
            return Slidable(
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          ref.watch(todoProvider.notifier).deleteTodo(index),
                      backgroundColor: Colors.redAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      icon: Icons.delete,
                    )
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          ref.watch(todoProvider.notifier).completeTodo(index),
                      backgroundColor: Colors.greenAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      icon: Icons.check_circle_outline,
                    )
                  ],
                ),
                child: ListTile(
                    title: Text(
                  activeTodos[index].content,
                )));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddTodo()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
