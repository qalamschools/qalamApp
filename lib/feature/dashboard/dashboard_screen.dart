import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/utils/common_utils.dart';
import 'package:qalam_app/feature/admission_and_fee/bloc/cubit/admission_and_fee_bloc_cubit.dart';
import 'package:qalam_app/feature/admission_and_fee/presentation/admission_and_fee_screen.dart';
import 'package:qalam_app/feature/dashboard/home/home.dart';
import 'package:qalam_app/feature/widgets/custom_bottom_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
          floatingActionButton: SpeedDial(
            childMargin: const EdgeInsets.all(10),
            overlayOpacity: 0.5,
            switchLabelPosition: false,
            iconTheme: const IconThemeData(
              color: Color(0xFFFFFFFF),
            ),
            activeIcon: Icons.close,
            backgroundColor: const Color(0xff185B31),
            children: [
              SpeedDialChild(
                labelBackgroundColor: const Color(0xff185B31),
                backgroundColor: const Color(0xff185B31),
                shape: const CircleBorder(),
                label: "About Us",
                labelStyle: GoogleFonts.playfairDisplay(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                onTap: () {
                  BlocProvider<AdmissionAndFeeBlocCubit>(
                    create: (context) => AdmissionAndFeeBlocCubit(),
                    child: AdmissionAndFeeScreen(
                      admissionAndFeeBlocCubit: AdmissionAndFeeBlocCubit(),
                    ),
                  );
                },
              ),
              SpeedDialChild(
                labelBackgroundColor: const Color(0xff185B31),
                backgroundColor: const Color(0xff185B31),
                shape: const CircleBorder(),
                label: 'Admissions & Fees',
                labelStyle: GoogleFonts.playfairDisplay(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdmissionAndFeeScreen(
                        admissionAndFeeBlocCubit: AdmissionAndFeeBlocCubit(),
                      ),
                    ),
                  );
                },
              ),
            ],
            child: Center(
              child: SvgPicture.asset("assets/icons/plus.svg",
                  height: 16.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFFFFFFF),
                    BlendMode.srcIn,
                  )),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          backgroundColor: Colors.white,
          body: const Home(),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xffE3E3E3),
                  width: 1,
                ),
              ),
            ),
            child: BottomAppBar(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              shadowColor: Colors.white,
              shape: const CircularNotchedRectangle(),
              child: CustomBottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index, name) {
                  setState(() {
                    currentIndex = index;
                  });
                  if (index == 2) {
                    CommonUtils.openDialer(number: "+91722126941");
                  }
                },
              ), // Makes room for FAB
            ),
          ),
        ));
  }
}
