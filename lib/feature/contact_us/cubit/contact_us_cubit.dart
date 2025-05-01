import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsState.initial());

  void toggleDropdown(bool expanded) {
    final current = state as ContactUsDataState;
    emit(current.copyWith(isExpanded: expanded));
  }

  void updateSelectedReasons(List<String> updatedReasons) {
    if (state is ContactUsDataState) {
      final currentState = state as ContactUsDataState;
      emit(currentState.copyWith(selectedReason: updatedReasons));
    }
  }
}
