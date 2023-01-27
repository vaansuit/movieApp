import 'package:flutter/material.dart';
import 'package:movie_app/app/model/seat_model.dart';

import 'widgets/seats.dart';

class BuyTicketPage extends StatefulWidget {
  const BuyTicketPage({super.key});

  @override
  _BuyTicketPageState createState() => _BuyTicketPageState();
}

class _BuyTicketPageState extends State<BuyTicketPage> {
  List<SeatModel> seats = List.generate(30, (index) => SeatModel(id: index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.yellow,
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Escolha seu assento!',
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            height: 70,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromARGB(255, 53, 52, 52),
            ),
            child: const Center(
              child: Text(
                'TELA',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: seats.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    seats[index].isSelected = !seats[index].isSelected;
                  });
                },
                child: SeatWidget(seat: seats[index]),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          // Confirm reservation
          double totalPrice = seats
              .where((seat) => seat.isSelected)
              .map((seat) => seat.price)
              .toList()
              .reduce((value, element) => value + element);
          int countSelected =
              seats.where((seat) => seat.isSelected).toList().length;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Confirmation"),
                content: Text(
                    "You have selected $countSelected seats for a total of $totalPrice"),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.check,
          color: Colors.black,
        ),
      ),
    );
  }
}
