import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qalam_app/core/commons/data/repository/remote_config_repo.dart';
import 'package:qalam_app/core/constants/remote_config_constants.dart';
import 'package:qalam_app/core/utils/common_utils.dart';

part 'admission_and_fee_bloc_state.dart';

class AdmissionAndFeeBlocCubit extends Cubit<AdmissionAndFeeState> {
  AdmissionAndFeeBlocCubit() : super(AdmissionAndFeeState.initial());
  final _remoteConfigRepository = GetIt.I<RemoteConfigRepository>();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController comments = TextEditingController();
  void submitButton() {
    (bool, String) isValid = CommonUtils.validateEmail(email.text);

    if (isValid.$1) {
    } else {
      emit(AdmissionAndFeeState.error(isValid.$2));
    }
  }

  String getContactFormLink() {
    final formLink = _remoteConfigRepository
        .getString(RemoteConfigConstants.contactFormLink);
    return formLink;
  }

  void toggleCheckbox(bool value) {
    emit(AdmissionAndFeeState.checkboxChanged(value));
  }
}
