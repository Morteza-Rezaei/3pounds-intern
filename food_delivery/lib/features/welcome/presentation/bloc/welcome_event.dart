part of 'welcome_bloc.dart';

abstract class WelcomeEvent {}

class PageChangedEvent extends WelcomeEvent {
  final int pageIndex;
  PageChangedEvent(this.pageIndex);
}

class MarkFirstOpenEvent extends WelcomeEvent {}
