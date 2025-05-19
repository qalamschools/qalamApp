import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:qalam_app/core/commons/data/repository/remote_config_repo.dart';
import 'package:qalam_app/core/constants/remote_config_constants.dart';
import 'package:qalam_app/core/utils/common_utils.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final _remoteConfigRepository = GetIt.I<RemoteConfigRepository>();
  DashboardCubit() : super(DashboardInitial());

  void otherApplicationFeeStripeLink() async {
    final otherApplicationStripeUrl = _remoteConfigRepository
        .getString(RemoteConfigConstants.otherPaymentsStripeUrl);
    CommonUtils.urlLauncher(url: otherApplicationStripeUrl);
  }

  void applicationFeeStripeLink() async {
    final applicationStripeUrl = _remoteConfigRepository
        .getString(RemoteConfigConstants.newAdmissionStripeUrl);
    CommonUtils.urlLauncher(url: applicationStripeUrl);
  }

  void callUs() {
    final mobileNumber =
        _remoteConfigRepository.getString(RemoteConfigConstants.mobileNumber);
    CommonUtils.openDialer(number: "+44$mobileNumber");
  }
}
