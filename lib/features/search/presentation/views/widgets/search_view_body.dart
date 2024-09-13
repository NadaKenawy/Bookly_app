import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/build_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          BuildSearchTextField(),
          SizedBox(height: 20),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          SizedBox(height: 4),
          Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}
