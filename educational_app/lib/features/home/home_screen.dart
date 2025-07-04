import 'package:educational_app/core/constants/app_paths.dart';
import 'package:educational_app/core/theme/theme.dart';
import 'package:educational_app/features/home/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset(
                AppPaths.categoryIcon,
                width: 40.w,
                height: 40.h,
              ),
              onPressed: () {},
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
            IconButton(
              icon: Image.asset(AppPaths.avatar, width: 40.w, height: 40.h),
              onPressed: () {},
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Morteza',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'What do you want to learn?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 8.w,
                      ), // Add left padding here
                      child: Icon(Icons.search, size: 24.sp),
                    ),
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: Colors.grey, width: 1.w),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                  ),
                ),
              ),

              // the ads image
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Image.asset(AppPaths.courseAd),
              ),

              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Course',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: TextButton(onPressed: () {}, child: Text('See All')),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: TextButton(onPressed: () {}, child: Text('All')),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          'Design',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Programming'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: TextButton(onPressed: () {}, child: Text('UX')),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              CourseCard(
                imagePath: AppPaths.course1,
                title: 'Photoshop Course',
                rating: 4.5,
                duration: '5h 15min',
              ),
              SizedBox(height: 10.h),
              CourseCard(
                imagePath: AppPaths.course2,
                title: '3D Design',
                rating: 5.0,
                duration: '10h 15min',
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      // home , My Courses, Blogs, Profile
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // label'lar her zaman gözüksün
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, size: 28),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article, size: 28),
            label: 'Blogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {},
      ),
    );
  }
}
