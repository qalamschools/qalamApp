import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qalam_app/core/commons/data/repository/remote_config_repo.dart';
import 'package:qalam_app/core/constants/firebase_strings.dart';
import 'package:qalam_app/core/constants/remote_config_constants.dart';
import 'package:qalam_app/core/utils/common_utils.dart';
import 'package:qalam_app/feature/web_view_screen/presentation/webview_screen.dart';
import 'package:qalam_app/main.dart';
import 'package:timezone/timezone.dart' as tz;

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

  Future<List<Map<String, dynamic>>> getAllValidAds() async {
    try {
      final querySnapshot =
          await firestore.collection(FirebaseConstants.adsCollection).get();

      if (querySnapshot.size == 0) return [];

      final validAds = <Map<String, dynamic>>[];

      for (final doc in querySnapshot.docs) {
        final adData = doc.data() as Map<String, dynamic>?;
        if (adData != null && _isAdValidForCurrentDate(adData)) {
          adData['docId'] = doc.id;
          validAds.add(adData);
        }
      }

      return validAds;
    } catch (e) {
      print('Error fetching ads: $e');
      return [];
    }
  }

  bool _isAdValidForCurrentDate(Map<String, dynamic> adData) {
    try {
      final london = tz.getLocation('Europe/London');
      final currentUKTime = tz.TZDateTime.now(london);

      final startDate = _parseFirebaseDate(adData['start_date']);
      final endDate = _parseFirebaseDate(adData['end_date']);

      if (startDate == null || endDate == null) {
        return false;
      }

      final startDateUK = tz.TZDateTime.from(startDate, london);
      final endDateUK = tz.TZDateTime.from(endDate, london);

      final isWithinDateRange = currentUKTime
              .isAfter(startDateUK.subtract(const Duration(seconds: 1))) &&
          currentUKTime.isBefore(endDateUK.add(const Duration(seconds: 1)));

      if (!isWithinDateRange) {
        return false;
      }

      final startHour = adData['startHour'] as int?;
      final endHour = adData['endHour'] as int?;

      if (startHour != null && endHour != null) {
        final currentHour = currentUKTime.hour;

        bool isWithinTimeRange;
        if (startHour <= endHour) {
          isWithinTimeRange = currentHour >= startHour && currentHour < endHour;
        } else {
          isWithinTimeRange = currentHour >= startHour || currentHour < endHour;
        }

        if (!isWithinTimeRange) {
          return false;
        }
      }

      return true;
    } catch (e) {
      print('Error validating ad date: $e');
      return false;
    }
  }

  DateTime? _parseFirebaseDate(dynamic dateField) {
    if (dateField == null) return null;

    try {
      if (dateField is Timestamp) {
        return dateField.toDate();
      } else if (dateField is String) {
        return DateTime.parse(dateField);
      } else if (dateField is DateTime) {
        return dateField;
      }
    } catch (e) {
      print('Error parsing date: $e');
    }
    return null;
  }
}
