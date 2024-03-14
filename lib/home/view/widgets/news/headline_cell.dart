import 'package:flutter/material.dart';
import 'package:news_app/core/view/widgets/app_banner.dart';
import 'package:news_app/home/data/model/headline_model/headline_model.dart';
import 'package:news_app/home/view/widgets/news/headline_grid_cell.dart';
import 'package:news_app/l10n/l10n.dart';

class HeadlineCell extends StatelessWidget {
  const HeadlineCell({
    required this.headline,
    required this.index,
    super.key = const Key('HeadlineCell'),
  });
  final HeadlineModel headline;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 12),
      child: headline.favorite
          ? ClipRRect(
              child: AppBanner(
                key: const Key('NewBanner'),
                message: context.l10n.favorite,
                location: BannerLocation.topEnd,
                child: HeadlineGridCell(headline: headline),
              ),
            )
          : HeadlineGridCell(headline: headline),
    );
  }
}
