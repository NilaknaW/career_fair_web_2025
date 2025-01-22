import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'gallery.dart';
import 'bottomcontact.dart';
import 'video.dart';
import 'register.dart';

final GlobalKey galleryKey = GlobalKey();
final GlobalKey registerKey = GlobalKey();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ENTC Career Fair',
      home: HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF020237),
          secondary: Color(0xFF094c69),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          leading: Image.asset(
            'assets/images/logo_cf.png',
            fit: BoxFit.contain,
          ),
          leadingWidth: 100,
          actions: _appBarButtons,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.black12),
      body: Stack(
        children: [
          _background(context),
          Column(
            children: [
              Expanded(
                flex: 8,
                child: content(context),
              ),
              Expanded(
                flex: 2,
                child: ContactsWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// final String url = "https://ent.uom.lk/";
// final String url =
//     "https://script.google.com/macros/s/AKfycbwFEtyvw-uX45twwTnwVUMVVQM4aIMbN8kbMoKCK2XeOct33dOJwDHRnTjHO4mIqR-q/exec";

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

List<Widget> _appBarButtons = [
  TextButton(
    onPressed: () {
      // Scroll to the gallery section
      Scrollable.ensureVisible(
        registerKey.currentContext!,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    },
    // child: Icon(Icons.photo_album, color: Colors.white),
    child: Text('Register', style: TextStyle(color: Color(0xFF020237))),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.4)),
    ),
  ),
  SizedBox(width: 10),
  TextButton(
    onPressed: () {
      // Scroll to the gallery section
      Scrollable.ensureVisible(
        galleryKey.currentContext!,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    },
    // child: Icon(Icons.photo_album, color: Colors.white),
    child: Text('Gallery', style: TextStyle(color: Color(0xFF020237))),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.4)),
    ),
  ),
  SizedBox(width: 10),
  TextButton(
    onPressed: () => launchURL(
      "https://script.google.com/macros/s/AKfycbyxXkgnfgfxOrxTM1oRS42ob4dJ5wkUlZG1Wuk8FO4w2kPM-FT6mcF1qkDp2DLyEc4/exec",
    ),
    // child: Icon(Icons.photo_album, color: Colors.white),
    child: Text('Student Profiles', style: TextStyle(color: Color(0xFF020237))),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.4)),
    ),
  ),
  SizedBox(width: 10),
];

Widget content(BuildContext context) {
  final ScrollController _scrollController = ScrollController();
  return Scrollbar(
    thumbVisibility: true,
    controller: _scrollController,
    child: SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          HomeWidget(),
          SizedBox(height: 20),
          VideoWidget(),
          SizedBox(height: 20),
          RegisterWidget(registerKey: registerKey),
          GalleryWidget(galleryKey: galleryKey),
        ],
      ),
    ),
  );
}

Widget _background(BuildContext context) {
  // add the left and right slanted images, and bottom gradient. home background
  double screenHeight = MediaQuery.of(context).size.height;
  return Stack(
    children: [
      // Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       colors: [
      //         // Color.fromARGB(255, 159, 208, 230),
      //         // Color.fromARGB(255, 157, 147, 245),
      //         // Color(0xFF031e4b),
      //         Color(0xFF094c69),
      //         Color.fromARGB(255, 159, 208, 230),
      //         Colors.white,
      //         // Color.fromARGB(255, 159, 208, 230),
      //         Color.fromARGB(255, 157, 147, 245),
      //         // Color(0xFF094c69),
      //         Color(0xFF031e4b),
      //       ],
      //     ),
      //   ),
      // ),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/left_pic_bg.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/right_pic_bg.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: screenHeight * 0.36,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xFF094c69),
                Color(0xFF031e4b),
              ],
              center: Alignment.center,
              radius: 1,
              stops: [0.5, 1.0],
            ),
          ),
        ),
      ),
    ],
  );
}
