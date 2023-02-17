// import 'package:flutter/material.dart';
//
// class StatisticsScreen extends StatelessWidget {
//   const StatisticsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Container(
//           width: 400,
//           height: 250,
//           decoration: BoxDecoration(
//             color: Colors.white,
//           ),
//           child: Container(
//             child: Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(left: 10, bottom: 15),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text('80'),
//                       30.ph,
//                       Text('60'),
//                       30.ph,
//                       Text('40'),
//                       30.ph,
//                       Text('20'),
//                       30.ph,
//                       Text('0'),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 50, bottom: 15),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         width: 300,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             MyColumnBar(
//                               percentage: 20,
//                               color: Color(0xffeffcef),
//                             ),
//                             25.pw,
//                             MyColumnBar(
//                               percentage: 30,
//                               color: Color(0xff85a088),
//                             ),
//                             25.pw,
//                             MyColumnBar(
//                               percentage: 80,
//                               color: Color(0xffeffcef),
//                             ),
//                             25.pw,
//                             MyColumnBar(
//                               percentage: 40,
//                               color: Color(0xff85a088),
//                             ),
//                             25.pw,
//                             MyColumnBar(
//                               percentage: 20,
//                               color: Color(0xffeffcef),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MyColumnBar extends StatelessWidget {
//   final Color? color;
//   final double percentage;
//
//   const MyColumnBar({
//     super.key,
//     required this.percentage,
//     this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final height = 250 * (percentage / 100);
//     return Column(
//       children: [
//         Text('${height.toInt()}'),
//         12.ph,
//         Container(
//           height: height,
//           width: 30,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
