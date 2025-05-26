import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qalam_app/core/commons/data/repository/remote_config_repo.dart';
import 'package:qalam_app/core/constants/remote_config_constants.dart';
import 'package:qalam_app/core/utils/common_utils.dart';
import 'package:qalam_app/feature/web_view_screen/presentation/webview_screen.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final _remoteConfigRepository = GetIt.I<RemoteConfigRepository>();
  DashboardCubit() : super(DashboardInitial());

  void otherApplicationFeeStripeLink(BuildContext context) async {
    final otherApplicationStripeUrl = _remoteConfigRepository
        .getString(RemoteConfigConstants.otherPaymentsStripeUrl);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WebViewScreen(
        url: otherApplicationStripeUrl,
      );
    }));
  }

  void applicationFeeStripeLink(BuildContext context) async {
    final applicationStripeUrl = _remoteConfigRepository
        .getString(RemoteConfigConstants.newAdmissionStripeUrl);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WebViewScreen(
        url: applicationStripeUrl,
      );
    }));
  }

  void callUs() {
    final mobileNumber =
        _remoteConfigRepository.getString(RemoteConfigConstants.mobileNumber);
    CommonUtils.openDialer(number: "+44$mobileNumber");
  }
}
