// import 'package:web_video_player/player.dart';
// import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class RegisterWidget extends StatelessWidget {
  final GlobalKey registerKey;

  const RegisterWidget({super.key, required this.registerKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: registerKey,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color.fromARGB(255, 159, 208, 230),
            // Color.fromARGB(255, 157, 147, 245),
            Color(0xFF031e4b),
            Color(0xFF094c69),
            Color.fromARGB(255, 157, 147, 245),
            Color(0xFF094c69),
            Color(0xFF031e4b),
          ],
        ),
        // gradient: RadialGradient(
        //   colors: [
        //     Color(0xFF094c69),
        //     Color(0xFF031e4b),
        //   ],
        //   center: Alignment.center,
        //   radius: 2,
        //   stops: [0.5, 1.0],
        // ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Show side by side for wider screens
            return Row(
              children: [
                Expanded(child: _proposal(context)),
                Expanded(child: _formlink(context)),
                Expanded(child: _recruitpdf(context)),
              ],
            );
          } else {
            // Show one below the other for smaller screens
            return Column(
              children: [
                _formlink(context),
                _proposal(context),
                _recruitpdf(context),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget _proposal(context) {
  return customCard(
      Image.asset(
        "assets/images/proposal.png",
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
      ),
      "Partnership Proposal",
      "https://drive.google.com/file/d/1unFf9XYN3__8hbeFpC1vWkA54_jNqbBq/view?usp=drive_link");
}

Widget _formlink(context) {
  return customCard(
    // Container(
    //   height: MediaQuery.of(context).size.height * 0.5,
    //   padding: EdgeInsets.all(20),
    //   child: Text(
    //       "Join our career fair to connect with talented students eager to shape the future. Showcase your company, build valuable networks, and discover exceptional candidates ready to contribute to your team. Register now to secure your spot!",
    //       style: TextStyle(
    //         color: Color(0xFF020237),
    //         fontSize: 20,
    //       ),
    //       textAlign: TextAlign.center),
    // ),
    Image.asset(
      "assets/images/29.jpeg",
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
    ),
    "Register Company",
    "https://docs.google.com/forms/d/e/1FAIpQLSd1mbFYNvbZBDG3RkIn5YG4e8DwNt2s1N0CeGSTPy2-PWDzpA/viewform?usp=sharing",
  );
}

Widget _recruitpdf(context) {
  return customCard(
    Image.asset(
      "assets/images/recruit.png",
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
    ),
    "Recruitment Directory",
    " ",
  );
}

Widget customCard(element1, buttonText, buttonLink) {
  return Card.outlined(
    borderOnForeground: true,
    color: const Color.fromARGB(0, 231, 229, 229),
    child: Column(
      children: [
        element1,
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () => launchURL(buttonLink),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              // const Color.fromARGB(255, 159, 208, 230),
              Colors.white.withOpacity(0.8),
            ),
            // padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          ),
          // child: Icon(Icons.photo_album, color: Colors.white),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Color(0xFF020237),
              // fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
