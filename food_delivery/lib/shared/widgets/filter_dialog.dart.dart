import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/core/constants/paths.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: 16.h),
              _buildSectionTitle('OFFERS'),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  _SelectableChip(label: 'Delivery', selected: true),
                  _SelectableChip(label: 'Pick Up'),
                  _SelectableChip(label: 'Offer'),
                  _SelectableChip(label: 'Online payment available'),
                ],
              ),
              SizedBox(height: 16.h),
              _buildSectionTitle('DELIVER TIME'),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  _SelectableChip(label: '10-15 min', selected: true),
                  _SelectableChip(label: '20 min'),
                  _SelectableChip(label: '30 min'),
                ],
              ),
              SizedBox(height: 16.h),
              _buildSectionTitle('PRICING'),
              Row(
                children: [
                  _SelectableCircle(label: '\$', selected: false),
                  _SelectableCircle(label: '\$\$', selected: true),
                  _SelectableCircle(label: '\$\$\$', selected: false),
                ],
              ),
              SizedBox(height: 16.h),
              _buildSectionTitle('RATING'),
              Row(
                children: List.generate(5, (i) {
                  return _SelectableStar(
                    selected: i < 4, // 4 yıldız seçili
                    isLast: i == 4, // bu olmazsa ,ekranı taşır
                  );
                }),
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('FILTER'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Filter your search', style: TextStyle(fontSize: 18.sp)),
      IconButton(
        icon: Image.asset(AppPaths.exit, width: 48.w, height: 48.h),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  );
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h),
    child: Text(title, style: TextStyle(fontSize: 13.sp)),
  );
}

class _SelectableChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _SelectableChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) {},
      selectedColor: AppColors.primaryLight,
      backgroundColor: Colors.grey.shade100,
      labelStyle: TextStyle(
        fontSize: 14.sp,
        color: selected ? Colors.white : Colors.black,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.r)),
      showCheckmark: false,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      side: BorderSide(
        color: selected ? Colors.transparent : Colors.grey.shade300,
        width: 2.w,
      ),
    );
  }
}

class _SelectableCircle extends StatelessWidget {
  final String label;
  final bool selected;

  const _SelectableCircle({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.r,
      height: 44.r,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? AppColors.primaryLight : Colors.grey.shade100,
        border: Border.all(
          color: selected ? Colors.transparent : Colors.grey.shade300,
          width: 2.w,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class _SelectableStar extends StatelessWidget {
  final bool selected;
  final bool isLast;

  const _SelectableStar({required this.selected, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isLast ? 0 : 16.w),
      child: Container(
        width: 44.r,
        height: 44.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 2.w),
        ),
        child: Icon(
          Icons.star,
          color: selected ? AppColors.primaryLight : Colors.grey.shade300,
          size: 20.r,
        ),
      ),
    );
  }
}
