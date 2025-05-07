import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qalam_app/feature/new_and_media/cubit/new_and_media_cubit.dart';
import 'package:qalam_app/feature/new_and_media/models/new_and_media_model.dart';
import 'package:qalam_app/feature/widgets/custom_new_and_media_item_card.dart';

class NewsAndMediaView extends StatelessWidget {
  const NewsAndMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: BlocBuilder<NewAndMediaCubit, NewAndMediaState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.model?.length,
            itemBuilder: (context, index) {
              NewAndMediaModel? newAndMediaModel = state.model?[index];
              return CustomNewAndMediaItemCard(
                newAndMediaModel: newAndMediaModel,
              );
            },
          );
        },
      ),
    );
  }
}
