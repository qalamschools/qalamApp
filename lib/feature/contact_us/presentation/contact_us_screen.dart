import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/core/utils/common_utils.dart';
import 'package:qalam_app/feature/contact_us/cubit/contact_us_cubit.dart';
import 'package:qalam_app/feature/dashboard/cubit/bottom_navbar_cubit.dart';
import 'package:qalam_app/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:qalam_app/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:qalam_app/feature/widgets/custom_button_widget.dart';
import 'package:qalam_app/feature/widgets/custom_drop_down_widget.dart';
import 'package:qalam_app/feature/widgets/custom_phone_field.dart';
import 'package:qalam_app/feature/widgets/custom_textformfield_widget.dart';
import 'package:qalam_app/feature/widgets/social_icon_widget.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key, required this.contactUsCubit});
  final ContactUsCubit contactUsCubit;
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  void initState() {
    widget.contactUsCubit.fetchReasonForContactingDropdown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactUsCubit, ContactUsState>(
      bloc: widget.contactUsCubit,
      listener: (context, state) {
        if (state is ContactUsErrorState) {
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
        if (state is ContactUsDataState && state.isSubmitted) {
          showSuccessAwesomeDialog();
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          widget.contactUsCubit.toggleDropdown(false);
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: SvgPicture.asset(
              "assets/icons/logo.svg",
              fit: BoxFit.cover,
              width: 100.w,
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  AppImage.contactUs,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 100.h),
                              Text("Contact Us",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 40.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF185B31),
                                  )),
                              SizedBox(height: 25.h),
                              Text(
                                  "Fill in the form below to take the first step, and our team will reach out shortly to begin your journey.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16.sp,
                                      height: 1,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF333333))),
                              SizedBox(height: 45.h),
                              Form(
                                key: widget.contactUsCubit.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextFormWidget(
                                      textStyle: GoogleFonts.nunitoSans(
                                        color: const Color.fromARGB(
                                            255, 71, 71, 71),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      controller:
                                          widget.contactUsCubit.fullname,
                                      isRequired: true,
                                      hintText: "Enter full name here",
                                      labelText: "Full Name",
                                      prefixPath: "assets/icons/person.svg",
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "Full Name is required";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 16.h),
                                    CustomTextFormWidget(
                                      textStyle: GoogleFonts.nunitoSans(
                                        color: const Color.fromARGB(
                                            255, 71, 71, 71),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      controller: widget.contactUsCubit.email,
                                      isRequired: true,
                                      hintText: "Enter email here",
                                      labelText: "Email",
                                      prefixPath: "assets/icons/main.svg",
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "Email is required";
                                        }
                                        if (!CommonUtils.validateEmail(
                                            value.trim())) {
                                          return "Enter a valid email";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20.h),
                                    CustomPhoneField(
                                      textStyle: GoogleFonts.nunitoSans(
                                        color: const Color.fromARGB(
                                            255, 71, 71, 71),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      controller:
                                          widget.contactUsCubit.mobileNumber,
                                      isRequired: true,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10)
                                      ],
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "Mobile number is required";
                                        }
                                        if (value.length != 10) {
                                          return "Enter a valid 10-digit number";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 15.h),
                                    BlocBuilder<ContactUsCubit, ContactUsState>(
                                      bloc: widget.contactUsCubit,
                                      builder: (context, state) {
                                        if (state is! ContactUsDataState) {
                                          return const SizedBox();
                                        }

                                        // final cubit =
                                        //     context.read<ContactUsCubit>();

                                        return CustomMultiSelectDropDown<
                                            String>(
                                          onTap: widget
                                              .contactUsCubit.toggleDropdown,
                                          isExpanded: state.isExpanded,
                                          hintTextStyle: GoogleFonts.nunitoSans(
                                            color: const Color(0xFF7D7D7D),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          items: state.reasons,
                                          itemAsString: (String item) => item,
                                          onSelectionChanged: (p0) {
                                            widget.contactUsCubit
                                                .updateSelectedReasons(p0);
                                          },
                                          selectedTextStyle:
                                              GoogleFonts.nunitoSans(
                                            color: const Color(0xff000000),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textStyle: GoogleFonts.nunitoSans(
                                            color: const Color(0xff000000),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          initialSelection:
                                              state.selectedReason,
                                          textFormFieldDecoration:
                                              InputDecoration(
                                            suffixIcon: Icon(
                                              state.isExpanded
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: const Color(0xff6E727A),
                                            ),
                                            label: Text(
                                              'Reason for Contacting',
                                              style: GoogleFonts.nunitoSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff6E727A),
                                              ),
                                            ),
                                            hintText: "Select reason",
                                            hintStyle: GoogleFonts.nunitoSans(
                                              color: const Color(0xff7D7D7D),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFC4C4C4)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFC4C4C4)),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFC4C4C4)),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    CustomTextFormWidget(
                                      textStyle: GoogleFonts.nunitoSans(
                                        color: const Color.fromARGB(
                                            255, 71, 71, 71),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      controller:
                                          widget.contactUsCubit.comments,
                                      hintText: "Add Comments Here..",
                                      maxLines: 6,
                                    ),
                                    SizedBox(height: 15.h),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BlocBuilder<ContactUsCubit,
                                            ContactUsState>(
                                          bloc: widget.contactUsCubit,
                                          buildWhen: (previous, current) =>
                                              previous != current,
                                          builder: (context, state) {
                                            if (state is! ContactUsDataState) {
                                              return const SizedBox();
                                            }
                                            return SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: Checkbox(
                                                onChanged: (bool? value) {
                                                  widget.contactUsCubit
                                                      .isConsentChecked(
                                                          isConsentChecked:
                                                              value ?? false);
                                                },
                                                value: state.isConsentChecked,
                                                side: WidgetStateBorderSide
                                                    .resolveWith((states) {
                                                  if (states.contains(
                                                      WidgetState.selected)) {
                                                    return const BorderSide(
                                                        color:
                                                            Color(0xff1960FF));
                                                  } else {
                                                    return const BorderSide(
                                                        color:
                                                            Color(0xff1960FF));
                                                  }
                                                }),
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(4.r),
                                                  ),
                                                ),
                                                fillColor:
                                                    WidgetStateProperty.all(
                                                        Colors.white),
                                                checkColor:
                                                    const Color(0xff1960FF),
                                                activeColor:
                                                    const Color(0xff1960FF),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                              "I agree to receiving marketing and promotional materials",
                                              style: GoogleFonts.nunitoSans(
                                                fontSize: 16.sp,
                                                height: 1.2.w,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF000000),
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30.h),
                                    BlocBuilder<ContactUsCubit, ContactUsState>(
                                      bloc: widget.contactUsCubit,
                                      buildWhen: (previous, current) =>
                                          previous != current,
                                      builder: (context, state) {
                                        return CustomButtonWidget(
                                          width: 100.sw,
                                          text: "Submit",
                                          isLoading: (widget.contactUsCubit
                                                  .state as ContactUsDataState)
                                              .isLoading,
                                          onTap: () {
                                            final isValid = widget
                                                    .contactUsCubit
                                                    .formKey
                                                    .currentState
                                                    ?.validate() ??
                                                false;
                                            // final isChecked =
                                            //     (widget.contactUsCubit.state
                                            //             as ContactUsDataState)
                                            //         .isConsentChecked;
                                            if (isValid) {
                                              widget.contactUsCubit
                                                  .submitButton();
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 30.h),
                                    Center(
                                      child: SvgPicture.asset(
                                        AppImage.horizontalIcon,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 30.h),
                                    const SocialIconWidget(),
                                    SizedBox(height: 30.h),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSuccessAwesomeDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      descTextStyle:
          GoogleFonts.nunitoSans(fontWeight: FontWeight.w500, fontSize: 14.sp),
      titleTextStyle:
          GoogleFonts.nunitoSans(fontSize: 16.sp, fontWeight: FontWeight.bold),
      buttonsTextStyle: GoogleFonts.nunitoSans(
          color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500),
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      animType: AnimType.rightSlide,
      title: 'Success',
      desc: 'Thanks for reaching out. We’ll be in touch soon.',
      showCloseIcon: true,
      btnOkOnPress: () {},
      autoDismiss: false,
      onDismissCallback: (type) {
        widget.contactUsCubit.clearFields();
        Navigator.of(context).pop(type);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(
                dashboardCubit: DashboardCubit(),
                bottomNavbarCubit: BottomNavbarCubit(),
              ),
            ));
      },
    ).show();
  }
}
