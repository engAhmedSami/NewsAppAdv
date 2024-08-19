import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/news_home_view_body.dart';

class NewsHomeView extends StatelessWidget {
  const NewsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cUsomAppBar(
        context,
      ),
      body: const NewsHomeViewBody(),
    );
  }

  AppBar cUsomAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesNewsiconRemovebgPreview,
              height: 60,
              width: 40,
            ),
            Text(
              'News',
              style: AppStyles.styleSemiBold24
                  .copyWith(color: AppColors.secondaryColor),
            ),
          ],
        ));
  }
}
