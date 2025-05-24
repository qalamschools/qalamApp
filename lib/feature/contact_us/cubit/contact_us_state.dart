part of 'contact_us_cubit.dart';

sealed class ContactUsState extends Equatable {
  const ContactUsState();
  const ContactUsState._();

  factory ContactUsState.initial() => const ContactUsDataState(
        isExpanded: false,
        reasons: [],
        selectedReason: [],
        isChecked: false,
        isConsentChecked: false,
        hasError: false,
        isSubmitted: false,
        isLoading: false
      );

  factory ContactUsState.error(String message) =>
      ContactUsErrorState._(message);

  factory ContactUsState.success(String message) =>
      ContactUsSuccessState._(message);

  @override
  List<Object?> get props => [];
}

class ContactUsDataState extends ContactUsState {
  const ContactUsDataState({
    required this.isExpanded,
    required this.reasons,
    required this.selectedReason,
    required this.isChecked,
    required this.hasError,
    required this.isConsentChecked,
    required this.isSubmitted,
    required this.isLoading,
  });

  final bool isExpanded;
  final List<String> reasons;
  final List<String> selectedReason;
  final bool isChecked;
  final bool hasError;
  final bool isConsentChecked;
  final bool isSubmitted;
  final bool isLoading;

  ContactUsDataState copyWith({
    bool? isExpanded,
    List<String>? reasons,
    List<String>? selectedReason,
    bool? isChecked,
    bool? hasError,
    bool? isConsentChecked,
    bool? isSubmitted,
    bool? isLoading,
  }) {
    return ContactUsDataState(
      isLoading: isLoading ?? this.isLoading,
      isExpanded: isExpanded ?? this.isExpanded,
      reasons: reasons ?? this.reasons,
      selectedReason: selectedReason ?? this.selectedReason,
      isChecked: isChecked ?? this.isChecked,
      hasError: hasError ?? this.hasError,
      isConsentChecked: isConsentChecked ?? this.isConsentChecked,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  @override
  List<Object?> get props => [
        isExpanded,
        reasons,
        selectedReason,
        isChecked,
        hasError,
        isConsentChecked,
        isSubmitted,
        isLoading,
      ];
}

class ContactUsErrorState extends ContactUsState {
  final String message;

  const ContactUsErrorState._(this.message) : super._();

  @override
  List<Object?> get props => [message];
}

class ContactUsSuccessState extends ContactUsState {
  final String message;

  const ContactUsSuccessState._(this.message) : super._();

  @override
  List<Object?> get props => [message];
}
