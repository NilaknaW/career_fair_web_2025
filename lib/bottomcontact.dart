import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'main.dart';

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: screenWidth,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xFF094c69),
            Color(0xFF031e4b),
          ],
          center: Alignment.center,
          radius: 2.5,
          stops: [0.5, 1.0],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/images/left_arrow.png'),
            ),
          ),
          Expanded(
            flex: 6,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _reachOut(context),
                  ElevatedButton(
                    onPressed: () => launchURL("https://ent.uom.lk/"),
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.transparent),
                      shadowColor:
                          WidgetStateProperty.all(Colors.transparent),
                    ),
                    child: SizedBox(
                      width: 200,
                      child: Image.asset(
                        'assets/images/entc_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/images/right_arrow.png'),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _reachOut(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.email,
          color: Colors.white,
          size: 50,
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Reach out to us at',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFdc45)),
            ),
            TextButton(
              onPressed: _launchMailto,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero, // Removes button padding
                minimumSize: Size.zero, // Removes minimum size constraints
                tapTargetSize:
                    MaterialTapTargetSize.shrinkWrap, // Shrinks the touch area
              ),
              child: const Text('careerfair.entc.uom@gmail.com',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white),
                  textAlign: TextAlign.start),
            ),
          ],
        ),
      ],
    ),
  );
}

// Function to launch mailto
void _launchMailto() async {
  const email = 'mailto:careerfair.entc.uom@gmail.com';
  try {
    await launchUrlString(email);
  } catch (e) {
    // await Clipboard.setData(ClipboardData(text: targetEmail));
  }
}
