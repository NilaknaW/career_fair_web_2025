import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class GalleryWidget extends StatelessWidget {
  final GlobalKey galleryKey;

  const GalleryWidget({Key? key, required this.galleryKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: galleryKey,
      children: [
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              // Color.fromARGB(255, 159, 208, 230),
              Color(0xFF031e4b),
              Color.fromARGB(255, 157, 147, 245),
              Color(0xFF094c69),
              Color(0xFF031e4b),
            ]),
          ),
          child: Column(
            children: [
              Text(
                'Highlights from the previous year',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  // fontWeight: FontWeight.bold,
                  // color: Color(0xFF020237),
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              // SizedBox(height: 20),
              _photoViewer(context),
            ],
          ),
        )
      ],
    );
  }
}

Widget _photoViewer(context) {
  int crossAxisCountResponsive = 5;
  if (MediaQuery.of(context).size.width > 600) {
    crossAxisCountResponsive = 5;
  } else {
    crossAxisCountResponsive = 2;
  }
  ;

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
              crossAxisCount: crossAxisCountResponsive,
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
                TextButton(
                  onPressed: () {
                    setState(() {
                      currentPage = 0; // Reset to the first page
                    });
                  },
                  child: Text('Show Less'),
                ),
              if ((currentPage + 1) * imagesPerPage < imagePaths.length)
                TextButton(
                  // style: ElevatedButton.styleFrom(
                  //   foregroundColor: Colors.white,
                  //   backgroundColor: Color(0xFF094c69),
                  // ),
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


// Widget _galleryButton() {
//   return Positioned(
//     top: 10.0,
//     right: 10.0,
//     child: OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         backgroundColor: Colors.transparent,
//         foregroundColor: Color(0xFF020237),
//         overlayColor: Color(0xFF020237),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       onPressed: () {
//         // Scroll to the gallery section
//         Scrollable.ensureVisible(
//           _galleryKey.currentContext!,
//           duration: Duration(seconds: 1),
//           curve: Curves.easeInOut,
//         );
//       },
//       // child: Icon(Icons.photo_album, color: Colors.white),
//       child: Text('Gallery', style: TextStyle(color: Color(0xFF020237))),
//     ),
//   );
// }
