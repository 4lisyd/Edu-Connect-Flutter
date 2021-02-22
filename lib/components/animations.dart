// import 'package:flutter/material.dart';
//
// class animationText_Gradient extends StatefulWidget {
//   final String text;
//   animationText_Gradient(this.text);
//
//   @override
//   _animationText_GradientState createState() => _animationText_GradientState();
// }
//
// class _animationText_GradientState extends State<animationText_Gradient>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;
//   Animation _animation;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 786),
//     );
//
//     _animationController.repeat(reverse: true);
//     _animation = Tween(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(_animationController)
//       ..addListener(() {
//         setState(() {});
//       });
//     super.initState();
//   }
//
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _animationController.dispose();
//     //instead of your controller.dispose
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ShaderMask(
//         child: Text(
//           widget.text,
//           style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
//         ),
//         shaderCallback: (rect) {
//           return LinearGradient(stops: [
//             _animation.value - 0.5,
//             _animation.value,
//             _animation.value + 0.8,
//             // 0.3,
//             // 0.8,
//             // 0.9
//           ], colors: [
//             Theme.of(context).accentColor,
//             Theme.of(context).primaryColor,
//             Theme.of(context).backgroundColor,
//           ]).createShader(rect);
//         },
//       ),
//     );
//   }
// }
