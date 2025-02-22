// import 'package:flutter/material.dart';
// // import 'dart:ui';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:pattern_background/pattern_background.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'ENTC Career Fair',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       // appBar: AppBar(
//       // ),
//       body: Stack(
//         children: [
//           _background(context),
//           // CustomPaint(
//           //   size: Size(width, height),
//           //   painter: DotPainter(
//           //     dotColor: Colors.black12,
//           //     dotRadius: 2,
//           //     spacing: 10,
//           //   ),
//           // ),
//           // Image.asset(
//           //   'assets/images/1.png',
//           //   width: width,
//           //   fit: BoxFit.fitWidth,
//           // ),
//           Column(
//             children: [
//               Expanded(
//                 flex: 8,
//                 child: _content(context),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: _ending(context),
//               ),
//             ],
//           )
//         ],
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }

// Widget _background(BuildContext context) {
//   double screenHeight = MediaQuery.of(context).size.height;
//   return Stack(
//     children: [
//       Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Image.asset(
//                 'assets/images/left_pic_bg.png',
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: Image.asset(
//                 'assets/images/right_pic_bg.png',
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//           ),
//         ],
//       ),
//       Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           height: screenHeight * 0.36,
//           decoration: BoxDecoration(
//             gradient: RadialGradient(
//               colors: [
//                 Color(0xFF094c69),
//                 Color(0xFF031e4b),
//               ],
//               center: Alignment.center,
//               radius: 1,
//               stops: [0.5, 1.0],
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _content(BuildContext context) {
//   double screenHeight = MediaQuery.of(context).size.height;
//   double screenWidth = MediaQuery.of(context).size.width;

//   return SingleChildScrollView(
//     padding: EdgeInsets.zero,
//     child: Center(
//       child: Column(
//         children: [
//           SizedBox(height: 40),
//           Text('UNIVERISTY OF MORATUWA',
//               style: GoogleFonts.poppins(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF020237)),
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center),
//           Image.asset('assets/images/logo_cf.png', height: screenHeight * 0.36),
//           _boxedText('Unfolding on 30th of January 2025 at ENTC', screenWidth),
//           Container(
//             // height: screenHeight * 0.2,
//             color: Colors.white,
//             width: screenWidth * 0.75,
//             child: Center(child: _countdown()),
//           ),
//           _boxedText(
//             'Interested in participating as an organization ? ',
//             screenWidth,
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _ending(BuildContext context) {
//   // double screenHeight = MediaQuery.of(context).size.height;
//   double screenWidth = MediaQuery.of(context).size.width;
//   return Container(
//     alignment: Alignment.center,
//     width: screenWidth,
//     decoration: BoxDecoration(
//       gradient: RadialGradient(
//         colors: [
//           Color(0xFF094c69),
//           Color(0xFF031e4b),
//         ],
//         center: Alignment.center,
//         radius: 2.5,
//         stops: [0.5, 1.0],
//       ),
//     ),
//     child: Row(
//       children: [
//         Expanded(
//           flex: 1,
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Image.asset('assets/images/left_arrow.png'),
//           ),
//         ),
//         Expanded(
//           flex: 8,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 _reachOut(context),
//                 SizedBox(
//                   width: 200,
//                   child: Image.asset(
//                     'assets/images/entc_logo.png',
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: Image.asset('assets/images/right_arrow.png'),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget _countdown() {
//   DateTime endDate = DateTime(2025, 1, 30, 0, 0, 0);
//   return FittedBox(
//     fit: BoxFit.scaleDown,
//     child: TimerCountdown(
//       format: CountDownTimerFormat.daysHoursMinutesSeconds,
//       endTime: endDate,
//       onEnd: () {
//         print("Today is the day!");
//       },
//       timeTextStyle: GoogleFonts.oswald(
//         fontSize: 60,
//         fontWeight: FontWeight.bold,
//         color: Color(0xFF020237),
//       ),
//       colonsTextStyle: GoogleFonts.oswald(
//         fontSize: 40,
//         // fontWeight: FontWeight.bold,
//         color: Color(0xFF020237),
//       ),
//       descriptionTextStyle: GoogleFonts.oswald(
//         fontSize: 18,
//         color: Color(0xFF020237),
//       ),
//       spacerWidth: 20,
//     ),
//   );
// }

// Widget _reachOut(BuildContext context) {
//   return Container(
//     // padding: EdgeInsets.all(6),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.email,
//           color: Colors.white,
//           size: 50,
//         ),
//         const SizedBox(width: 12),
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Reach out to us at',
//               style: GoogleFonts.poppins(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFFFdc45)),
//               // textAlign: TextAlign.center)
//             ),
//             TextButton(
//               onPressed: _launchMailto,
//               child: Text('careerfair.entc.uom@gmail.com',
//                   style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       // fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                   textAlign: TextAlign.start),
//               style: TextButton.styleFrom(
//                 padding: EdgeInsets.zero, // Removes button padding
//                 minimumSize: Size.zero, // Removes minimum size constraints
//                 tapTargetSize:
//                     MaterialTapTargetSize.shrinkWrap, // Shrinks the touch area
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget _boxedText(String text, double screenWidth) {
//   return Container(
//     padding: EdgeInsets.all(6),
//     width: screenWidth * 0.75,
//     // margin: EdgeInsets.all(20),
//     decoration: BoxDecoration(
//       gradient: RadialGradient(
//         colors: [
//           Color(0xFF094c69),
//           Color(0xFF031e4b),
//         ],
//         center: Alignment.center,
//         radius: 1,
//         // stops: [0.5, 1.0],
//       ),
//     ),
//     child: Text(text,
//         style: GoogleFonts.poppins(
//             fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//         // overflow: TextOverflow.ellipsis,
//         textAlign: TextAlign.center),
//   );
// }

// // Function to launch mailto
// void _launchMailto() async {
//   const email = 'mailto:careerfair.entc.uom@gmail.com';
//   try {
//     await launchUrlString(email);
//   } catch (e) {
//     // await Clipboard.setData(ClipboardData(text: targetEmail));
//   }
// }
