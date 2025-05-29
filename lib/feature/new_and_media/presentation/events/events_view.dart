import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/feature/new_and_media/cubit/event_cubit.dart';
import 'package:qalam_app/feature/widgets/event_card_item_widget.dart';
import 'package:qalam_app/feature/widgets/social_icon_widget.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EventsCubit()..fetchEvents(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<EventsCubit, EventsState>(
              builder: (context, state) {
                if (state.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.error != null) {
                  return Center(child: Text("Error: ${state.error}"));
                } else if (state.events.isEmpty) {
                  return const Center(child: Text("No events available."));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.events.length,
                  itemBuilder: (context, index) {
                    final event = state.events[index];
                    return CustomEventItemCard(
                      event: event,
                    );
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
      ),
    );
  }
}
