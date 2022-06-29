// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:untitled/componnents/main_componnents.dart';
// import 'package:untitled/shared/local_data/cache_helper.dart';
//
// class BoardingModel{
//   final String image;
//   final String title;
//   final String body;
//   BoardingModel(
//       {
//         required this.title,
//         required this.body,
//         required this.image
//       }
//       );
// }
//
// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({Key? key}) : super(key: key);
//   @override
//   _OnBoardingScreenState createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   List<BoardingModel> boarding =[
//     BoardingModel(title: 'On Board 1 Title', body: 'On Board 1 Body', image: 'assets/images/first.png'),
//     BoardingModel(title: 'On Board 2 Title', body: 'On Board 2 Body', image: 'assets/images/second.png'),
//     BoardingModel(title: 'On Board 3 Title', body: 'On Board 3 Body', image: 'assets/images/third.png'),
//   ];
//   bool isLast = false;
//   void onsubmit(){
//     CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
//       print(value);
//     });
//   }
//   var Boardingcontroller = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           defaultTextButton(
//               text: 'Skip',
//               myColor: Colors.white,
//               function: (){
//                 onsubmit();
//               }
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: Boardingcontroller,
//                 onPageChanged: (int index){
//                   if(index == boarding.length-1){
//                     setState(() {
//                       isLast = true;
//                       print(' last');
//                     });
//                   }else{
//                     setState(() {
//                       isLast=false;
//                       print('not last');
//                     });
//                   }
//                 },
//                 physics: BouncingScrollPhysics(),
//                 itemBuilder: (context, index) => buildboardingItem(boarding[index]),
//                 itemCount: 3,
//               ),
//             ),
//             SizedBox(
//               height: 70,
//             ),
//             Row(
//               children: [
//                 SmoothPageIndicator(
//                   controller: Boardingcontroller,
//                   count: boarding.length,
//                   effect:ExpandingDotsEffect(
//                       dotColor: Colors.blue,
//                       activeDotColor: Colors.blue,
//                       dotHeight: 10,
//                       dotWidth: 10.0,
//                       spacing: 5.0,
//                       expansionFactor: 4.0
//                   ) ,
//                 ),
//                 Text(
//                   'Indicator',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 Spacer(),
//                 FloatingActionButton(
//                   onPressed: () {
//                     if(isLast){
//                       onsubmit();
//                     }else{
//                       Boardingcontroller.nextPage(
//                           duration: Duration(milliseconds: 750),
//                           curve: Curves.fastLinearToSlowEaseIn
//                       );
//                     }
//                   },
//                   child: Icon(Icons.arrow_forward_ios_sharp),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget buildboardingItem(BoardingModel model ) => Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Expanded(
//         child: Image(
//           image: AssetImage('${model.image}'),
//         ),
//       ),
//       SizedBox(
//         height: 30.0,
//       ),
//       Text(
//         '${model.title}',
//         style: TextStyle(
//           fontSize: 24.0,
//           // fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(
//         height: 30.0,
//       ),
//       Text(
//         '${model.body}',
//         style: TextStyle(
//           fontSize: 18.0,
//           fontWeight: FontWeight.bold
//         ),
//       ),
//       SizedBox(
//         height: 30.0,
//       ),
//
//       // PageView.builder(itemBuilder: (context,index)=>)
//     ],
//   );
// }