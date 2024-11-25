import 'package:cinema_ticket_app/widgets/neumorphic_button.dart';
import 'package:flutter/material.dart';

class TicketConfirmationPage extends StatelessWidget {
  const TicketConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Text(
                'The Batman',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                '4 March',
                style: TextStyle(
                    color: Colors.white.withOpacity(.3), fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          bottom: 30,
          left: 0,
          right: 0,
          child: Image.asset('assets/ticket_bg.png'),
        ),
        Positioned(
            top: 145,
            // bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(children: [
                  Center(child: Image.asset('assets/ticket.png')),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 52),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            'VIP',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            'Movie Theater',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            '12',
                            style: TextStyle(color: Colors.white, fontSize: 32),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Order Number',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            '180302',
                            style: TextStyle(color: Colors.white, fontSize: 32),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset(
                            'assets/bmc_qr.png',
                            color: Colors.white,
                            width: 150,
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ],
            )),
        Positioned(
          bottom: 160,
          child: NeumorphicButton(
              onTap: () {
                debugPrint('downloading');
              },
              shape: BoxShape.rectangle,
              width: 85,
              height: 65,
              child: Image.asset('assets/download.png')),
        ),
      ]),
      backgroundColor: const Color(0xFF1C1C1C),
    );
  }
}
