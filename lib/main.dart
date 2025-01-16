import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:galleryimage/galleryimage.dart';

final GlobalKey _galleryKey = GlobalKey();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ENTC Career Fair',
      home: HomePage(),
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      // ),
      body: Stack(
        children: [
          _background(context),
          Column(
            children: [
              Expanded(
                flex: 8,
                child: _content(context),
              ),
              Expanded(
                flex: 2,
                child: _ending(context),
              ),
            ],
          ),
          _galleryButton(),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
} // Key to identify the gallery section

Widget _galleryButton() {
  return Positioned(
    top: 10.0,
    right: 10.0,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xFF020237),
        overlayColor: Color(0xFF020237),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        // Scroll to the gallery section
        Scrollable.ensureVisible(
          _galleryKey.currentContext!,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      },
      // child: Icon(Icons.photo_album, color: Colors.white),
      child: Text('Gallery', style: TextStyle(color: Color(0xFF020237))),
    ),
  );
}

Widget _background(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return Stack(
    children: [
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
          decoration: BoxDecoration(
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

Widget _content(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        _mainContent(context),
        _gallery(context),
      ],
    ),
  );
}

Widget _mainContent(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    height: screenHeight * 0.8,
    child: FittedBox(
      // padding: EdgeInsets.zero,
      fit: BoxFit.fitHeight,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('UNIVERISTY OF MORATUWA',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF020237)),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
            Image.asset(
              'assets/images/logo_cf.png',
              height: screenHeight * 0.36,
              width: screenWidth,
            ),
            _boxedText('On 30th of January 2025\nat ENTC', screenWidth),
            Container(
              // height: screenHeight * 0.2,
              color: Colors.white,
              width: screenWidth * 0.75,
              child: Center(child: _countdown()),
            ),
            _boxedText(
              'Want to Participate ? ',
              screenWidth,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _ending(BuildContext context) {
  // double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return Container(
    alignment: Alignment.center,
    width: screenWidth,
    decoration: BoxDecoration(
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
                SizedBox(
                  width: 200,
                  child: Image.asset(
                    'assets/images/entc_logo.png',
                    fit: BoxFit.contain,
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

Widget _countdown() {
  DateTime endDate = DateTime(2025, 1, 30, 0, 0, 0);
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: TimerCountdown(
      format: CountDownTimerFormat.daysHoursMinutesSeconds,
      endTime: endDate,
      onEnd: () {
        print("Today is the day!");
      },
      timeTextStyle: GoogleFonts.oswald(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: Color(0xFF020237),
      ),
      colonsTextStyle: GoogleFonts.oswald(
        fontSize: 40,
        // fontWeight: FontWeight.bold,
        color: Color(0xFF020237),
      ),
      descriptionTextStyle: GoogleFonts.oswald(
        fontSize: 18,
        color: Color(0xFF020237),
      ),
      spacerWidth: 20,
    ),
  );
}

Widget _reachOut(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
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
                  color: Color(0xFFFFdc45)),
              // textAlign: TextAlign.center)
            ),
            TextButton(
              onPressed: _launchMailto,
              child: Text('careerfair.entc.uom@gmail.com',
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.start),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero, // Removes button padding
                minimumSize: Size.zero, // Removes minimum size constraints
                tapTargetSize:
                    MaterialTapTargetSize.shrinkWrap, // Shrinks the touch area
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _boxedText(String text, double screenWidth) {
  return Container(
    padding: EdgeInsets.all(6),
    width: screenWidth * 0.75,
    decoration: BoxDecoration(
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
    child: Text(text,
        style: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        // overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center),
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

Widget _gallery(context) {
  return Column(
    key: _galleryKey,
    children: [
      SizedBox(height: 20),
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 181, 216, 231),
            Color.fromARGB(255, 157, 184, 232),
          ]),
        ),
        child: Column(
          children: [
            Text(
              'Highlights from the previous year',
              style: GoogleFonts.poppins(
                fontSize: 28,
                // fontWeight: FontWeight.bold,
                color: Color(0xFF020237),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _photoViewer(),
          ],
        ),
      )
    ],
  );
}

Widget _photoViewer() {
  final int imagesPerPage = 10; // 2 rows * 5 columns
  int currentPage = 0;
  List<String> imagePaths = List.generate(
    28,
    (index) => 'assets/images/gallery/${index + 1}.jpeg',
  );

  List<String> currentImages(int currentPage) {
    int startIndex = 0; // Start from the beginning for "Show Less"
    int endIndex = (currentPage + 1) * imagesPerPage;
    return imagePaths.sublist(
      startIndex,
      endIndex > imagePaths.length ? imagePaths.length : endIndex,
    );
  }

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: currentImages(currentPage).length,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  currentImages(currentPage)[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (currentPage > 0)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF094c69),
                  ),
                  onPressed: () {
                    setState(() {
                      currentPage = 0; // Reset to the first page
                    });
                  },
                  child: Text('Show Less'),
                ),
              if ((currentPage + 1) * imagesPerPage < imagePaths.length)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF094c69),
                  ),
                  onPressed: () {
                    setState(() {
                      if ((currentPage + 1) * imagesPerPage <
                          imagePaths.length) {
                        currentPage++;
                      }
                    });
                  },
                  child: Text('Show More'),
                ),
            ],
          ),
        ],
      );
    },
  );
}
