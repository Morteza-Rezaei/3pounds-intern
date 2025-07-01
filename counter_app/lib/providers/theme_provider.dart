import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';
// GENERATED CODE - so we can use the `@riverpod` annotation
// Run the following command to generate the code:
// flutter pub run build_runner build --delete-conflicting-outputs

@riverpod
class Theme extends _$Theme {
  @override
  bool build() => false;

  void toggleTheme() => state = !state;
}
