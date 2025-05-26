import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/feature/new_and_media/cubit/new_and_media_cubit.dart';
import 'package:qalam_app/feature/new_and_media/cubit/tab_selector_cubit.dart';
import 'package:qalam_app/feature/new_and_media/presentation/events/events_view.dart';
import 'package:qalam_app/feature/new_and_media/presentation/new_and_media/news_and_media_view.dart';
import 'package:qalam_app/feature/widgets/custom_tab_selector.dart';
import 'package:qalam_app/feature/widgets/social_icon_widget.dart';

class NewAndMediaScreen extends StatelessWidget {
  const NewAndMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewAndMediaCubit()),
        BlocProvider(create: (_) => TabSelectorCubit()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: SvgPicture.asset(
            "assets/icons/logo.svg",
            fit: BoxFit.cover,
            width: 100.w,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: BlocBuilder<TabSelectorCubit, TabSelectorState>(
                builder: (context, state) {
                  return CustomTabSelector(
                    initialIsNewsSelected: state.selectedTab == TabType.news,
                    onTabChanged: (isNewsSelected) {
                      context.read<TabSelectorCubit>().selectTab(
                          isNewsSelected ? TabType.news : TabType.events);
                    },
                  );
                },
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<TabSelectorCubit, TabSelectorState>(
                builder: (context, state) {
                  if (state.selectedTab == TabType.news) {
                    return const NewsAndMediaView();
                  } else {
                    return const EventsView();
                  }
                },
              ),
            ),
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
      ),
    );
  }
}
