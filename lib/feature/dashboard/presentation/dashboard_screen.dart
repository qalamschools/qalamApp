import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qalam_app/feature/admission_and_fee/cubit/admission_and_fee_bloc_cubit.dart';
import 'package:qalam_app/feature/admission_and_fee/presentation/admission_and_fee_screen.dart';
import 'package:qalam_app/feature/dashboard/cubit/bottom_navbar_cubit.dart';
import 'package:qalam_app/feature/dashboard/presentation/home/home.dart';
import 'package:qalam_app/feature/new_and_media/presentation/new_and_media_screen.dart';
import 'package:qalam_app/feature/widgets/custom_bottom_navigation_bar.dart';
import 'package:qalam_app/feature/widgets/more_bottom_sheet_widget.dart';
import 'package:qalam_app/feature/widgets/quick_pay_bottom_sheet_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.bottomNavbarCubit});
  final BottomNavbarCubit bottomNavbarCubit;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => widget.bottomNavbarCubit,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: PopScope(
          canPop: false,
          child: BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
            bloc: widget.bottomNavbarCubit,
            builder: (context, state) {
              return Scaffold(
                bottomSheet: state.isQuickPayOpen
                    ? const QuickPayBottomSheetWidget()
                    : state.isMoreOpen
                        ? const MoreBottomSheetWidget()
                        : null,
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    if (state.selectedIndex == 0) ...{
                      const Home(),
                    } else if (state.selectedIndex == 1)
                      const NewAndMediaScreen()
                    else if (state.selectedIndex == 2)
                      AdmissionAndFeeScreen(
                        admissionAndFeeBlocCubit: AdmissionAndFeeBlocCubit(),
                      ),
                    if (state.isMoreOpen || state.isQuickPayOpen) ...{
                      _buildBackdropOverlay(context),
                    } else ...{
                      const SizedBox.shrink(),
                    },
                  ],
                ),
                bottomNavigationBar:
                    BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
                  bloc: widget.bottomNavbarCubit,
                  builder: (context, state) {
                    return CustomBottomNavigationBar(
                        currentIndex: state.selectedIndex,
                        onTap: (index) {
                          if (index == 3) {
                            context.read<BottomNavbarCubit>().toggleQuickPay();
                          } else if (index == 4) {
                            context.read<BottomNavbarCubit>().toggleMore();
                          } else {
                            context.read<BottomNavbarCubit>().changeTab(index);
                          }
                        });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBackdropOverlay(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: () => context.read<BottomNavbarCubit>().closeSheets(),
        child: Container(
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}
