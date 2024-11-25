import 'package:cinema_ticket_app/widgets/header.dart';
import 'package:cinema_ticket_app/widgets/seat_selection_grid.dart';
import 'package:cinema_ticket_app/widgets/total_price.dart';
import 'package:flutter/material.dart';

class MovieSeatSelectionPage extends StatelessWidget {
  const MovieSeatSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const HeaderSection(),
            const SizedBox(height: 40),
        
            // Screen Section
            Center(child: Image.asset('assets/screen.png')),
            const SizedBox(height: 30),
        
            // Seat Selection Grid
            const Expanded(child: SeatSelectionGrid()),
        
            // Total Price Section
            const TotalPriceSection(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
