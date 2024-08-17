import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Featuers/home/data/Model/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.datasmodel});
  final DatasModel datasmodel;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl('${datasmodel.url}'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: datasmodel.image ?? 'assets/images/newsphoto.jpg',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Image(
                image: AssetImage('assets/images/newsphoto.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            datasmodel.title,
            style: AppStyles.styleSemiBold16,
            maxLines: 3,
            overflow: TextOverflow.fade,
          ),
          const SizedBox(height: 8),
          Text(
            datasmodel.description ?? '',
            maxLines: 3,
            style: AppStyles.styleMedium13,
          ),
          const SizedBox(height: 15),
          const Divider(
            color: AppColors.secondaryColor,
            height: BorderSide.strokeAlignCenter,
            thickness: 1.5,
          ),
          const SizedBox(height: 5),
          const Divider(
            color: AppColors.secondaryColor,
            height: BorderSide.strokeAlignCenter,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
