class ContactUsFormModel {
  final String fullName;
  final String email;
  final String mobile;
  final List<String> reasons;
  final String? comments;

  ContactUsFormModel({
    required this.fullName,
    required this.email,
    required this.mobile,
    required this.reasons,
    this.comments,
  });

  Map<String, dynamic> toEmailPayload({String? subject}) {
    final reasonText = reasons.map((r) => "- $r").join("\n");
    final messageBody = '''
Full Name: $fullName
Email: $email
Mobile: $mobile

Reasons:
$reasonText

${(comments != null && comments!.isNotEmpty) ? "Comments:\n$comments" : ""}
''';

    return {
      'subject': subject,
      'text': messageBody,
    };
  }
}
