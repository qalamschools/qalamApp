import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qalam_app/feature/new_and_media/models/new_and_media_model.dart';
import 'package:qalam_app/feature/widgets/custom_new_and_media_item_card.dart';
import 'package:qalam_app/feature/widgets/custom_tab_selector.dart';

class NewAndMediaScreen extends StatelessWidget {
  NewAndMediaScreen({super.key});

  final List<NewAndMediaModel> model = [
    NewAndMediaModel(
        title:
            "Lady Gaga, Bruno Mars - Die With A Smile (Official Music Video)",
        videoUrl: "https://youtu.be/tt9db--Dydo?t=4"),
    NewAndMediaModel(
        title: "JAY SEAN - RIDE IT", videoUrl: "https://youtu.be/TBsKCT4rsPw"),
    NewAndMediaModel(
        title: "Justin Timberlake - TKO (Official Video)",
        videoUrl: "https://youtu.be/FyXtoTLLcDk?t=1"),
    NewAndMediaModel(
        title: "Anuv Jain - HUSN (Official Video)",
        videoUrl: "https://youtu.be/gJLVTKhTnog?t=1")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.contain,
          height: 35,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CustomTabSelector(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.length,
                itemBuilder: (context, index) {
                  final newAndMediaModel = model[index];
                  return CustomNewAndMediaItemCard(
                    title: newAndMediaModel.title,
                    videoUrl: newAndMediaModel.videoUrl,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
