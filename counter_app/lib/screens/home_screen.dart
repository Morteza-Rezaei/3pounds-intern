import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/counter_provider.dart';
import '../providers/theme_provider.dart' as theme_provider;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final isDark = ref.watch(theme_provider.themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed:
                () =>
                    ref
                        .read(theme_provider.themeProvider.notifier)
                        .toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 64.sp, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 20.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              onPressed: () => ref.read(counterProvider.notifier).increment(),
              icon: const Icon(Icons.add, size: 32),
              label: Text('Arttır', style: TextStyle(fontSize: 24.sp)),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.r,
                      horizontal: 20.r,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () => ref.read(counterProvider.notifier).reset(),
                  icon: const Icon(Icons.refresh),
                  label: Text('Sıfırla', style: TextStyle(fontSize: 16.sp)),
                ),
                SizedBox(width: 32.w),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.r,
                      horizontal: 20.r,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed:
                      () => ref.read(counterProvider.notifier).decrement(),
                  icon: const Icon(Icons.remove),
                  label: Text('Azalt', style: TextStyle(fontSize: 16.sp)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
