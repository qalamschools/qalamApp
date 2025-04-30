import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qalam_app/core/utils/common_utils.dart';

part 'admission_and_fee_bloc_state.dart';

class AdmissionAndFeeBlocCubit extends Cubit<AdmissionAndFeeState> {
  AdmissionAndFeeBlocCubit() : super(AdmissionAndFeeState.initial());

  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController comments = TextEditingController();
  void submitButton() {
    bool isValid = CommonUtils.validateEmail(email.text);

    if (isValid) {
      
    } else {
      emit(AdmissionAndFeeState.error("Please enter the valid email"));
    }
  }

  void toggleCheckbox(bool value) {
    emit(AdmissionAndFeeState.checkboxChanged(value));
  }
}
