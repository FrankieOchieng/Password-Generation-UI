import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Passwordgeneration extends StatefulWidget {
  const Passwordgeneration({super.key});

  @override
  State<Passwordgeneration> createState() => _PasswordgenerationState();
}

class _PasswordgenerationState extends State<Passwordgeneration> {
  String password = '';

  //Create
  final String copiedtext = "Copy to text";

  // Create a method to generate the password.
  String generatedpassword() {
    List<String> alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    List<String> specialchars = ['%', '#', '@', '&', '!', '*'];
    List<String> smallalphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');

    List<String> password = [];

    for (int i = 0; i <= 5; i++) {
      password.add(alphabets[Random().nextInt(alphabets.length)]);
      password.add(numbers[Random().nextInt(numbers.length)].toString());
      password.add(specialchars[Random().nextInt(specialchars.length)]);
      password.add(smallalphabet[Random().nextInt(smallalphabet.length)]);
    }
    return password.join();
  }

  // Create a void method.
  void generatepass() {
    setState(() {
      password = generatedpassword();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Title(
          color: Colors.black,
          child: const Text(
            'Generated Random Password',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 24),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                password,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
              IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: password));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          'Copied to clipboard!',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.copy)),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.key_outlined),
                iconAlignment: IconAlignment.start,
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.orange),
                    maximumSize:
                        WidgetStatePropertyAll(Size(double.infinity, 45))),
                onPressed: generatepass,
                label: const Text(
                  'Generate password',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
