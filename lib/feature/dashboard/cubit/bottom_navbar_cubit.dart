import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navbar_state.dart';

class BottomNavbarCubit extends Cubit<BottomNavbarState> {
  BottomNavbarCubit() : super(const BottomNavbarState(selectedIndex: 0));

  void changeTab(int index) {
    emit(BottomNavbarState(selectedIndex: index));
  }

  void toggleQuickPay() {
    emit(state.copyWith(
        isQuickPayOpen: !state.isQuickPayOpen, isMoreOpen: false));
  }

  void toggleMore() {
    emit(state.copyWith(isMoreOpen: !state.isMoreOpen, isQuickPayOpen: false));
  }

  void closeSheets() {
    emit(state.copyWith(isQuickPayOpen: false, isMoreOpen: false));
  }
}
