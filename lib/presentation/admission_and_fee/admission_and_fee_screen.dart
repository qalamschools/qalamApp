import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/presentation/widgets/custom_button_widget.dart';
import 'package:qalam_app/presentation/widgets/custom_textformfield_widget.dart';

class AdmissionAndFeeScreen extends StatefulWidget {
  const AdmissionAndFeeScreen({super.key});

  @override
  State<AdmissionAndFeeScreen> createState() => _AdmissionAndFeeScreenState();
}

class _AdmissionAndFeeScreenState extends State<AdmissionAndFeeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Stack(children: [
                Image.asset(
                  "assets/images/admission&feesBackground.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 280),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/vertical_line.svg",
                                  ),
                                  SizedBox(height: 15.h),
                                  Text("only £350/Month",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 40.sp,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF185B31),
                                      )),
                                  SizedBox(height: 15.h),
                                  Text(
                                      "Fill in the form below to take the first step, and our team will reach out shortly to begin your journey.",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunitoSans(
                                        fontSize: 16.sp,
                                        height: 1,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF185B31),
                                      )),
                                  SizedBox(height: 15.h),
                                  SvgPicture.asset(
                                    "assets/icons/Arrow_down.svg",
                                  ),
                                  SizedBox(height: 20.h),
                                  CustomTextFormWidget(
                                    hintText: "Enter full name here",
                                    labelText: "Full Name",
                                    prefixPath: "assets/icons/person.svg",
                                  ),
                                  SizedBox(height: 16.h),
                                  CustomTextFormWidget(
                                    hintText: "Enter email here",
                                    labelText: "Email",
                                    prefixPath: "assets/icons/main.svg",
                                  ),
                                  SizedBox(height: 16.h),
                                  CustomTextFormWidget(
                                    hintText: "Add Comments Here..",
                                    maxLines: 6,
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomButtonWidget(
                                    width: 100.sw,
                                    text: "Submit",
                                  ),
                                  SizedBox(height: 10.h),
                                ]),
                          )),
                        ]))
              ]),
            ),
          ),
        ));
  }
}
