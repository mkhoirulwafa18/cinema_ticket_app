// Seat Widget
import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  final bool isSelected;
  final bool isOccupied;

  const SeatWidget({
    super.key,
    required this.isSelected,
    required this.isOccupied,
  });

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    if (isOccupied) {
      seatColor = Colors.grey;
    } else if (isSelected) {
      seatColor = Colors.orange;
    } else {
      seatColor = Colors.white;
    }

    return SizedBox(
      height: 30,
      width: 30,
      child: Center(
        child: Image.asset(
          'assets/seat.png',
          color: seatColor,
        ),
      ),
    );
  }
}