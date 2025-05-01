part of 'admission_and_fee_bloc_cubit.dart';

sealed class AdmissionAndFeeState extends Equatable {
  const AdmissionAndFeeState._();

  // Factory method to create different states
  factory AdmissionAndFeeState.initial({bool isChecked = false}) =>
      AdmissionAndFeeInitialState._(isChecked: isChecked);
  factory AdmissionAndFeeState.loading() =>
      const AdmissionAndFeeLoadingState._();
  factory AdmissionAndFeeState.loaded(String data) =>
      AdmissionAndFeeLoadedState._(data);
  factory AdmissionAndFeeState.error(String message) =>
      AdmissionAndFeeErrorState._(message);
  factory AdmissionAndFeeState.checkboxChanged(bool isChecked) =>
      AdmissionAndFeeCheckboxState._(isChecked: isChecked);

  @override
  List<Object?> get props => [];
}

// Initial State

class AdmissionAndFeeInitialState extends AdmissionAndFeeState {
  final bool isChecked;

  const AdmissionAndFeeInitialState._({required this.isChecked}) : super._();

  @override
  List<Object?> get props => [isChecked];
}

// Loading State
class AdmissionAndFeeLoadingState extends AdmissionAndFeeState {
  const AdmissionAndFeeLoadingState._() : super._();
}

// Loaded State
class AdmissionAndFeeLoadedState extends AdmissionAndFeeState {
  final String data;

  const AdmissionAndFeeLoadedState._(this.data) : super._();

  @override
  List<Object?> get props => [data];
}

// Error State
class AdmissionAndFeeErrorState extends AdmissionAndFeeState {
  final String message;

  const AdmissionAndFeeErrorState._(this.message) : super._();

  @override
  List<Object?> get props => [message];
}

class AdmissionAndFeeCheckboxState extends AdmissionAndFeeState {
  final bool isChecked;

  const AdmissionAndFeeCheckboxState._({required this.isChecked}) : super._();

  @override
  List<Object?> get props => [isChecked];
}
