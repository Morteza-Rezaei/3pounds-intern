import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/constants/colors.dart';
import 'package:food_delivery/shared/dummy/dummy_categories.dart';

class CategoryBottomSheet extends StatelessWidget {
  final Function(String? selected) onCategorySelected;
  final String? selectedCategory;

  const CategoryBottomSheet({
    super.key,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      children: [
        _buildTile(
          context,
          label: 'All',
          isSelected: selectedCategory == null,
          onTap: () {
            Navigator.pop(context);
            onCategorySelected(null);
          },
        ),
        ...dummyCategories.map((category) {
          return _buildTile(
            context,
            label: category.name,
            isSelected: category.name == selectedCategory,
            onTap: () {
              Navigator.pop(context);
              onCategorySelected(category.name);
            },
          );
        }).toList(),
      ],
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontSize: 18.sp,
          color: isSelected ? AppColors.primary : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}
