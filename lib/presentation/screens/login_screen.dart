import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roro/presentation/providers/counter_screen.dart';

class LoginScreens extends ConsumerWidget {
  const LoginScreens({super.key});

  static const name = "login";
  @override
  Widget build(BuildContext context, ref) {
    final bool themeMode = ref.watch(themeapp);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeapp.notifier).update((state) => !state);
              },
              icon: Icon(themeMode ? Icons.dark_mode : Icons.light_mode))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.bodyLarge,
              )),
          const SizedBox(
            height: 50,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                "Enter Your Phone number",
                style: TextStyle(
                    color: themeMode ? Colors.red.shade50 : Theme.of(context).primaryColor, fontSize: 30),
              ))
        ],
      ),
    );
  }
}
