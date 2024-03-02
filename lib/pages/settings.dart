import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ztmcourse/providers/user_provider.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});
  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LocalUser currentUser = ref.watch(userProvider);
    _nameController.text = currentUser.user.name;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Enter your name"),
              controller: _nameController,
            ),
            TextButton(
              onPressed: () {
                ref.read(userProvider.notifier).updateName(_nameController.text);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
