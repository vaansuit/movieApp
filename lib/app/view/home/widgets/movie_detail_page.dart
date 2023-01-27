import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final String posterUrl;
  final String title;
  final String sinopse;

  const MovieDetailPage({
    Key? key,
    required this.posterUrl,
    required this.title,
    required this.sinopse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.yellow,
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            title,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                width: 220,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((10)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.yellow,
                      spreadRadius: 2,
                      blurRadius: 2,
                    )
                  ],
                  image: DecorationImage(
                    image: NetworkImage(posterUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 20,
              ),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((10)),
                color: Colors.yellow,
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Comprar Ingresso',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(92, 200, 200, 200),
                    Color.fromARGB(104, 100, 100, 100),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  sinopse,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
