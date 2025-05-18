import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:qalam_app/core/utils/common_utils.dart';
import 'package:qalam_app/feature/contact_us/data/repository/remote_config_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final RemoteConfigRepository _remoteConfigRepository;

  ContactUsCubit(this._remoteConfigRepository)
      : super(ContactUsState.initial());

  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController comments = TextEditingController();

  void toggleDropdown(bool expanded) {
    final current = state as ContactUsDataState;
    emit(current.copyWith(isExpanded: expanded));
  }

  Future<void> fetchReasonForContactingDropdown() async {
    try {
      await _remoteConfigRepository.initializeRemoteConfig();
      final jsonString =
          _remoteConfigRepository.getJson('reason_for_contacting_dropdown');
      final decoded = json.decode(jsonString);

      final List<String> dropdownItems =
          List<String>.from(decoded['dropdown'] ?? []);

      emit(ContactUsDataState(
          reasons: dropdownItems,
          selectedReason: const [],
          isExpanded: false,
          isChecked: false,
          hasError: false));
    } catch (e) {
      emit(ContactUsState.error(
          "Failed to load contact dropdown: ${e.toString()}"));
    }
  }

  void clearFields() {
    fullname.clear();
    email.clear();
    mobileNumber.clear();
    comments.clear();
    
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
    (bool, String) isValid = CommonUtils.validateEmail(email.text);
    if (isValid.$1) {
      emit(ContactUsState.success(
          "Congratulation!!, You have successfully submitted you info with us."));
    } else {
      emit(ContactUsState.error(isValid.$2));
    }
  }
}
