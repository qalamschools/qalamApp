part of 'bottom_navbar_cubit.dart';

class BottomNavbarState extends Equatable {
  final int selectedIndex;
  final bool isQuickPayOpen;
  final bool isMoreOpen;

  const BottomNavbarState({
    required this.selectedIndex,
    this.isQuickPayOpen = false,
    this.isMoreOpen = false,
  });

  BottomNavbarState copyWith({
    int? selectedIndex,
    bool? isQuickPayOpen,
    bool? isMoreOpen,
  }) {
    return BottomNavbarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isQuickPayOpen: isQuickPayOpen ?? this.isQuickPayOpen,
      isMoreOpen: isMoreOpen ?? this.isMoreOpen,
    );
  }

  @override
  List<Object> get props => [selectedIndex, isQuickPayOpen, isMoreOpen];
}
