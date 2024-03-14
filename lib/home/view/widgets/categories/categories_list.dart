import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/logic/news/news_cubit.dart';
import 'package:news_app/home/view/widgets/categories/category_cell.dart';
import 'package:news_app/home/view/widgets/categories/scroll_button.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    required this.isHidden,
    super.key = const Key('CategoriesList'),
  });

  final bool isHidden;

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    );

    expandContainer();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CategoriesList oldWidget) {
    super.didUpdateWidget(oldWidget);

    expandContainer();
  }

  void expandContainer() {
    if (widget.isHidden) {
      controller.reverse();
    } else {
      controller.forward();
    }
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
          child: SizeTransition(
            key: const Key('CategoriesListSizeTransition'),
            sizeFactor: animation,
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
          ),
        );
      },
    );
  }
}
