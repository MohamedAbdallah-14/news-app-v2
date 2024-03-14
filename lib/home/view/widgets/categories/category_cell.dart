import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/helpers/breakpoints.dart';
import 'package:news_app/home/logic/news/news_cubit.dart';

class CategoryCell extends StatelessWidget {
  const CategoryCell({
    required this.category,
    super.key = const Key('CategoryCell'),
    this.isSelected = false,
  });

  final String category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final category = this.category;

    return GestureDetector(
      onTap: () {
        BlocProvider.of<NewsCubit>(context).selectCategory(category);
      },
      child: Card(
        color: AppColors.darkGray,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              right: BreakPoints.isMobile(context) ? 12 : 24,
            ),
            width: 136,
            child: Text(
              category,
              style: textTheme.headlineMedium?.copyWith(
                color: isSelected ? AppColors.mossyGreen : AppColors.white,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
