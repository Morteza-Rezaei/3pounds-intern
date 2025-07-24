import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/features/tracking/presentation/widgets/courier_info_card.dart';
import 'package:food_delivery/features/tracking/presentation/widgets/order_status_timeline.dart';
import 'package:food_delivery/shared/widgets/back_button.dart';
import 'package:latlong2/latlong.dart';
import 'package:food_delivery/core/constants/colors.dart';

class TrackMapPage extends StatelessWidget {
  const TrackMapPage({super.key});

  final LatLng start = const LatLng(37.732, -122.392); // örnek
  final LatLng end = const LatLng(37.741, -122.401); // örnek

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackBtn(isWhite: true),
        title: const Text('Track Order'),
        // add shadow to the title text
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.black.withAlpha(200),
              offset: const Offset(2, 2),
              blurRadius: 8,
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(initialCenter: start, initialZoom: 14.0),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.food_delivery',
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [start, end],
                    color: AppColors.primary,
                    strokeWidth: 8.0,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: start,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                  Marker(
                    point: end,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.delivery_dining,
                      color: Colors.orange,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const OrderDetailSheet(),
        ],
      ),
    );
  }
}

class OrderDetailSheet extends StatefulWidget {
  const OrderDetailSheet({super.key});

  @override
  State<OrderDetailSheet> createState() => _OrderDetailSheetState();
}

class _OrderDetailSheetState extends State<OrderDetailSheet> {
  bool _isExpanded = false;
  final DraggableScrollableController _dragController =
      DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    _dragController.addListener(_onDragChanged);
  }

  void _onDragChanged() {
    if (_dragController.isAttached) {
      final size = _dragController.size;
      final shouldExpand = size > 0.25;
      if (shouldExpand != _isExpanded) {
        setState(() {
          _isExpanded = shouldExpand;
        });
      }
    }
  }

  @override
  void dispose() {
    _dragController.removeListener(_onDragChanged);
    _dragController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _dragController,
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.7,

      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(60), blurRadius: 24.r),
            ],
          ),
          child: ListView(
            padding: EdgeInsets.only(
              top: 8.h,
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
            ),
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 80.w,
                  height: 8.h,
                  margin: EdgeInsets.only(bottom: 18.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      'assets/images/burger.png',
                      width: 65.r,
                      height: 65.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uttora Coffee House',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          'Ordered At 06 Sept, 10:00pm',
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                        SizedBox(height: 6.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '2x ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(text: 'Burger,  '),
                                ],
                              ),
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '4x ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(text: 'Sandwich'),
                                ],
                              ),
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Sadece sheet genişletildiğinde göster
              if (_isExpanded) ...[
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      "20 min",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                      ),
                    ),
                    Text(
                      "Estimated delivery time",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),

                    SizedBox(height: 20.h),

                    const OrderStatusTimeline(),

                    SizedBox(height: 40.h),

                    const CourierInfoCard(),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
