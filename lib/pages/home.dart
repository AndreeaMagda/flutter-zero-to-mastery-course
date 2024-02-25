import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ztmcourse/models/todo.dart';
import 'package:ztmcourse/pages/add.dart';
import 'package:ztmcourse/providers/todo_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do App"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
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
                todos[index].content,
              )));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTodo()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
