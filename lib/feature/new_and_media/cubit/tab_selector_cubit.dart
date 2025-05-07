import 'package:bloc/bloc.dart';

part 'tab_selector_state.dart';

class TabSelectorCubit extends Cubit<TabSelectorState> {
  TabSelectorCubit() : super(const TabSelectorState(selectedTab: TabType.news));

  void selectTab(TabType tab) {
    emit(TabSelectorState(selectedTab: tab));
  }
}
