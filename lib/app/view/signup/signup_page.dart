import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 50,
                  bottom: 15,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
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
                bottom: 15,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((10)),
                color: Colors.grey,
              ),
              child: TextFormField(),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 15,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((10)),
                color: Colors.grey,
              ),
              child: TextFormField(),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 15,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((10)),
                color: Colors.grey,
              ),
              child: TextFormField(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: MediaQuery.of(context).size.width * 0.3,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((10)),
                color: Colors.yellow,
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Registre-se',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.yellow,
                ),
                borderRadius: BorderRadius.circular((10)),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.abc,
                    color: Colors.white,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Entre com sua conta Google',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
