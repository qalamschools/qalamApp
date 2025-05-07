part of 'tab_selector_cubit.dart';

enum TabType { news, events }

class TabSelectorState {
  final TabType selectedTab;

  const TabSelectorState({required this.selectedTab});
}
