import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/breakpoints.dart';
import 'package:news_app/core/view/widgets/responsive_padding.dart';
import 'package:news_app/home/logic/news/news_cubit.dart';
import 'package:news_app/home/view/widgets/news/headline_cell.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key = const Key('HeadlineList'),
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const Key('HeadlineListSingleChildScrollView'),
      child: ResponsivePadding(
        key: const Key('HeadlineListResponsivePadding'),
        mobilePadding: const EdgeInsets.symmetric(horizontal: 16),
        tabletPadding: const EdgeInsets.symmetric(horizontal: 48),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            final selectedNewsModel = state.selectedNewsModel;
            if (selectedNewsModel == null) {
              return const SizedBox();
            }
            return Column(
              key: const Key('HeadlineListColumn'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(key: Key('HeadlineListSizedBox32'), height: 32),
                Padding(
                  key: const Key('HeadlineListPadding'),
                  padding: EdgeInsets.symmetric(
                    horizontal: BreakPoints.isMobile(context) ? 16 : 8,
                  ),
                  child: Text(
                    key: const Key('HeadlineListSubCategoryText'),
                    selectedNewsModel.category,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const SizedBox(key: Key('HeadlineListSizedBox20'), height: 20),
                if (BreakPoints.isNotMobile(context))
                  LayoutBuilder(
                    key: const Key('HeadlineListLayoutBuilder'),
                    builder: (context, constraints) {
                      final cellWidth = constraints.maxWidth / 2;

                      return GridView.builder(
                        key: const Key('HeadlineListGridView'),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: selectedNewsModel.headlines.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: cellWidth / 210,
                        ),
                        itemBuilder: (context, index) {
                          return HeadlineCell(
                            key: Key('HeadlineCell$index'),
                            headline: selectedNewsModel.headlines[index],
                          );
                        },
                      );
                    },
                  )
                else
                  ListView.builder(
                    key: const Key('HeadlineListListView'),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: selectedNewsModel.headlines.length,
                    itemBuilder: (context, index) {
                      return HeadlineCell(
                        key: Key('HeadlineCell$index'),
                        headline: selectedNewsModel.headlines[index],
                      );
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
