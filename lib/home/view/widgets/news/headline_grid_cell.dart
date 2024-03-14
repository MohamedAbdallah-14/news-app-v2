import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/home/data/model/headline_model/headline_model.dart';

class HeadlineGridCell extends StatelessWidget {
  const HeadlineGridCell({
    required this.headline,
    super.key = const Key('HeadlineGridCell'),
  });
  final HeadlineModel headline;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.darkGrayIV,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.darkGrayIII,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            headline.title,
                            style: textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Text(
                              headline.description,
                              style: textTheme.bodyMedium,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
