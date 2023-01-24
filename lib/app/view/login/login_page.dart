import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 180),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((10)),
                color: Colors.grey,
              ),
              child: TextFormField(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 15,
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((10)),
              color: Colors.grey,
            ),
            child: TextFormField(),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((10)),
              color: Colors.yellow,
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 180,
          ),
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll<Color>(Colors.black),
              shape: MaterialStateProperty.resolveWith(
                  (states) => const StadiumBorder(
                        side: BorderSide(color: Colors.red),
                      )),
            ),
            onPressed: () {},
            icon: const Icon(Icons.abc),
            label: const Text('Entrar com sua conta Google'),
          ),
        ],
      ),
    );
  }
}
