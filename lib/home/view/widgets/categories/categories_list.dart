import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/logic/news/news_cubit.dart';
import 'package:news_app/home/view/widgets/categories/category_cell.dart';
import 'package:news_app/home/view/widgets/categories/scroll_button.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key = const Key('CategoriesList'),
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      key: const Key('CategoriesListBlocBuilder'),
      builder: (context, state) {
        return ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: kIsWeb ? 840 : double.infinity,
          ),
          child: SizedBox(
            key: const Key('CategoriesListSizedBox'),
            height: 150,
            child: Row(
              key: const Key('CategoriesListRow'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScrollButton(
                  key: const Key('CategoriesListScrollButtonLeft'),
                  controller: _scrollController,
                  isLeft: true,
                ),
                Expanded(
                  key: const Key('CategoriesListExpanded'),
                  child: ListView.builder(
                    key: const Key('CategoriesListListView'),
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories?.length ?? 0,
                    itemBuilder: (context, index) => CategoryCell(
                      category: state.categories![index],
                      isSelected:
                          state.selectedCategory == state.categories?[index],
                    ),
                  ),
                ),
                ScrollButton(
                  key: const Key('CategoriesListScrollButtonRight'),
                  controller: _scrollController,
                  isLeft: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
