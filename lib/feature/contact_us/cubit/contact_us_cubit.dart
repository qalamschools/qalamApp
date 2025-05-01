import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qalam_app/core/utils/common_utils.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsState.initial());

  final TextEditingController email = TextEditingController();

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

  void isChecked({bool? isChecked}) {
    if (state is ContactUsDataState) {
      final currentState = state as ContactUsDataState;
      emit(currentState.copyWith(isChecked: isChecked));
    }
    
  }

  void submitButton() {
    (bool,String) isValid = CommonUtils.validateEmail(email.text);
    if (isValid.$1) {
    } else {
      emit(ContactUsState.error(isValid.$2));
    }
  }
}
