import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomContainer extends StatelessWidget {
  final double opacity;
  final Color? color;

  const CustomContainer({Key? key, required this.opacity, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color fillColor = color ?? const Color.fromARGB(255, 252, 157, 69);

    return Container(
      width: 14.w, // Reduced width of the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          // Background Card
          Card(
            elevation: 4,
            child: Container(
              height: 5.5.h,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 253, 241, 231),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
          // X Shape Fill
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Apply border radius
            child: CustomPaint(
              size: Size(13.w, 6.h), // Adjust size of the custom paint
              painter: XShapePainter(opacity, fillColor),
            ),
          ),
        ],
      ),
    );
  }
}

class XShapePainter extends CustomPainter {
  final double opacity;
  final Color color;

  XShapePainter(this.opacity, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();

    if (opacity == 0.5) {
      // Draw half X for 50% opacity
      path.moveTo(0, 0);
      path.lineTo(size.width / 10, 4);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
    } else if (opacity == 1.0) {
      // Draw full X for 100% opacity
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
