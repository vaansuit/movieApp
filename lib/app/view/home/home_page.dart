import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/app/controller/getMoviesController.dart';

import '../../model/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetMoviesController getMoviesController = GetMoviesController();
  late Future<List<MovieModel>> movies;

  @override
  void initState() {
    movies = getMoviesController.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.yellow,
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'The House of Horror',
          ),
        ),
      ),
      body: FutureBuilder(
        future: movies,
        builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Em cartaz',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CarouselSlider(
                        items: snapshot.data!.take(5).map((poster) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  top: 20,
                                  bottom: 20,
                                ),
                                width: 220,
                                height: 250,
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
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/${poster.posterPath}'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1.2,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Em breve',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: movies,
                    builder:
                        (context, AsyncSnapshot<List<MovieModel>> snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 6; i < 11; i++)
                                Card(
                                  color: Colors.yellow,
                                  child: SizedBox(
                                    width: 100,
                                    height: 150,
                                    child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/${snapshot.data![i].posterPath}'),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Instagram',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      Text(
                        'Instagram',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      Text(
                        'Twitter',
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Meus tickets',
          icon: Icon(Icons.calendar_month_outlined),
        ),
      ]),
    );
  }
}
