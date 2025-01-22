// import 'package:web_video_player/player.dart';
// import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'main.dart';

class VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          // Color(0xFF031e4b),
          // Color(0xFF094c69),
          Color.fromARGB(255, 159, 208, 230),
          Color.fromARGB(255, 157, 147, 245),
        ]),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Show side by side for wider screens
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: _introVideo(context),
                ),
                Expanded(
                  flex: 2,
                  child: _introWords(context),
                ),
              ],
            );
          } else {
            // Show one below the other for smaller screens
            return Column(
              children: [
                _introVideo(context),
                _introWords(context),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget _introVideo(context) {
  return Container(
    // color: Colors.white,
    child: SizedBox(
      // width: width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: HtmlWidget(
          // '''<iframe title="YouTube video player" src="https://www.youtube.com/embed/yRlwOdCK7Ho"</iframe>''',
          '''<p align="center"><iframe width="317" height="563" src="https://www.youtube.com/embed/EUMOnM0llIY?" title="ENTC Caer Fair 2025" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe><p align="center">'''),
    ),
  );
}

Widget _introWords(context) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Text(
          'Welcome to the Department of Electronic and Telecommunication Engineering',
          style: TextStyle(
            fontSize: 28,
            color: Color(0xFF020237),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          'At ENTC, we pride ourselves on being a hub of innovation and technological advancement in Sri Lanka. Our Department is at the forefront of shaping the next generation of engineers who drive change in fields like robotics, telecommunications, AI, and embedded systems.\nThis career fair is a bridge between our talented students and leading industry professionals. It’s an opportunity to explore cutting-edge technologies, network with experts, and discover pathways to a successful career. Join us in celebrating engineering excellence and fostering connections that shape the future!',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF020237),
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () => launchURL(
              "https://script.google.com/macros/s/AKfycbyxXkgnfgfxOrxTM1oRS42ob4dJ5wkUlZG1Wuk8FO4w2kPM-FT6mcF1qkDp2DLyEc4/exec"),
          // child: Icon(Icons.photo_album, color: Colors.white),
          child: Text(
            'View Student Profiles',
            style: TextStyle(
              color: Color(0xFF020237),
              // fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              // const Color.fromARGB(255, 159, 208, 230),
              Colors.white.withOpacity(0.8),
            ),
            // padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
