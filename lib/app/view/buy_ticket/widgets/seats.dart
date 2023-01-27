import 'package:flutter/material.dart';

import '../../../model/seat_model.dart';

class SeatWidget extends StatelessWidget {
  final SeatModel seat;

  const SeatWidget({Key? key, required this.seat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: seat.isSelected ? Colors.red : Colors.green,
            border: Border.all(color: Colors.black),
          ),
          child: Center(child: Text('Cadeira ${seat.id}')),
        ),
      ],
    );
  }
}
