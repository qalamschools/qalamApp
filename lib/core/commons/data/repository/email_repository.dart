import 'package:cloud_functions/cloud_functions.dart';
import 'package:qalam_app/feature/contact_us/models/contact_us_form_model.dart';

abstract class EmailRepository {
  Future<bool> sendEmail(ContactUsFormModel form, {String? subject});
}

class EmailRepositoryImpl implements EmailRepository {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  @override
  Future<bool> sendEmail(ContactUsFormModel form, {String? subject}) async {
    try {
      final HttpsCallable callable = _functions.httpsCallable('sendEmail');
      final result = await callable.call(
        form.toEmailPayload(subject: subject),
      );
      if (result.data['success'] != true) {
        throw Exception('Email sending failed');
      }
      return true;
    } on FirebaseFunctionsException catch (e) {
      throw Exception('Firebase Function Error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected Error: $e');
    }
  }
}
