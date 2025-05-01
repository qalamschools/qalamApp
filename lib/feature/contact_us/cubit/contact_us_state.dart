part of 'contact_us_cubit.dart';

sealed class ContactUsState extends Equatable {
  const ContactUsState();

  factory ContactUsState.initial() => const ContactUsDataState(
        isExpanded: false,
        reasons: [
          'Admissions - Al-Qalam Primary School',
          'Admissions - Al-Qalam Secondary School',
          'Flexible Learning NAT5/Highers',
          'After-School Club',
          'Al-Qalam Summer Camp 2025 (wk1&2 £175)',
          'Al-Qalam Summer Camp 2025 (wk1)',
          'Al-Qalam Summer Camp 2025 (wk2)',
        ],
        selectedReason: [],
      );

  @override
  List<Object?> get props => [];
}

class ContactUsDataState extends ContactUsState {
  const ContactUsDataState({
    required this.isExpanded,
    required this.reasons,
    required this.selectedReason,
  });

  final bool isExpanded;
  final List<String> reasons;
  final List<String> selectedReason;

  ContactUsDataState copyWith({
    bool? isExpanded,
    List<String>? reasons,
    List<String>? selectedReason,
  }) {
    return ContactUsDataState(
      isExpanded: isExpanded ?? this.isExpanded,
      reasons: reasons ?? this.reasons,
      selectedReason: selectedReason ?? this.selectedReason,
    );
  }

  @override
  List<Object?> get props => [isExpanded, reasons, selectedReason];
}
