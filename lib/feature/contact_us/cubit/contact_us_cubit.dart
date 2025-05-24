import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qalam_app/core/constants/remote_config_constants.dart';
import 'package:qalam_app/core/utils/common_utils.dart';
import 'package:qalam_app/core/commons/data/repository/remote_config_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final _remoteConfigRepository = GetIt.I<RemoteConfigRepository>();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  ContactUsCubit() : super(ContactUsState.initial());

  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController comments = TextEditingController();

  void toggleDropdown(bool expanded) {
    if (state is ContactUsDataState) {
      emit((state as ContactUsDataState).copyWith(isExpanded: expanded));
    }
  }

  Future<void> fetchReasonForContactingDropdown() async {
    try {
      final jsonString = _remoteConfigRepository
          .getJson(RemoteConfigConstants.reasonForContactingDropDown);
      final decoded = json.decode(jsonString);
      final List<String> dropdownItems =
          List<String>.from(decoded['dropdown'] ?? []);

      emit(ContactUsDataState(
        isSubmitted: false,
        isConsentChecked: false,
        reasons: dropdownItems,
        selectedReason: const [],
        isExpanded: false,
        isChecked: false,
        hasError: false,
      ));
    } catch (e) {
      emit(ContactUsState.error(
          "Failed to load contact dropdown: \${e.toString()}"));
    }
  }

  void clearFields() {
    fullname.clear();
    email.clear();
    mobileNumber.clear();
    comments.clear();

    if (state is ContactUsDataState) {
      emit((state as ContactUsDataState).copyWith(
        isExpanded: false,
        selectedReason: const [],
        isChecked: false,
        hasError: false,
        isConsentChecked: false,
        isSubmitted: false,
      ));
    }
  }

  void updateSelectedReasons(List<String> updatedReasons) {
    if (state is ContactUsDataState) {
      emit((state as ContactUsDataState)
          .copyWith(selectedReason: updatedReasons));
    }
  }

  void isConsentChecked({required bool isConsentChecked}) {
    if (state is ContactUsDataState) {
      emit((state as ContactUsDataState)
          .copyWith(isConsentChecked: isConsentChecked));
    }
  }

  void submitButton() {
    final isValid = CommonUtils.validateEmail(email.text);
    if (isValid && state is ContactUsDataState) {
      emit((state as ContactUsDataState).copyWith(isSubmitted: true));
    }
  }

  void resetSubmission() {
    if (state is ContactUsDataState) {
      emit((state as ContactUsDataState).copyWith(isSubmitted: false));
    }
  }
}
