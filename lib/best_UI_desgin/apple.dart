import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  final String text;
  final Animation<double> animation;
  final bool fromLeft;

  const AnimatedTextWidget({
    super.key,
    required this.text,
    required this.animation,
    this.fromLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final offsetX = fromLeft
            ? -100 + (100 * animation.value)
            : 100 - (100 * animation.value);

        return Opacity(
          opacity: animation.value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(offsetX, 0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 45,
                color: Color.fromARGB(255, 222, 15, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

// class Apple_State extends StatelessWidget {
//   final String text;
//   final Animation<double> animation;
//   final bool fromTop;
//   final bool fromleft;
//   const Apple_State({
//     super.key,
//     required this.text,
//     required this.animation,
//     this.fromTop = false,
//     this.fromleft = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // final double dx = fromleft ? -500.0 : 500.0;
//     // final double dy = fromTop ? -50.0 : 50.0;

//     // final offset = fromTop ? -5000.0 : 5000.0;

//     return AnimatedBuilder(
//       animation: animation,
//       builder: (context, child) {
//         final offsetX = fromleft
//             ? -100 + (100 * animation.value)
//             : 100 - (100 * animation.value);
//         return Opacity(
//           opacity: animation.value.clamp(0.0, 1.0),
//           child: Transform.translate(
//             offset: Offset( offsetX,0),
//               // dx * (1 - animation.value),
//               // dy * (1 - animation.value),
            
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 45,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//           ),
//         ),
//           ),
//         );
//       },
     
//     );
//   }
// }
