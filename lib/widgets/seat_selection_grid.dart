// Seat Selection Grid
import 'package:cinema_ticket_app/widgets/animated_scale_widget.dart';
import 'package:cinema_ticket_app/widgets/seat.dart';
import 'package:flutter/material.dart';

class SeatSelectionGrid extends StatefulWidget {
  const SeatSelectionGrid({super.key});

  @override
  State<SeatSelectionGrid> createState() => SeatSelectionGridState();
}

class SeatSelectionGridState extends State<SeatSelectionGrid> {
  List<int> isOccupied = [5, 6, 11];
  List<int> isSelected = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 16,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          // Indices to rotate
          final rotatedIndices = [1, 4, 5, 8, 9, 12, 13, 16];
      
          // Determine if the seat is on the left or right edge
          bool isLeftEdge = index % 4 == 0;
          bool isRightEdge = (index + 1) % 4 == 0;
      
          // Calculate rotation angle
          double angle = 0;
          if (rotatedIndices.contains(index + 1)) {
            if (isLeftEdge) {
              angle = 10 * 3.14159 / 180; // Rotate to center (positive angle)
            } else if (isRightEdge) {
              angle = -10 * 3.14159 / 180; // Rotate to center (negative angle)
            } else {
              angle = 10 * 3.14159 / 180; // Default rotation
            }
          }
      
          return Transform.rotate(
            angle: angle,
            child: AnimatedScaleWidget(
              pressedScale: 0.8, // Scale down on press
              onTap: isOccupied.contains(index + 1)
                  ? null
                  : () {
                      setState(() {
                        if (isSelected.contains(index + 1)) {
                          isSelected.remove(index + 1);
                        } else {
                          isSelected.add(index + 1);
                        }
                      });
                    },
              child: SeatWidget(
                isSelected: isSelected.contains(index + 1),
                isOccupied: isOccupied.contains(index + 1),
              ),
            ),
          );
        },
      ),
    );
  }
}