import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qalam_app/core/commons/data/repository/email_repository.dart';
import 'package:qalam_app/core/constants/remote_config_constants.dart';
import 'package:qalam_app/core/utils/common_utils.dart';
import 'package:qalam_app/core/commons/data/repository/remote_config_repo.dart';
import 'package:qalam_app/feature/contact_us/models/contact_us_form_model.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final _remoteConfigRepository = GetIt.I<RemoteConfigRepository>();
  final EmailRepository _repository;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  ContactUsCubit(this._repository) : super(ContactUsState.initial());

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
        isLoading: false,
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

  void submitButton() async {
    final isValid = CommonUtils.validateEmail(email.text);
    final contactState = state as ContactUsDataState;
    emit(contactState.copyWith(isLoading: true));
    if (isValid && state is ContactUsDataState) {
      final form = ContactUsFormModel(
        fullName: fullname.text,
        email: email.text,
        mobile: mobileNumber.text,
        reasons: contactState.selectedReason,
        comments: comments.text,
      );

      try {
        final result = await _repository.sendEmail(form,
            subject: "Contact Us Form Submission");
        if (result) {
          emit(contactState.copyWith(isSubmitted: true, isLoading: false));
          return;
        } else {
          emit(contactState.copyWith(isSubmitted: false, isLoading: false));
          return;
        }
      } catch (e) {
        emit(contactState.copyWith(isSubmitted: false, isLoading: false));
        print("Form submission failed: $e");
      }
    }
  }

  void resetSubmission() {
    if (state is ContactUsDataState) {
      emit((state as ContactUsDataState).copyWith(isSubmitted: false));
    }
  }
}
