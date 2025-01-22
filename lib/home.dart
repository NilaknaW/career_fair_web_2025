import 'package:career_fair_web/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.8,
      child: FittedBox(
        // padding: EdgeInsets.zero,
        fit: BoxFit.fitHeight,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text('UNIVERISTY OF MORATUWA',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF020237)),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center),
              Image.asset(
                'assets/images/logo_cf.png',
                height: screenHeight * 0.36,
                width: screenWidth,
              ),
              _boxedText(
                  Text('On 30th of January 2025\nat ENTC',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center),
                  screenWidth),
              Container(
                // height: screenHeight * 0.2,
                color: Colors.white,
                width: screenWidth * 0.75,
                child: Center(child: _countdown()),
              ),
              _boxedText(
                _registerElement(),
                screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget registerText() {
  return Text('Want to Participate ?',
      style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center);
}

Widget registerButton() {
  return TextButton(
    onPressed: () {
      // Scroll to the gallery section
      Scrollable.ensureVisible(
        registerKey.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    },
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.white.withOpacity(0.4)),
    ),
    // child: Icon(Icons.photo_album, color: Colors.white),
    child: Text(
      'Register!',
      style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

Widget _registerElement() {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        // Show side by side for wider screens
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            registerText(),
            const SizedBox(width: 20),
            registerButton(),
          ],
        );
      } else {
        // Show one below the other for smaller screens
        return Column(
          children: [
            registerText(),
            registerButton(),
          ],
        );
      }
    },
  );
}

Widget _countdown() {
  DateTime endDate = DateTime(2025, 1, 30, 0, 0, 0);
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: TimerCountdown(
      format: CountDownTimerFormat.daysHoursMinutesSeconds,
      endTime: endDate,
      onEnd: () {
        // print("Today is the day!");
      },
      timeTextStyle: GoogleFonts.oswald(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF020237),
      ),
      colonsTextStyle: GoogleFonts.oswald(
        fontSize: 40,
        // fontWeight: FontWeight.bold,
        color: const Color(0xFF020237),
      ),
      descriptionTextStyle: GoogleFonts.oswald(
        fontSize: 18,
        color: const Color(0xFF020237),
      ),
      spacerWidth: 20,
    ),
  );
}

Widget _boxedText(boxContent, double screenWidth) {
  return Container(
    padding: const EdgeInsets.all(6),
    width: screenWidth * 0.75,
    decoration: const BoxDecoration(
      gradient: RadialGradient(
        colors: [
          Color(0xFF094c69),
          Color(0xFF031e4b),
        ],
        center: Alignment.center,
        radius: 2,
        stops: [0.5, 1.0],
      ),
    ),
    child: boxContent,
  );
}
