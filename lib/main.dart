import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieSeatSelectionPage(),
    );
  }
}

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
            const _HeaderSection(),
            const SizedBox(height: 40),
        
            // Screen Section
            Center(child: Image.asset('assets/screen.png')),
            const SizedBox(height: 30),
        
            // Seat Selection Grid
            const Expanded(child: _SeatSelectionGrid()),
        
            // Total Price Section
            const _TotalPriceSection(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ----------------------------
// Components and Widgets
// ----------------------------

// Header Section
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Batman",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "4 March",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF2E2E2E)),
            ),
            child: const Text(
              "22:30",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Seat Selection Grid
class _SeatSelectionGrid extends StatefulWidget {
  const _SeatSelectionGrid();

  @override
  State<_SeatSelectionGrid> createState() => _SeatSelectionGridState();
}

class _SeatSelectionGridState extends State<_SeatSelectionGrid> {
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

// Seat Widget
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

// Total Price Section
class _TotalPriceSection extends StatelessWidget {
  const _TotalPriceSection();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total:",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "€ 120",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        NeumorphicButton(),
      ],
    );
  }
}

// Neumorphic Button
class NeumorphicButton extends StatelessWidget {
  const NeumorphicButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Image.asset('assets/vector.png'),
        AnimatedScaleWidget(
        pressedScale: 0.9,
        duration: const Duration(milliseconds: 150),
        onTap: () {
          print('Button Pressed!');
        },
        child: Container(
          height: 90,
          width: 90,
          margin: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment(-1, -1),
              end: Alignment(1, 1),
              colors: [
                Color(0xff232527),
                Color(0xff151617),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(6, 6),
                blurRadius: 6,
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      ]
    );
  }
}

class AnimatedScaleWidget extends StatefulWidget {
  final Widget child; // The child widget to animate
  final double pressedScale; // Scale factor when pressed
  final Duration duration; // Duration of the animation
  final VoidCallback? onTap; // Tap event callback

  const AnimatedScaleWidget({
    super.key,
    required this.child,
    this.pressedScale = 0.8, // Default scale factor
    this.duration = const Duration(milliseconds: 200),
    this.onTap,
  });

  @override
  State<AnimatedScaleWidget> createState() => _AnimatedScaleWidgetState();
}

class _AnimatedScaleWidgetState extends State<AnimatedScaleWidget> {
  bool isPressed = false; // Tracks whether the widget is pressed

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true; // Scale down when pressed
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false; // Reset scale when released
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false; // Reset scale if press is canceled
        });
      },
      onTap: widget.onTap, // Trigger the onTap callback
      child: AnimatedScale(
        scale: isPressed ? widget.pressedScale : 1.0,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}
