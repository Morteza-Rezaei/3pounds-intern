import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/shared/models/meal_entity.dart';

class MealCard extends StatelessWidget {
  final MealEntity meal;
  final bool addToCartVisible;
  // function
  final VoidCallback mealDetailCallback;

  const MealCard({
    super.key,
    required this.meal,
    this.addToCartVisible = false,
    required this.mealDetailCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: mealDetailCallback,
      child: SizedBox(
        height: 180.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Gölge burada ayrı bir layer olarak çizilir
            Positioned.fill(
              top: 50.h,
              child: CustomPaint(painter: ShadowPainter(radius: 24.r)),
            ),

            Positioned.fill(
              top: 50.h,
              child: ClipPath(
                clipper: TrapezoidClipper(radius: 24.r),
                child: Container(
                  padding: EdgeInsets.only(top: 48.h, left: 12.w, right: 12.w),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        meal.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        meal.restaurantName,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (addToCartVisible) ...[
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${meal.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(meal.imageUrl, height: 100.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShadowPainter extends CustomPainter {
  final double radius;
  ShadowPainter({required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final path = TrapezoidClipper(radius: radius).getClip(size);

    final shadowPaint = Paint()
      ..color = Colors.black.withAlpha(20)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 12);

    canvas.drawPath(path.shift(Offset(0, 4)), shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TrapezoidClipper extends CustomClipper<Path> {
  final double radius;
  TrapezoidClipper({required this.radius});

  @override
  Path getClip(Size size) {
    final path = Path();

    final double topLeftX = size.width * 0.1;
    final double topRightX = size.width * 0.9;

    path.moveTo(topLeftX + radius, 0);

    // Üst kenar
    path.lineTo(topRightX - radius, 0);
    path.quadraticBezierTo(topRightX, 0, topRightX, radius);

    // Sağ eğik kenar
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );

    // Alt kenar
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // Sol eğik kenar
    path.lineTo(topLeftX, radius);
    path.quadraticBezierTo(topLeftX, 0, topLeftX + radius, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
