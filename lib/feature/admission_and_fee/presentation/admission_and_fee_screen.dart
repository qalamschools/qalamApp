import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/feature/admission_and_fee/cubit/admission_and_fee_bloc_cubit.dart';
import 'package:qalam_app/feature/widgets/custom_button_widget.dart';
import 'package:qalam_app/feature/widgets/custom_phone_field.dart';
import 'package:qalam_app/feature/widgets/custom_textformfield_widget.dart';

class AdmissionAndFeeScreen extends StatefulWidget {
  const AdmissionAndFeeScreen(
      {super.key, required this.admissionAndFeeBlocCubit});
  final AdmissionAndFeeBlocCubit admissionAndFeeBlocCubit;

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
          child: BlocListener<AdmissionAndFeeBlocCubit, AdmissionAndFeeState>(
            bloc: widget.admissionAndFeeBlocCubit,
            listener: (context, state) {
              if (state is AdmissionAndFeeErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14.sp,
                          height: 1,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  backgroundColor: const Color(0xFFA91936),
                  duration: const Duration(seconds: 2),
                ));
              }
            },
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                title: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                  height: 35,
                ),
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Stack(children: [
                  Image.asset(
                    "assets/images/image_background.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
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
                                    SizedBox(height: 25.h),
                                    Text(
                                        "Start Your child’s Journey at"
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16.sp,
                                            height: 1,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFFA91936))),
                                    SizedBox(height: 15.h),
                                    SvgPicture.asset(
                                      "assets/icons/Arrow_down.svg",
                                    ),
                                    SizedBox(height: 40.h),
                                    BlocBuilder<AdmissionAndFeeBlocCubit,
                                        AdmissionAndFeeState>(
                                      bloc: widget.admissionAndFeeBlocCubit,
                                      builder: (context, state) {
                                        return Column(
                                          children: [
                                            CustomTextFormWidget(
                                              controller: widget
                                                  .admissionAndFeeBlocCubit
                                                  .fullname,
                                              isRequired: true,
                                              hintText: "Enter full name here",
                                              labelText: "Full Name",
                                              prefixPath:
                                                  "assets/icons/person.svg",
                                            ),
                                            SizedBox(height: 16.h),
                                            CustomTextFormWidget(
                                              controller: widget
                                                  .admissionAndFeeBlocCubit
                                                  .email,
                                              isRequired: true,
                                              hintText: "Enter email here",
                                              labelText: "Email",
                                              prefixPath:
                                                  "assets/icons/main.svg",
                                            ),
                                            SizedBox(height: 20.h),
                                            CustomPhoneField(
                                              isRequired: true,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    10)
                                              ],
                                            ),
                                            SizedBox(height: 16.h),
                                            CustomTextFormWidget(
                                              controller: widget
                                                  .admissionAndFeeBlocCubit
                                                  .comments,
                                              hintText: "Add Comments Here..",
                                              maxLines: 6,
                                            ),
                                            SizedBox(height: 15.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 24,
                                                  width: 24,
                                                  child: BlocBuilder<
                                                      AdmissionAndFeeBlocCubit,
                                                      AdmissionAndFeeState>(
                                                    bloc: widget
                                                        .admissionAndFeeBlocCubit,
                                                    builder: (context, state) {
                                                      return Checkbox(
                                                        onChanged:
                                                            (bool? value) {
                                                          widget
                                                              .admissionAndFeeBlocCubit
                                                              .toggleCheckbox(
                                                                  value ??
                                                                      false);
                                                        },
                                                        value: state
                                                                is AdmissionAndFeeCheckboxState
                                                            ? state.isChecked
                                                            : false,
                                                        side:
                                                            WidgetStateBorderSide
                                                                .resolveWith(
                                                                    (states) {
                                                          if (states.contains(
                                                              WidgetState
                                                                  .selected)) {
                                                            return const BorderSide(
                                                                color: Color(
                                                                    0xff1960FF));
                                                          } else {
                                                            return const BorderSide(
                                                                color: Color(
                                                                    0xff1960FF));
                                                          }
                                                        }),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                4.r),
                                                          ),
                                                        ),
                                                        fillColor:
                                                            WidgetStateProperty
                                                                .all(Colors
                                                                    .white),
                                                        checkColor: const Color(
                                                            0xff1960FF),
                                                        activeColor:
                                                            const Color(
                                                                0xff1960FF),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                Expanded(
                                                  child: Text(
                                                      "I agree to receiving marketing and promotional materials",
                                                      style: GoogleFonts
                                                          .nunitoSans(
                                                        fontSize: 16.sp,
                                                        height: 1.2.w,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF000000),
                                                      )),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 30.h),
                                            CustomButtonWidget(
                                              width: 100.sw,
                                              text: "Submit",
                                              onTap: () {
                                                widget.admissionAndFeeBlocCubit
                                                    .submitButton();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(height: 10.h),
                                    SizedBox(height: 30.h),
                                  ]),
                            )),
                          ]))
                ]),
              ),
            ),
          ),
        ));
  }
}
